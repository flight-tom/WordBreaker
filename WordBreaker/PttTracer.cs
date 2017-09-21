using HtmlAgilityPack;
using log4net;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace WordBreaker
{
    public class PttTracer
    {
        private static readonly ILog _logger = LogManager.GetLogger(typeof(PttTracer));
        private static readonly MD5 _md5 = MD5.Create();
        public PttTracer()
        {
        }

        public void Start()
        {
            string url_format = "https://www.ptt.cc/bbs/Gossiping/index{0}.html";
            for (int i = 1; i < 50; i++)
            {
                HttpWebRequest request = HttpWebRequest.CreateHttp(string.Format(url_format, i));
                request.Timeout = 10000;//设置10秒超时
                request.Proxy = null;
                request.Method = "GET";
                request.UserAgent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36";
                request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";
                request.CookieContainer = new CookieContainer();
                request.CookieContainer.Add(new Cookie() { Name = "over18", Value = "1", Domain = "www.ptt.cc", Expired = false });
                string html = null;
                using (WebResponse response = request.GetResponse())
                {
                    using (var reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                    {
                        html = reader.ReadToEnd();
                        reader.Close();
                    }
                    response.Close();
                }
                Debug.WriteLine(html);
                HtmlDocument doc = new HtmlDocument();
                doc.LoadHtml(html);
                foreach (var node in doc.DocumentNode.SelectNodes("//a"))
                    if (node.Attributes["href"] != null && !string.IsNullOrEmpty(node.Attributes["href"].Value) && node.Attributes["href"].Value.Contains("M."))
                        Handle(node);
                using (var db = new WordBreakerDataContext())
                    db.DeleteKeywords(1);
            }
        }

        private void Handle(HtmlNode node)
        {
            string url = (null == node.Attributes["href"]) ? null : node.Attributes["href"].Value;
            url = string.Format("https://www.ptt.cc{0}", url);
            HttpWebRequest request = HttpWebRequest.CreateHttp(url);
            request.Timeout = 10000;//设置10秒超时
            request.Proxy = null;
            request.Method = "GET";
            request.UserAgent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36";
            request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";
            request.CookieContainer = new CookieContainer();
            request.CookieContainer.Add(new Cookie() { Name = "over18", Value = "1", Domain = "www.ptt.cc", Expired = false });
            string html = null;
            using (WebResponse response = request.GetResponse())
            {
                using (var reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    html = reader.ReadToEnd();
                    reader.Close();
                }
                response.Close();
            }
            byte[] b = Encoding.UTF8.GetBytes(url);
            string pHmac = MD5HashedBase64(b);
            long? url_id = 0;
            using (var db = new WordBreakerDataContext())
                db.InsertVisitedUrl(url, pHmac, ref url_id);

            if ((url_id ?? 0) == 0) return;

            HtmlDocument doc = new HtmlDocument();
            doc.LoadHtml(html);
            var d = doc.GetElementbyId("main-content");
            if (null != d)
            {
                List<HtmlNode> removing_nodes = new List<HtmlNode>();
                foreach (var d2 in d.ChildNodes)
                {
                    if (d2.Attributes["class"] != null && d2.Attributes["class"].Value == "push")
                    {
                        string push_direct = "";
                        var d3 = d2.SelectSingleNode("span[@class='f1 hl push-tag']");
                        if (d3 == null) 
                            d3 = d2.SelectSingleNode("span[@class='hl push-tag']");

                        if (d3 != null)
                            push_direct = d3.InnerText.Trim();

                        var push_str = CleanString(d2.SelectSingleNode("span[@class='f3 push-content']").InnerText.Trim());
                        float positive_score = 0;
                        switch (push_direct)
                        {
                            case "噓":
                                positive_score = -1;
                                break;
                            case "推":
                                positive_score = 1;
                                break;
                        }
                        using (var db = new WordBreakerDataContext())
                            for (int i = 0; i < push_str.Length; i++)
                            {
                                if ((i + 1) < push_str.Length)
                                    db.InsertKeyword(push_str.Substring(i, 2), positive_score, url_id);
                                else
                                    db.InsertKeyword(push_str.Substring(i), positive_score, url_id);
                            }
                        removing_nodes.Add(d2);
                    }
                    else
                    {
                        removing_nodes.Add(d2);
                    }
                }
                foreach (var r in removing_nodes)
                    d.ChildNodes.Remove(r);

                string content = CleanString(d.InnerText);
                using (var db = new WordBreakerDataContext())
                    for (int i = 0; i < content.Length; i++)
                    {
                        if ((i + 1) < content.Length)
                            db.InsertKeyword(content.Substring(i, 2), 0, url_id);
                        else
                            db.InsertKeyword(content.Substring(i), 0, url_id);
                    }
            }
        }

        private static string CleanString(string input)
        {
            string remove_str = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:;?'\"][{}\\|`~,./!@#$%^&*()_+=-～！＠＃＄％︿＆＊ꨠ →（）１２３４５６７８９０［］｛｝＋＝－＿＼／＜＞。，；：＂’？ꨠ ＝→　⊙★□￣○⊙〝︵∕￣‵Д′╧︵〞「」、…─┐";
            input = input.Replace(" ", string.Empty);
            input = input.Replace("\r\n", string.Empty);
            for (int i = 0; i < remove_str.Length; i++)
                input = input.Replace(remove_str[i].ToString(), string.Empty);

            return input;
        }
        private static string MD5HashedBase64(byte[] b)
        {
            return Convert.ToBase64String(_md5.ComputeHash(b));
        }
    }
}