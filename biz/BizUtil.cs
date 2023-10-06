using System;
using System.IO;
using System.Configuration;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;
using System.IO.Compression;
using System.Text;

namespace T2LHomePage
{
    public static class BizUtil
    {
        public enum eGubn { NULL, PARAMETER, SQL, PROCEDURE };
        public enum eType { NULL, VARCHAR, INT, DOUBLE, INT64, DECIMAL, CURSOR, CLOB, BLOB };
        public enum eInOut { NULL, IN, OUT, INOUT };
        public enum eSize { NULL, S_100, S_500, S1000, S4000 };
        public enum eLang { KOR = 0, ENG = 1, CHN = 2 };

        static public string tempPath = ConfigurationManager.AppSettings["TempPath"];
        static public string mailServer = ConfigurationManager.AppSettings["MailServer"];
        static public string mailPort = ConfigurationManager.AppSettings["MailPort"];
        static public string mailUser = ConfigurationManager.AppSettings["MailUser"];
        static public string mailPass = ConfigurationManager.AppSettings["MailPass"];
        
        static string sessionStr = "sesUserInfo";

        public static string CRUDColNm = "_CRUD_";
        public static string SQLDelimeter = "_SQL_DELIMETER_";
        
        static public Version AppVersion
        {
            get
            {
                return System.Reflection.Assembly.GetExecutingAssembly().GetName().Version;
            }
        }
        static public DateTime BuildDate
        {
            get
            {
                System.Version assemblyVersion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version;
                DateTime buildDate = new DateTime(2000, 1, 1).AddDays(assemblyVersion.Build).AddSeconds(assemblyVersion.Revision * 2);

                return buildDate;
            }
        }
        //USER INFO GET Travel
        public static T2LHomePageinfo getT2LHomePageinfo(System.Web.SessionState.HttpSessionState ses, System.Web.HttpRequest req)
        {
            T2LHomePageinfo ret = null;
            if (ses[sessionStr] != null)
            {
                ret = (T2LHomePageinfo)ses[sessionStr];
            }
            else
            {
                ret = new T2LHomePageinfo();
            }
            return ret;
        }

        public static bool setT2LHomePageinfo(System.Web.HttpRequest req, System.Web.SessionState.HttpSessionState ses, DataTable dt)
        {
            bool ret = true;
            T2LHomePageinfo userInfo = new T2LHomePageinfo();

            userInfo.USER_SID = dt.Rows[0]["USER_SID"].ToString();
            userInfo.USER_ID = dt.Rows[0]["USER_ID"].ToString();
            userInfo.USER_NAME = dt.Rows[0]["USER_NAME"].ToString();
            userInfo.MOBILE_NO = dt.Rows[0]["MOBILE_NO"].ToString();
            userInfo.EMAIL_ADDRESS = dt.Rows[0]["EMAIL_ADDRESS"].ToString();

            ses[sessionStr] = userInfo;

            return ret;
        }

        /*
         * DevExpress HidenField 값을 Hashtable 로 복사함
         * */
        public static void setDevHiddenFieldToHashtable(DevExpress.Web.ASPxHiddenField hidField, Hashtable ht)
        {
            foreach (var item in hidField)
            {
                ht.Add(item.Key, item.Value);
            }
        }

        /*
         * Data Row[0] 컬럼값을 DevExpress HiddenField 로 복사함
         * */
        public static void setDataSetToDevHiddenField(DataSet ds, DevExpress.Web.ASPxHiddenField hidField)
        {
            DataTable dt = ds.Tables[0];
            foreach (DataColumn dc in dt.Columns)
            {
                string col = dc.ColumnName.ToUpper();       //컬럼명을 대문자로 변환함!
                if (dt.Rows.Count == 0)
                {
                    hidField[col] = "";
                }
                else
                {
                    hidField[col] = dt.Rows[0][col].ToString();
                }                
            }

        }

        public static void setDataSetToDevHiddenField(DataTable dt, DevExpress.Web.ASPxHiddenField hidField)
        {
            foreach (DataColumn dc in dt.Columns)
            {
                string col = dc.ColumnName.ToUpper();       //컬럼명을 대문자로 변환함!
                if (dt.Rows.Count == 0)
                {
                    hidField[col] = "";
                }
                else
                {
                    hidField[col] = dt.Rows[0][col].ToString();
                }
            }

        }

        /*
         * Dataset 컬럼값이 null 이면 공백(Blank) 변환함
         * */
        public static DataSet setDataSetNullToBlank(DataSet ds)
        {
            for (int j = 0; j < ds.Tables[0].Columns.Count; j++)        // 열
            {
                if (ds.Tables[0].Columns[j].DataType.ToString() == "System.String")
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)       // 행
                    {
                        if (DBNull.Value.Equals(ds.Tables[0].Rows[i][j]))
                        {
                            ds.Tables[0].Rows[i][j] = "";
                        }
                    }
                }
            }

