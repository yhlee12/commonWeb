using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace T2LHomePage
{
    public class menu
    {
        public string title { get; set; }
        public string path { get; set; }
        public string key { get; set; }
        public List<subMenu> subMenu { get; set; }
    }

    public class subMenu
    {
        public string title { get; set; }
        public string path { get; set; }
        public string Pkey { get; set; }
        public string key { get; set; }
        public bool showFlag { get; set; }
        public string subPageTitle { get; set; }
        public string subPageSubTitle { get; set; }
        public string subPageImageLink { get; set; }
        public bool otherFlag { get; set; }
    }
}