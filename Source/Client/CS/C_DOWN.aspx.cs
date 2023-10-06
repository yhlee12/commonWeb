using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Client.CS
{
    public partial class C_DOWN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void download_WiseOfficeApp(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=WiseMobile.apk");
            Response.WriteFile(Server.MapPath("/content/downloads/WiseMobile_20180206.apk"));
            Response.End();
        }
        protected void download_ShippingDailyApp(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=ShippingDaily.apk");
            Response.WriteFile(Server.MapPath("/content/downloads/app-release.apk"));
            Response.End();
        }

        protected void Carrier_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=KLNet_CARRIER(선사용).doc");
            Response.WriteFile(Server.MapPath("/content/downloads/KLNet_CARRIER(선사용).doc"));
            Response.End();
        }
        protected void FWD_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=KLNet_FWD(포워더용).doc");
            Response.WriteFile(Server.MapPath("/content/downloads/KLNet_FWD(포워더용).doc"));
            Response.End();
        }
        protected void inspect_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=KLNet_INSPECT(검수사용).hwp");
            Response.WriteFile(Server.MapPath("/content/downloads/KLNet_INSPECT(검수사용).hwp"));
            Response.End();
        }
        protected void KLNet_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=KLNet_TMS(운송사용).hwp");
            Response.WriteFile(Server.MapPath("/content/downloads/KLNet_TMS(운송사용).hwp"));
            Response.End();
        }
        //
        protected void KLINE_AGENT_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=KOCOA_Manual_V0.20.pdf");
            Response.WriteFile(Server.MapPath("/content/downloads/KOCOA_Manual_V0.20.pdf"));
            Response.End();
        }
        protected void DOBO_AGENT_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=TPLS_Manual_해운대리점.pdf");
            Response.WriteFile(Server.MapPath("/content/downloads/TPLS_Manual_해운대리점.pdf"));
            Response.End();
        }

        //
        protected void wise1_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_1.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_1.mp4"));
            Response.End();
        }
        protected void wise2_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_2.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_2.mp4"));
            Response.End();
        }
        protected void wise3_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_3.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_3.mp4"));
            Response.End();
        }
        protected void wise4_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_4.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_4.mp4"));
            Response.End();
        }
        protected void wise5_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_5.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_5.mp4"));
            Response.End();
        }
        protected void wise6_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_6.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_6.mp4"));
            Response.End();
        }
        protected void wise7_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_7.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_7.mp4"));
            Response.End();
        }
        protected void wise8_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_8.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_8.mp4"));
            Response.End();
        }
        protected void wise9_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_9.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_9.mp4"));
            Response.End();
        }
        protected void wise10_ServerClick(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=wiseplatform_10.mp4");
            Response.WriteFile(Server.MapPath("/content/downloads/wiseplatform_10.mp4"));
            Response.End();
        }

        protected void download_tripApp(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=tripApp.apk");
            Response.WriteFile(Server.MapPath("/content/downloads/app-debug.apk"));
            Response.End();
        }

        //정현 추가
        protected void download_tplsSetup(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=tplsSetup.exe");
            Response.WriteFile(Server.MapPath("/content/downloads/tplsSetup.exe"));
            Response.End();
        }
        protected void download_tpls_MANUAL(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=BOMS_Manual_v1.01.pptx");
            Response.WriteFile(Server.MapPath("/content/downloads/BOMS_Manual_v1.01.pptx"));
            Response.End();
        }

    }
}