            return ds;
        }
        /*
         * DataTable Row값이 null 이면 공백(Blank) 변환함
         * */
        public static DataTable setDataTableNullToBlank(DataSet ds, string tablename)
        {
            DataTable dt = ds.Tables[tablename];
            DataRow dr = null;
            dr = dt.NewRow();
            foreach(DataColumn dc in dt.Columns)
            {
                if (dc.DataType.ToString() == "System.String")
                {
                    dr[dc.ColumnName] = "";
                }
                else if (dc.DataType.ToString() == "System.DateTime")
                {
                    dr[dc.ColumnName] = "";
                }
                else if (dc.DataType.ToString() == "System.Decimal")
                {
                    dr[dc.ColumnName] = 0;
                }
                else if (dc.DataType.ToString() == "System.Single")
                {
                    dr[dc.ColumnName] = 0;
                }
            }
            dt.Rows.Add(dr);
            return ds.Tables[tablename];
        }
        /*
         * Dataview 컬럼값이 null 이면 공백(Blank) 변환함
         * */
        public static DataView setDataViewSetNullToBlank(DataView dv)
        {
            for (int j = 0; j < dv.Table.Columns.Count; j++)        // 열
            {
                if (dv.Table.Columns[j].DataType.ToString() == "System.String")
                {
                    for (int i = 0; i < dv.Table.Rows.Count; i++)       // 행
                    {
                        if (DBNull.Value.Equals(dv.Table.Rows[i][j]))
                        {
                            dv.Table.Rows[i][j] = "";
                        }
                    }
                }
            }

            return dv;
        }

        public static System.Type getType(string type)
        {
            System.Type retType = null;

            switch (type)
            {
                case "bool": retType = typeof(bool); break;
                case "byte": retType = typeof(byte); break;
                case "sbyte": retType = typeof(sbyte); break;
                case "char": retType = typeof(char); break;
                case "decimal": retType = typeof(decimal); break;
                case "double": retType = typeof(double); break;
                case "float": retType = typeof(float); break;
                case "int": retType = typeof(int); break;
                case "uint": retType = typeof(uint); break;
                case "long": retType = typeof(long); break;
                case "object": retType = typeof(object); break;
                case "short": retType = typeof(short); break;
                case "ushort": retType = typeof(ushort); break;
                case "string": retType = typeof(string); break;
                default: retType = typeof(string); break;
            }
            return retType;
        }


        /*
         * GUID
         * */
        public static string getGUID()
        {
			string guid = "";
			while (guid.Length != 36)
			{
				guid = Guid.NewGuid().ToString().ToUpper();
			}
			return guid;
        }

        /*
         * NULL 값 처리
         * */
        public static string getStr(object obj){
            string ret = "";

            if (obj != null)
            {
                try
                {
                    ret = obj.ToString();
                }
                catch (Exception ex)
                {
                    //!
                }
            }
            return ret;
        }
        public static string getStr(object obj, string nullStr)
        {
            string ret = "";

            if (obj == null)
            {
                ret = nullStr;
            }else{
                try
                {
                    ret = obj.ToString();
                }
                catch (Exception ex)
                {
                    //!
                }
            }
            return ret;
        }
        public static string getStr(object obj, int len)
        {
            string ret = "";

            if (obj == null)
            {
                ret = "";
            }
            else
            {
                try
                {
                    ret = obj.ToString();
                }
                catch (Exception ex)
                {
                    //!
                }
            }
			ret = (ret + "".PadRight(len, ' ')).Substring(0, len);
            return ret;
        }

        public static string getStrTrim(object obj, int len)
        {
            string ret = "";

            if (obj == null)
            {
                ret = "";
            }
            else
            {
                try
                {
                    ret = obj.ToString();
                }
                catch (Exception ex)
                {
                    //!
                }
            }
            ret = ((ret + "".PadRight(len, ' ')).Substring(0, len)).Trim();
            return ret;
        }



        /*
         * Null 이면 defStr return
         * */
        public static string getStrDefault(object obj, string defStr)
        {
            string ret = "";

            if (obj != null)
            {
                try
                {
                    ret = obj.ToString();
                }
                catch (Exception ex)
                {
                    //!
                }
            }
            if (ret == "") { ret = defStr; }

            return ret;        
        }

        public static double getDouble(object obj)
        {
            double ret = 0;

            try
            {
                ret = Double.Parse(obj.ToString());
            }
            catch (Exception ex)
            {
                //
            }
            return ret;
        }

        public static decimal getDecimal(object obj)
        {
            decimal ret = 0;

            try
            {
                ret = Decimal.Parse(obj.ToString());
            }
            catch(Exception ex){

            }
            return ret;
        }

        public static int getInt(object obj)
        {
            int ret = 0;

            try
            {
                ret = int.Parse(obj.ToString());
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public static Int64 getInt64(object obj)
        {
            Int64 ret = 0;

            try
            {
                ret = Int64.Parse(obj.ToString());
            }
            catch (Exception ex)
            {

            }
            return ret;
        }
        // long : Int64 동일함
        public static long getLong(object obj)
        {
            long ret = 0;

            try
            {
                ret = long.Parse(obj.ToString());
            }
            catch (Exception ex)
            {

            }
            return ret;
        }


        public static bool isNumeric(object obj)
        {
            bool ret = true;
            double tmp = 0;

            ret = Double.TryParse(obj.ToString(), out tmp);

            return ret;
        }
        // YYYYMMDD -> YYYY-MM-DD
        public static string getDate8ToDate10(string p1)
        {

            return p1.Substring(0, 4) + "-" + p1.Substring(4, 2) + "-" + p1.Substring(6, 2);
        }

        // 날자 -> YYYYMMDD
        public static string getDevDateToDate8(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("yyyyMMdd");
            }
            
        }

        // 날자 -> YYYY-MM-DD
        public static string getDevDateToDate10(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if(("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("yyyy-MM-dd");
            }
        }

        // 날자 -> yyyyMMddHHmm
        public static string getDevDateToDate12(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("yyyyMMddHHmm");
            }
        }

        // 날자 -> YYYYMMDDHHMMSS
        public static string getDevDateToDate14(object dt)
        {
            if (dt == null || dt.ToString().Length == 0)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("yyyyMMddHHmmss");
            }
        }

        // 날자 -> YYYY-MM-DD HH:MM:SS
        public static string getDevDateToDate19(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("yyyy-MM-dd HH:mm:ss");
            }

        }

        // 날자 -> HHMM
        public static string getDevTimeToTime4(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("HHmm");
            }
        }

        // 날자 -> HH:MM
        public static string getDevTimeToTime5(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("HH:mm");
            }
        }

        // 날자 -> HHMMSS
        public static string getDevTimeToTime6(object dt)
        {
            if (dt == null)
            {
                return "";
            }
            else if (("" + dt).Length == 0)
            {
                return "";
            }
            else
            {
                return ((DateTime)dt).ToString("HHmmss");
            }
        }
        public static string getDate8DevString(string p1)
        {
            return p1.Replace("-", "");
        }
        // YYYYMMDD -> 날자
        public static DateTime getDate8ToDevDate(string p1)
        {
            return new DateTime( int.Parse(p1.Substring(0, 4)), int.Parse(p1.Substring(4, 2)), int.Parse(p1.Substring(6, 2)));
        }

        // YYYYMMDDHHMMSS -> 날자
        public static DateTime getDate14ToDevDate(string p1)
        {
            return new DateTime(int.Parse(p1.Substring(0, 4)), int.Parse(p1.Substring(4, 2)), int.Parse(p1.Substring(6, 2)), int.Parse(p1.Substring(8, 2)), int.Parse(p1.Substring(10, 2)), int.Parse(p1.Substring(12, 2)));
        }

        // YYYYMMDDHHMM -> 날자
        public static DateTime getDate12ToDevDate(string p1)
        {
            return new DateTime(int.Parse(p1.Substring(0, 4)), int.Parse(p1.Substring(4, 2)), int.Parse(p1.Substring(6, 2)), int.Parse(p1.Substring(8, 2)), int.Parse(p1.Substring(10, 2)),0);
        }

        // YYYY-MM-DD -> 날자
        public static DateTime getDate10ToDevDate(string p1)
        {
            return new DateTime(int.Parse(p1.Substring(0, 4)), int.Parse(p1.Substring(5, 2)), int.Parse(p1.Substring(8, 2)));
        }
        // YYYY-MM-DD -> YYYYMMDD    //박정훈 생성 20141022
        public static int getDate10ToTime8(string p1)
        {
            return int.Parse(p1.Replace("-", ""));
        }
        // YYYY-MM-DD HH:MM:SS -> 날자
        public static DateTime getDate19ToDevDate(string p1)
        {
            return new DateTime(int.Parse(p1.Substring(0, 4)), int.Parse(p1.Substring(5, 2)), int.Parse(p1.Substring(8, 2)), int.Parse(p1.Substring(11, 2)), int.Parse(p1.Substring(14, 2)), int.Parse(p1.Substring(17, 2)));
        }

        // HHMM -> 날자
        public static DateTime getTime4ToDevTime(string p1)
        {
            return new DateTime(2000, 1, 1, int.Parse(p1.Substring(0,2)), int.Parse(p1.Substring(2,2)), 0);
        }

        // HH:MM -> 날자
        public static DateTime getTime5ToDevTime(string p1)
        {
            return new DateTime(2000, 1, 1, int.Parse(p1.Substring(0, 2)), int.Parse(p1.Substring(3, 2)), 0);
        }

        // 문자열 -> 메일주소,발송자 분리
        public static string[] getMailSenderEmailName(string arg1)
        {
            //
            string str = arg1;
            string[] ret = {"",""};       //{mail, name }

            if (str.IndexOf("<") >= 0 || str.IndexOf("(") >= 0)
            {
                if (str.IndexOf("<") >= 0)
                {
                    str = str.Replace("<", ";").Replace(">", "");
                }
                else
                {
                    str = str.Replace("(", ";").Replace(")", "");
                }

                string[] arr1 = str.Split(';');

                if (IsValidEmail(arr1[0]) == true)
                {
                    ret[0] = arr1[0].Trim();
                    ret[1] = arr1[1].Trim().Replace("'", "").Replace("\"", "");
                }
                else if (IsValidEmail(arr1[1]) == true)
                {
                    ret[0] = arr1[1].Trim();
                    ret[1] = arr1[0].Trim().Replace("'", "").Replace("\"", "");
                }
                else
                {
                    //
                }

            }
            else
            {
                ret[1] = str.Trim();
            }

            return ret;
        }

        public static bool IsValidEmail(string strIn)
        {
            // Return true if strIn is in valid e-mail format.
            return Regex.IsMatch(strIn,
                   @"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))" +
                   @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");
        }



        /*
         * DataTable 생성
         * */
        public static System.Data.DataTable getDataTable(string tableNm, string s1, string s2, string s3)
        {
            DataTable dt = new DataTable(tableNm == "" ? "_TABLE0_" : tableNm);
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;
            DataColumn dc3 = null;

            dc1 = new DataColumn("COL1", Type.GetType("System.String"));
            dc2 = new DataColumn("COL2", Type.GetType("System.String"));
            dc3 = new DataColumn("COL3", Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);

            dr = dt.NewRow();
            dr["COL1"] = s1;
            dr["COL2"] = s2;
            dr["COL3"] = s3;

            dt.Rows.Add(dr);

            return dt;
        }

        public static System.Data.DataTable getDataTableCol10(string tableNm)
        {
            DataTable dt = new DataTable(tableNm == "" ? "_TABLE0_" : tableNm);
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;
            DataColumn dc3 = null;
            DataColumn dc4 = null;
            DataColumn dc5 = null;
            DataColumn dc6 = null;
            DataColumn dc7 = null;
            DataColumn dc8 = null;
            DataColumn dc9 = null;
            DataColumn dc10 = null;

            dc1 = new DataColumn("COL1", Type.GetType("System.String"));
            dc2 = new DataColumn("COL2", Type.GetType("System.String"));
            dc3 = new DataColumn("COL3", Type.GetType("System.String"));
            dc4 = new DataColumn("COL4", Type.GetType("System.String"));
            dc5 = new DataColumn("COL5", Type.GetType("System.String"));
            dc6 = new DataColumn("COL6", Type.GetType("System.String"));
            dc7 = new DataColumn("COL7", Type.GetType("System.String"));
            dc8 = new DataColumn("COL8", Type.GetType("System.String"));
            dc9 = new DataColumn("COL9", Type.GetType("System.String"));
            dc10 = new DataColumn("COL10", Type.GetType("System.String"));


            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            dt.Columns.Add(dc7);
            dt.Columns.Add(dc8);
            dt.Columns.Add(dc9);
            dt.Columns.Add(dc10);

            return dt;
        }

        //
        // columnStr = "CODE:string;NAME:string;INFO1;DT:DateTime;NUM:decimal"   
        // valueStr = "C1,001,항목1;C2,002,항목2;C3,003,항목3"
        //
        public static DataTable getDataTableTest(string columnStr, string valueStr)
        {
            string[] sArrCol = columnStr.Split(';');
            DataTable dt = new DataTable("_TABLE0_");

          

                for (int i = 0; i < sArrCol.Length; i++)
                {
                    if (sArrCol[i].Length > 0)
                    {
                        DataColumn dc = null;
                        string[] sArrColType = sArrCol[i].Split(':');
                        if (sArrColType.Length == 1)
                        {
                            dc = new DataColumn(sArrColType[0].Trim(), typeof(string));
                        }
                        else
                        {
                            switch (sArrColType[1].ToUpper())
                            {
                                case "DATETIME":
                                    dc = new DataColumn(sArrColType[0], typeof(DateTime));
                                    break;
                                case "DECIMAL":
                                case "NUMBER":
                                    dc = new DataColumn(sArrColType[0], typeof(decimal));
                                    break;
                                case "INT64":
                                    dc = new DataColumn(sArrColType[0], typeof(Int64));
                                    break;
                                case "INT":
                                    dc = new DataColumn(sArrColType[0], typeof(int));
                                    break;
                                default:        // string
                                    dc = new DataColumn(sArrColType[0], typeof(string));
                                    break;
                            }
                        }
                        dt.Columns.Add(dc);
                    }
                }

                if (valueStr.Length > 0)
                {
                    string[] sArrRow = valueStr.Split(';');
                    for (int i = 0; i < sArrRow.Length; i++)
                    {
                        string[] sArrVal = sArrRow[i].Split(',');
                        DataRow dr = null;
                        dr = dt.NewRow();

                        for (int j = 0; j < sArrCol.Length; j++)
                        {
                            string[] sArrColType = sArrCol[j].Split(':');
                            dr[sArrColType[0]] = "" + sArrVal[j];
                        }
                        dt.Rows.Add(dr);
                    }
                }
           
            return dt;
        }

        // added 2014.05.09
        // Split E-MAIL address by delimiter(;)
        public static string splitEmailAddr(string emailAddr)
        {
            string[] delimiter = { ";" };
            string[] addr = emailAddr.Split(delimiter, StringSplitOptions.RemoveEmptyEntries);

            return string.Join(",", addr);
        }

        // 계량 값 가져오기
        public static DataSet getScaleWeight(string ip0)
        {
            DataSet ds = new DataSet();
            DataTable dt = null;
            string ret = "";
            string data1 = "";
            string ip = "";
            string port = "1470";
            string errMsg = "";
            

            // 192.168.0.36 : 스케일1 : 1층장치장XRAY
            // 192/168.0.37 : 스케일2 : 수출부스
            // 192.168.0.38 : 스케일3 : BUP    
            // 192.168.0.39 : 스케일4 : 계류장1
            // 192.168.0.40 : 스케일5 : 계류장2

            if (ip0 == "1" || ip0 == "CARGOXRAY" || ip0 == "TEST")
            {
                ip = "192.168.0.36";
            }
            else if (ip0 == "2" || ip0 == "CARGOACCEPT")
            {
                ip = "192.168.0.37";
            }
            else if (ip0 == "3" || ip0 == "CARGOBUP")
            {
                ip = "192.168.0.38";
            }
            else if (ip0 == "4" || ip0 == "RAMP1")
            {
                ip = "192.168.0.39";
            }
            else if (ip0 == "5" || ip0 == "RAMP2")
            {
                ip = "192.168.0.40";
            }
            else if (ip0.IndexOf(".") >= 0)
            {
                ip = ip0;
            }
            else
            {
                dt = BizUtil.getDataTable("", "ERR", "SCALE정보오류:" + ip0, "");
                ds.Tables.Add(dt.Copy());
                return ds;
            }
            
            for (int i = 0; i < 5; i++)     // 5회 이내 시도
            {
                try
                {
                    //get
                    System.Net.Sockets.TcpClient clientSocket = new System.Net.Sockets.TcpClient();
                    clientSocket.SendTimeout = 2000;
                    clientSocket.Connect(System.Net.IPAddress.Parse(ip), int.Parse(port));

                    NetworkStream serverStream = clientSocket.GetStream();

                    byte[] inStream = new byte[(int)clientSocket.ReceiveBufferSize];
                    serverStream.Read(inStream, 0, (int)clientSocket.ReceiveBufferSize);
                    string returndata = System.Text.Encoding.ASCII.GetString(inStream, 0, inStream.Length);
                    data1 = returndata.ToUpper();   // 대문자 변환

                    serverStream.Close();
                    clientSocket.Close();

                    errMsg = "";

                }
                catch (Exception ex)
                {
                    errMsg = "Scale 읽기중 오류가 발생하였습니다.";
                    BizUtil.setLogErr(ex.ToString());
                }

                int idx1 = data1.IndexOf("+");
                if (idx1 == - 1)
                {
                    idx1 = data1.IndexOf("-");
                }
                int idx2 = data1.Length;

                if (idx1 >= 0 && idx1 < idx2)
                {
                    break;
                }
            }


            //
            // ex STANDARD) "ST,NT,+ 000118kg\r\nST,NT,+ 000118kg\r\nST,NT,+ 000118kg\r\nST,NT,+ 000118kg\r\n"
            // ex OPTION02) S+00000001<crlf>S+00000001<crlf>S+00000001
            //

            if (data1.Length > 0)
            {
                data1 = data1.Replace("\r\n", ";").Replace(",", ";").Replace(" ", "");
                string[] arr1 = data1.Split(';');

                switch (ip)
                {
                    case "192.168.0.37":       //STANDARD
                    case "192.168.0.38":
                    case "192.168.0.39":
                    case "192.168.0.40":
                        
                        for (int i = 0; i < arr1.Length; i++)
                        {
                            int idx1 = arr1[i].IndexOf("+");
                            if (idx1 == -1)
                            {
                                idx1 = arr1[i].IndexOf("-");
                            }
                            int idx2 = arr1[i].Length - 1;

                            if (idx1 >= 0 && idx2 >= 0 &&  idx1 < idx2)
                            {
                                ret = arr1[i].Substring(idx1);
                                try
                                {
                                    ret = "" + Double.Parse(ret);
                                    break;
                                }
                                catch (Exception ex)
                                {
                                    ret = "0";
                                }
                            }
                        }
                    
                        break;

                    default:        //OPTION02
                                                
                        for (int i = 0; i < arr1.Length; i++)
                        {
                            arr1[i] = arr1[i].Replace("KG", "");

                            int idx1 = arr1[i].IndexOf("+");
                            if (idx1 == -1)
                            {
                                idx1 = arr1[i].IndexOf("-");
                            }
                            int idx2 = arr1[i].Length - 1;
                            
                            if (idx1 >= 0 && idx2 >= 0 && idx1 < idx2)
                            {
                                ret = arr1[i].Substring(idx1);
                                try
                                {
                                    ret = "" + Double.Parse(ret);
                                    break;
                                }
                                catch (Exception ex)
                                {
                                    ret = "0";
                                }
                            }
                        }
                        break;
                }


            }
            else
            {
                ret = "0";
            }

            if (errMsg.Length == 0)
            {
                dt = BizUtil.getDataTable("", "OK", errMsg, ret);
            }
            else
            {
                dt = BizUtil.getDataTable("", "ERR", errMsg, ret);
            }

            ds.Tables.Add(dt.Copy());

            return ds;
        }

        // 출력
        public static DataSet setSlipPrint(string ip0, string msg)
        {
            DataSet ds = new DataSet();
            DataTable dt = null;
            string ret = "";
            string data1 = "";
            string ip = "";
            string port = "1470";
            string errMsg = "";


            if (ip0 == "1" || ip0 == "CARGOACCEPT")
            {
                ip = "192.168.0.31";
            }
            else if (ip0 == "2" || ip0 == "RAMP")
            {
                ip = "192.168.0.32";
            }
            else if (ip0 == "TEST")
            {
                ip = "192.168.0.162";  // 192.168.0.173 : 개발PC
            }
            else
            {
                //ip = "192.168.0.173";  // 192.168.0.173 : 개발PC
                //ip = "127.0.0.1";  // 192.168.0.173 : 개발PC

                dt = BizUtil.getDataTable("", "ERR", "SCALE정보오류:" + ip0, "");
                ds.Tables.Add(dt.Copy());
                return ds;
            }



            try
            {

                // Translate the passed message into ASCII and store it as a Byte array.
                Byte[] data = System.Text.Encoding.UTF8.GetBytes(System.Web.HttpUtility.UrlEncode(msg));    //한글깨짐 방지       


                //get
                System.Net.Sockets.TcpClient clientSocket = new System.Net.Sockets.TcpClient();
                clientSocket.SendTimeout = 5000;
                clientSocket.Connect(System.Net.IPAddress.Parse(ip), int.Parse(port));

                NetworkStream serverStream = clientSocket.GetStream();

                serverStream.Write(data, 0, data.Length);


                byte[] inStream = new byte[(int)clientSocket.ReceiveBufferSize];
                serverStream.Read(inStream, 0, (int)clientSocket.ReceiveBufferSize);
                string returndata = System.Text.Encoding.ASCII.GetString(inStream, 0, inStream.Length);
                data1 = returndata.ToUpper();   // 대문자 변환

                serverStream.Close();
                clientSocket.Close();

                errMsg = "";

                if (data1.Length > 0)
                {
                    if (data1.StartsWith("OK"))
                    {
                        ret = "OK";
                    }
                    else
                    {
                        ret = data1.Trim();
                    }
                }

            }
            catch (Exception ex)
            {
                errMsg = "Slip Print중 오류가 발생하였습니다." + ex.ToString();
                BizUtil.setLogErr(ex.ToString());
            }


            if (errMsg.Length == 0 && ret == "OK")
            {
                dt = BizUtil.getDataTable("", "OK", errMsg, ret);
            }
            else
            {
                dt = BizUtil.getDataTable("", "ERR", errMsg, ret);
            }

            ds.Tables.Add(dt.Copy());

            return ds;
        }


        /*
         * log
         * */
        public static void setLogErr(string msg)
        {
            setLog("(error)", msg);

        }
        public static void setLogDebug(string msg)
        {
            setLog("(debug)", msg);

        }
        public static void setLog(string msg)
        {
            setLog("(null)", msg);           

        }
        public static void setLog(string key, string msg)
        {
            string logPath = Directory.GetCurrentDirectory();
            string ymd = DateTime.Now.ToString("yyyyMMdd");
            string logFile = logPath + "\\" + ymd + ".log";
            string logFileEx = logPath + "\\" +  ymd + "_exception.log";
            
            try
            {
                File.AppendAllText(logFile, "["
                                + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                + "] " 
                                + key + ":" + msg 
                                + "\r\n");
            }
            catch (Exception ex)
            {
                File.AppendAllText(logFileEx, "[ERR:"
                                    + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                    + "] " 
                                    + ex.ToString() 
                                    + "\r\n");
                File.AppendAllText(logFileEx, "[MSG:"
                                    + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                    + "] " 
                                    + key + ":" + msg 
                                    + "\r\n");
            }
        }

        // 문자열 원본에서 오른쪽에서 부터 추출한 개수만큼 문자열 반환
        // 예) Right('ABCD;, 3) --> 'BCD'
        public static string getStrRight(string sString, int nLength)
        {
            string sReturn;

            if (nLength > sString.Length) nLength = sString.Length;
            sReturn = sString.Substring(sString.Length - nLength, nLength);

            return sReturn;
        }

        // ex 오류 메시지
        public static string getExceptionMessage(Exception ex)
        {
            string ret = "";

            ret = getExceptionMessageRecursive(ex);
            
            return ret;
        }
        // ex 오류 메시지 추출, 재귀함수
        public static string getExceptionMessageRecursive(Exception ex)
        {
            string ret = "";

            if (ex != null)
            {
                ret = ex.Message + "\r\n" + getExceptionMessageRecursive(ex.InnerException);
            }

            return ret;
        }

        // 
        public static string getMonthMMM(string monthIndex)
        {
            string month = "";

            switch (monthIndex)
            {
                case "1":
                    month = "JAN";
                    break;
                case "2":
                    month = "FEB";
                    break;
                case "3":
                    month = "MAR";
                    break;
                case "4":
                    month = "APR";
                    break;
                case "5":
                    month = "MAY";
                    break;
                case "6":
                    month = "JUN";
                    break;
                case "7":
                    month = "JUL";
                    break;
                case "8":
                    month = "AUG";
                    break;
                case "9":
                    month = "SEP";
                    break;
                case "10":
                    month = "OCT";
                    break;
                case "11":
                    month = "NOV";
                    break;
                case "12":
                    month = "DEC";
                    break;
            }

            return month;
        }



        public static DataTable getHashToDataTable(Hashtable hs)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            foreach (DictionaryEntry d in hs)
            {
                DataColumn dc = new DataColumn(d.Key.ToString(), Type.GetType("System.String"));
                dt.Columns.Add(dc);
            }

            dr = dt.NewRow();

            foreach (DictionaryEntry d in hs)
            {
                dr[d.Key.ToString()] = d.Value.ToString();
            }

            dt.Rows.Add(dr);

            return dt;
        }

        public static Hashtable getDataTableToHashTable(DataTable dt)
        {
            Hashtable hs = new Hashtable();

            foreach (DataColumn dc in dt.Columns)
            {
                hs.Add(dc.ColumnName, dt.Rows[0][dc.ColumnName]);
            }

            return hs;
        }


        //
        // 짧은 문자열에 대해서는 복원이 가능함
        // 32 CHAR
        //
        public static string getMD5(string param1)
        {
            string ret = "";
            StringBuilder sBuilder = new StringBuilder();

            using (MD5 md5Hash = MD5.Create())
            {
                //MD5 md5hash = MD5.Create();

                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(param1));

                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
            }

            ret = sBuilder.ToString();
            return ret;
        }


        //
        // 130 CHAR
        //
        public static string getSHA512(string param1)
        {
            string ret = "";
            SHA512 sha = new SHA512Managed();
            byte[] hash = sha.ComputeHash(Encoding.ASCII.GetBytes(param1));
            StringBuilder stringBuilder = new StringBuilder();
            foreach (byte b in hash)
            {
                stringBuilder.AppendFormat("{0:x2}", b);
            }
            ret = stringBuilder.ToString();
            return ret;
        }


        // 메일 주소에서 도메인만 추출
        //
        //    ex)  koala, Kim<yjkim@t2l.co.kr> => t2l.co.kr
        //
        public static string getMailDomain(string param1)
        {
            string ret = "";

            if(param1.IndexOf("@") >= 0)
            {
                //메일주소 추출
                if(param1.IndexOf("<") >= 0)
                {
                    param1 = param1.Substring(param1.IndexOf("<") + 1);
                    param1 = param1.Replace(">", "");
                }

                if (param1.IndexOf("(") >= 0)
                {
                    param1 = param1.Substring(param1.IndexOf("(") + 1);
                    param1 = param1.Replace(")", "");
                }

                //도메인 추출
                ret = param1.Substring(param1.IndexOf("@") + 1);
            }
            else
            {
                ret = "";
            }

            return ret;
        }


        public static string getCompressStr(string text)
        {
            byte[] buffer = Encoding.UTF8.GetBytes(text);
            var memoryStream = new MemoryStream();
            using (var gZipStream = new GZipStream(memoryStream, CompressionMode.Compress, true))
            {
                gZipStream.Write(buffer, 0, buffer.Length);
            }

            memoryStream.Position = 0;

            var compressedData = new byte[memoryStream.Length];
            memoryStream.Read(compressedData, 0, compressedData.Length);

            var gZipBuffer = new byte[compressedData.Length + 4];
            Buffer.BlockCopy(compressedData, 0, gZipBuffer, 4, compressedData.Length);
            Buffer.BlockCopy(BitConverter.GetBytes(buffer.Length), 0, gZipBuffer, 0, 4);
            return Convert.ToBase64String(gZipBuffer);
        }
        public static string getDecompressStr(string compressedText)
        {
            byte[] gZipBuffer = Convert.FromBase64String(compressedText);
            using (var memoryStream = new MemoryStream())
            {
                int dataLength = BitConverter.ToInt32(gZipBuffer, 0);
                memoryStream.Write(gZipBuffer, 4, gZipBuffer.Length - 4);

                var buffer = new byte[dataLength];

                memoryStream.Position = 0;
                using (var gZipStream = new GZipStream(memoryStream, CompressionMode.Decompress))
                {
                    gZipStream.Read(buffer, 0, buffer.Length);
                }

                return Encoding.UTF8.GetString(buffer);
            }
        }


        public static string seachNavigation(string url, int offset = 0, int numrows = 0, int matches = 20, int searchPages = 5)
        {
            int pages = 0;
            int pageNum = 0;
            int startPage = 0;
            int endPage = 0;
            int newOffset = 0;

            string naviString = "";
            string del = "?";

            if (numrows == 0)
            {
                return null;
            }

            if (url.IndexOf('?') > -1)
            {
                del = "&";
            }
            else
            {
                del = "?";
            }

            // 전체 페이지 구하기
            pages = numrows / matches;
            if (numrows % matches > 0)
            {
                pages++;
            }

            pageNum = (offset / matches) + 1;

            startPage = pageNum - (searchPages - 1);
            if (startPage <= 0)
            {
                startPage = 1;
            }

            endPage = pageNum + searchPages - 1;
            if (endPage > pages)
            {
                endPage = pages;
            }

            if (offset - (matches * searchPages) >= 0)
            {
                newOffset = offset - (matches * searchPages);
                naviString += @"<span class=""num_prev""><span class=""arrow"">◀</span><a href=""$URL$"">Prev</a></span>";
                naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
            }
            else
            {
                naviString += @"<span class=""num_prev""><span class=""arrow"">◀</span><span>Prev</span></span>";
            }

            if (startPage > 1)
            {
                naviString += @"<a href=""$URL$"" class=""num_box"" style='text-decoration: none;'>$NUM$</a>";
                naviString = naviString.Replace("$URL$", url+del+"offset=0");
                naviString = naviString.Replace("$NUM$", 1 + "");
                naviString += @"<span>...</span>";
            }

            for (int i = startPage; i <= endPage; i++)
            {
                if ((offset < i * matches) && (offset >= (i - 1) * matches)) {
                    naviString += @"<a href=""javascript:;"" class=""num_box txt_point u b"" style='margin: 5px 5px 5px 5px; text-decoration: none; color:red;'>$NUM$</a>";
                } else {
                    newOffset = matches * (i - 1);
                    naviString += @"<a href=""$URL$"" class=""num_box"" style='text-decoration: none; margin: 5px 5px 5px 5px;'>$NUM$</a>";
                    naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
                }
                naviString = naviString.Replace("$NUM$", i + "");
            }

            if (endPage < pages)
            {
                newOffset = (pages - 1) * matches;
                naviString += @"<span>...</span>";
                naviString += @"<a href=""$URL$"" class=""num_box"">$NUM$</a>";
                naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
                naviString = naviString.Replace("$NUM$", pages + "");

            }

            if (offset + (matches * searchPages) < numrows)
            {
                newOffset = offset + (matches * searchPages);
                naviString += @"<span class=""num_prev""><a href=""$URL$"">Next</a><span class=""arrow"">▶</span></span>";
                naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
            }
            else
            {
                naviString += @"<span class=""num_prev""><span>Next</span><span class=""arrow"">▶</span></span>";
            }

            naviString = "<div class=\"paging\" style='font-size: 15px;'>" + naviString + "</div>";
            return naviString;
        }
        // 바이오맥스 용 페이징
        public static string seachNavigation_biomax(string url, int offset = 0, int numrows = 0, int matches = 20, int searchPages = 5)
        {
            int pages = 0;
            int pageNum = 0;
            int startPage = 0;
            int endPage = 0;
            int newOffset = 0;

            string naviString = "";
            string del = "?";

            if (numrows == 0)
            {
                return null;
            }

            if (url.IndexOf('?') > -1)
            {
                del = "&";
            }
            else
            {
                del = "?";
            }

            // 전체 페이지 구하기
            pages = numrows / matches;
            if (numrows % matches > 0)
            {
                pages++;
            }

            pageNum = (offset / matches) + 1;

            startPage = pageNum - (searchPages - 1);
            if (startPage <= 0)
            {
                startPage = 1;
            }

            endPage = pageNum + searchPages - 1;
            if (endPage > pages)
            {
                endPage = pages;
            }

            if (offset - (matches * searchPages) >= 0)
            {
                newOffset = offset - (matches * searchPages);
                naviString += @"<span class=""num_prev""><span style=""margin-right:15px;"" class=""arrow""><a href=""$URL$""><</a></span></span>";
                naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
            }
            else
            {
                naviString += @"<span class=""num_prev""><span style=""margin-right:15px; color:#808080;"" class=""arrow""><span><</span></span></span>";
            }

            if (startPage > 1)
            {
                //naviString += @"<a href=""$URL$"" class=""num_box"" style='text-decoration: none;'>$NUM$</a>";
                //naviString = naviString.Replace("$URL$", url + del + "offset=0");
                //naviString = naviString.Replace("$NUM$", 1 + "");
                //naviString += @"<span>...</span>";
            }

            for (int i = startPage; i <= endPage; i++)
            {
                if ((offset < i * matches) && (offset >= (i - 1) * matches))
                {
                    naviString += @"<a href=""javascript:;"" class=""num_box txt_point u b num_box_a"" style='margin: 5px 5px 5px 5px; text-decoration: none; color:blue; font-family: Nanum Gothic; border-bottom:2px solid blue;'>$NUM$</a>";
                }
                else
                {
                    newOffset = matches * (i - 1);
                    naviString += @"<a href=""$URL$"" class=""num_box"" style='text-decoration: none; margin: 5px 5px 5px 5px; font-family: Nanum Gothic; color:#1a1a1a'>$NUM$</a>";
                    naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
                }
                naviString = naviString.Replace("$NUM$", i + "");
            }

            if (endPage < pages)
            {
                newOffset = (pages - 1) * matches;
                //naviString += @"<span>...</span>";
                //naviString += @"<a href=""$URL$"" class=""num_box"">$NUM$</a>";
                //naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
                //naviString = naviString.Replace("$NUM$", pages + "");

            }

            if (offset + (matches * searchPages) < numrows)
            {
                newOffset = offset + (matches * searchPages);
                naviString += @"<span style=""margin-left:15px;"" class=""num_prev""><a href=""$URL$""><span style=""color:#808080;"" class=""arrow"">></span></a></span>";
                naviString = naviString.Replace("$URL$", url + del + "offset=" + newOffset);
            }
            else
            {
                naviString += @"<span style=""margin-left:15px;"" class=""num_prev""><span style=""color:#808080;"" class=""arrow"">></span></span>";
            }

            naviString = "<div class=\"paging\"'>" + naviString + "</div>";
            return naviString;
        }

        // 암호화 AES256
        public static string EncryptString(string InputText)
        {
            string Password = "T2LC";
            string EncryptedData = "";
            try
            {
                // Rihndael class를 선언하고, 초기화
                RijndaelManaged RijndaelCipher = new RijndaelManaged();
 
                // 입력받은 문자열을 바이트 배열로 변환
                byte[] PlainText = System.Text.Encoding.Unicode.GetBytes(InputText);
 
                // 딕셔너리 공격을 대비해서 키를 더 풀기 어렵게 만들기 위해서 
                // Salt를 사용한다.
                byte[] Salt = Encoding.ASCII.GetBytes(Password.Length.ToString());
 
                // PasswordDeriveBytes 클래스를 사용해서 SecretKey를 얻는다.
                PasswordDeriveBytes SecretKey = new PasswordDeriveBytes(Password, Salt);
 
                // Create a encryptor from the existing SecretKey bytes.
                // encryptor 객체를 SecretKey로부터 만든다.
                // Secret Key에는 32바이트
                // (Rijndael의 디폴트인 256bit가 바로 32바이트입니다)를 사용하고, 
                // Initialization Vector로 16바이트
                // (역시 디폴트인 128비트가 바로 16바이트입니다)를 사용한다.
                ICryptoTransform Encryptor = RijndaelCipher.CreateEncryptor(SecretKey.GetBytes(32), SecretKey.GetBytes(16));
 
                // 메모리스트림 객체를 선언,초기화 
                MemoryStream memoryStream = new MemoryStream();
 
                // CryptoStream객체를 암호화된 데이터를 쓰기 위한 용도로 선언
                CryptoStream cryptoStream = new CryptoStream(memoryStream, Encryptor, CryptoStreamMode.Write);
 
                // 암호화 프로세스가 진행된다.
                cryptoStream.Write(PlainText, 0, PlainText.Length);
 
                // 암호화 종료
                cryptoStream.FlushFinalBlock();
 
                // 암호화된 데이터를 바이트 배열로 담는다.
                byte[] CipherBytes = memoryStream.ToArray();
 
                // 스트림 해제
                memoryStream.Close();
                cryptoStream.Close();
 
                // 암호화된 데이터를 Base64 인코딩된 문자열로 변환한다.
                EncryptedData = Convert.ToBase64String(CipherBytes);
            }
            catch {  }
            // 최종 결과를 리턴
            return EncryptedData;
        }
 
        // 복호화 AES256
        public static string DecryptString(string InputText)
        {
            string Password = "T2LC";
            string DecryptedData = "";   // 리턴값
            try
            {
                RijndaelManaged RijndaelCipher = new RijndaelManaged();
 
                byte[] EncryptedData = Convert.FromBase64String(InputText);
                byte[] Salt = Encoding.ASCII.GetBytes(Password.Length.ToString());
 
                PasswordDeriveBytes SecretKey = new PasswordDeriveBytes(Password, Salt);
 
                // Decryptor 객체를 만든다.
                ICryptoTransform Decryptor = RijndaelCipher.CreateDecryptor(SecretKey.GetBytes(32), SecretKey.GetBytes(16));
 
                MemoryStream memoryStream = new MemoryStream(EncryptedData);
 
                // 데이터 읽기(복호화이므로) 용도로 cryptoStream객체를 선언, 초기화
                CryptoStream cryptoStream = new CryptoStream(memoryStream, Decryptor, CryptoStreamMode.Read);
 
                // 복호화된 데이터를 담을 바이트 배열을 선언한다.
                // 길이는 알 수 없지만, 일단 복호화되기 전의 데이터의 길이보다는
                // 길지 않을 것이기 때문에 그 길이로 선언한다.
                byte[] PlainText = new byte[EncryptedData.Length];
 
                // 복호화 시작
                int DecryptedCount = cryptoStream.Read(PlainText, 0, PlainText.Length);
 
                memoryStream.Close();
                cryptoStream.Close();
 
                // 복호화된 데이터를 문자열로 바꾼다.
                DecryptedData = Encoding.Unicode.GetString(PlainText, 0, DecryptedCount);
 
            }
            catch  { }
            // 최종 결과 리턴
            return DecryptedData;
        }
    }
}