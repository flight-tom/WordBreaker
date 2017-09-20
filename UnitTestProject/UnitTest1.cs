using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WordBreaker;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            PttTracer tracer = new PttTracer();
            tracer.Start();
            //tracer.Start("https://www.ptt.cc/bbs/Gossiping/index.html");
        }
    }
}
