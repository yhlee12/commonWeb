using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace T2LHomePage
{
    [Serializable()]
    public class T2LHomePageinfo
    {
        public string USER_SID { get; set; }
        public string USER_ID { get; set; }
        public string USER_NAME { get; set; }
        public string MOBILE_NO { get; set; }
        public string EMAIL_ADDRESS { get; set; }
    }
}