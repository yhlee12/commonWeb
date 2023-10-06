using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace T2LHomePage
{
    public class ClsHash
    {
        public string key1 { get; set; }
        public string val1 { get; set; }

    }

    public class ClsData
    {

        
        public BizUtil.eGubn paramGubn { get; set; }
        public string paramString { get; set; }
        public BizUtil.eType paramType { get; set; }
        public object paramValue { get; set; }
        public BizUtil.eInOut paramInOut { get; set;}
        public BizUtil.eSize paramSize { get; set; }
        public Int32 paramInt { get; set; }
        public double paramDouble { get; set; }
        public Int64 paramInt64 { get; set; }       // Int64 = Long
        public decimal paramDeciaml { get; set; }   // 통화

        public DataTable paramDataTable = null;
        public DataSet paramDataSet = null;

        // AACT procedure output 파라미터 값
        public DataTable outDataTable = null;
        public DataSet outDataSet = null;
        public string outErrFlag = null;
        public string outRetCode = null;
        public string outRetMsg = null;

        public string outErrorCd = null;
        public string outErrorMsg = null;

        public Int64 outRetSID = 0;
        public Int64 outRetSID2 = 0;
        public string outRetStr = null;             // PCL_SETTLE_SLIP_M010_005
        public string outRetStr2 = null;             
        public string outRetStr3 = null;             
        public string outRetStr4 = null;             
        public string outRetStr5 = null;             
        public string outRetStr6 = null;             
        public string outRetStr7 = null;             

        public DataTable outDataTable2 = null;
        public DataTable outDataTable3 = null;
        public DataTable outDataTable4 = null;
        public DataTable outDataTable5 = null;
        public DataTable outDataTable6 = null;
        public DataTable outDataTable7 = null;
        public DataTable outDataTable8 = null;
        public DataTable outDataTable9 = null;
        public DataTable outDataTable10 = null;
        public DataTable outDataTable11 = null;
        public DataTable outDataTable12 = null;
        public DataTable outDataTable13 = null;
        
        public DataSet outDataSet2 = null;
        public DataSet outDataSet3 = null;
        public DataSet outDataSet4 = null;
        public DataSet outDataSet5 = null;
        public DataSet outDataSet6 = null;
        public DataSet outDataSet7 = null;
        public DataSet outDataSet8 = null;
        public DataSet outDataSet9 = null;
        public DataSet outDataSet10 = null;
        public DataSet outDataSet11 = null;
        public DataSet outDataSet12 = null;
        public DataSet outDataSet13 = null;


        public List<DataTable> cursorSetDataTable = new List<DataTable>();
        public List<DataSet> cursorSetDataSet = new List<DataSet>();

        public ClsData()
        {
            //
        }

        public ClsData(BizUtil.eGubn paramGubn, string paramString, BizUtil.eType paramType, object paramValue)
        {
            this.paramGubn = paramGubn;
            this.paramString = paramString;
            this.paramType = paramType;
            this.paramValue = paramValue;
        }

        public void setData(BizUtil.eGubn paramGubn, string paramString , BizUtil.eType paramType, object paramValue )
        {
            this.paramGubn = paramGubn;
            this.paramString = paramString;
            this.paramType = paramType;
            this.paramValue = paramValue;
        }


        public void setProc(BizUtil.eGubn paramGubn, string paramString, BizUtil.eInOut paramInOut, BizUtil.eType paramType, BizUtil.eSize paramSize , object paramValue)
        {
            this.paramGubn = paramGubn;
            this.paramString = paramString;
            this.paramInOut = paramInOut;
            this.paramType = paramType;
            this.paramSize = paramSize;
            this.paramValue = paramValue;
        }

        

    }
}