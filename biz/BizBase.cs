using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Collections;
using System.ComponentModel;
using System.Reflection;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data.Odbc;
using MySql.Data.MySqlClient;

namespace T2LHomePage
{
    public class BizBase :IDisposable
    { 
        static string[] YesNoCaption = { "예", "아니오" };
        static string[] CUSTOMER_TYPECaption = { "고객사", "협력사", "항공사", "대리점", "세관/관세사", "IATA 가입 여부" };
        public DaoSAT baseDao = new DaoSAT();

        // 로그 생성
        public static DataTable dtLog = null;
        public static long dtLog_LongTime = 0;
        public static long dtPre_LongTime = 0;
        public static int dtLog_row_num = 0;

        public virtual void Dispose()
        {
            //
            if (baseDao != null)
            {                
                baseDao.DisConnectDB();
                baseDao = null;
            }            
        }

        void IDisposable.Dispose()
        {
            this.Dispose();
        }

        //
        //
        //
        public string baseHelo()
        {
            return "helo";
        }
        public BizBase()
        {
            //
        }
        public void baseConnectDB()
        {
            baseDao.ConnectDB();
        }
        public void baseConnectDB(string conStr)
        {
            baseDao.ConnectDB(conStr);            
        }
        public void baseBeginTran()
        {
            baseDao.BeginTran();
        }
        public void baseCommit()
        {
            baseDao.CommitTran();
        }
        public void baseRollBack()
        {
            baseDao.RollbackTran();
        }
        public void baseCloseDB()
        {
            baseDao.DisConnectDB();        
        }


        //
        // 단순 SQL 실행
        //
        public DataSet baseSQLDataset(string sql)
        {
            DataSet ds = null;
            List<ClsData> List1 = new List<ClsData>();
            ClsData item = null;

            //sql
            item = new ClsData();
            item.setData(BizUtil.eGubn.SQL, sql, BizUtil.eType.NULL, "");
            List1.Add(item);

            ds = this.baseSQLSelectParam(List1);

            return ds;
        }

        public int baseSQLExecute(string sql)
        {
            int ret = 0;

            List<ClsData> List1 = new List<ClsData>();
            ClsData item = null;

            //sql
            item = new ClsData();
            item.setData(BizUtil.eGubn.SQL, sql, BizUtil.eType.NULL, "");
            List1.Add(item);

            ret = this.baseSQLExecuteParam(List1);

            return ret;
        }

        //
        //sql new proc disconnection
        //
        public DataSet excuteDataSetMs(string sql)
        {
            DataSet ds = new DataSet();

            SqlConnection conn = baseDao.conSQLServer;
            SqlDataAdapter adp = new SqlDataAdapter(sql, conn);

            adp.Fill(ds);

            return ds;
        }
        //
        //sql new proc t2lpage 2023 02 22
        //
        public DataSet excuteDataSetProcedureBase(Hashtable hs)
        {
            Hashtable result = hs;
            DataSet ds = new DataSet();
            DataSet resultds = new DataSet();

            DataTable dt = null;

            try
            {
                string procedureName = result["SP_NAME"].ToString();

                // SP_NAME 삭제
                if (!result["SP_NAME"].ToString().Contains("SP_NAME"))
                {
                    result.Remove("SP_NAME");
                }

                SqlCommand cmd = new SqlCommand(procedureName);
                cmd.Connection = baseDao.conSQLServer;

                cmd.CommandType = CommandType.StoredProcedure;

                foreach (DictionaryEntry de in hs)
                {
                    cmd.Parameters.AddWithValue(de.Key.ToString(), de.Value == null ? System.DBNull.Value : de.Value);
                }

                //T2LAPP PARAMITER OUTPUT 룰 작업
                //@O_ERROR_FLAG
                SqlParameter OUT_PARAM = new SqlParameter();
                OUT_PARAM.Value = DBNull.Value;
                OUT_PARAM.ParameterName = "@O_ERROR_FLAG";
                OUT_PARAM.Direction = ParameterDirection.Output;
                OUT_PARAM.Size = 4000;
                OUT_PARAM.SqlDbType = SqlDbType.VarChar;
                cmd.Parameters.Add(OUT_PARAM);
                //@O_RETURN_MESSAGE
                OUT_PARAM = new SqlParameter();
                OUT_PARAM.Value = "";
                OUT_PARAM.ParameterName = "@O_RETURN_MESSAGE";
                OUT_PARAM.Direction = ParameterDirection.Output;
                OUT_PARAM.Size = 4000;
                OUT_PARAM.SqlDbType = SqlDbType.VarChar;
                cmd.Parameters.Add(OUT_PARAM);

                //adapter를 통한 연결
                //adapter로 연결한 PROC는 연결 후 바로 끊음.
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);

                //기본 OUTPARAM DATATABLE SETTING 작업
                foreach (SqlParameter Parameter in cmd.Parameters)
                {
                    if (Parameter.Direction == ParameterDirection.Output)
                    {
                        //아웃Put 체크
                        DataTable temp = new DataTable();
                        temp.TableName = Parameter.ParameterName.Replace("@", "");
                        temp.Columns.Add(Parameter.ParameterName.Replace("@", ""));
                        DataRow dr = temp.NewRow();
                        dr[Parameter.ParameterName.Replace("@", "")] = Parameter.Value;
                        temp.Rows.Add(dr);
                        resultds.Tables.Add(temp);
                    }
                }

                for (int i = 0; i < ds.Tables.Count; i++)
                {
                    //SET END PROC
                    if (i == 0)
                    {
                        ds.Tables[i].TableName = "O_RESULT_CURSOR";
                        resultds.Merge(ds.Tables[i]);
                    }
                    else
                    {
                        ds.Tables[i].TableName = "O_RESULT_CURSOR_" + i;
                        resultds.Merge(ds.Tables[i]);
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                DataRow dr = dt.NewRow();
                dt.Columns.Add("O_ERROR_FLAG");
                dr["O_ERROR_FLAG"] = "Y";
                dt.Rows.Add(dr);
                dt.TableName = "O_ERROR_FLAG";
                ds.Tables.Add(dt);

                dt = new DataTable();
                DataRow dr1 = dt.NewRow();
                dt.Columns.Add("O_RETURN_MESSAGE");
                dr1["O_RETURN_MESSAGE"] = ex.ToString();
                dt.Rows.Add(dr1);
                dt.TableName = "O_RETURN_MESSAGE";
                ds.Tables.Add(dt);

                resultds = ds;
            }

            return resultds;
        }


        //
        // SQL Select with Parameter
        //
        public DataSet baseSQLSelectParam(List<ClsData> list1)
        {
            if(baseDao.isMySQL)
            {
                return baseSQLSelectParamMySQL(list1);
            }
            else if(baseDao.isSQLServer)
            {
                return baseSQLSelectParamSQLServer(list1);
            }
            else if(baseDao.isODBC)
            {
                return baseSQLSelectParamODBC(list1);
            }
            else
            {
                return new DataSet();
            }
        }

        //
        // MS-SQL Select with Parameter
        //
        public DataSet baseMS_SQLSelectParam(List<ClsData> list1, DaoSAT paramBaseDao)
        {
            return baseSQLSelectParamSQLServer(list1, paramBaseDao);
        }

        // SQLServer
        // ex) SELECT * FROM TABLE WHERE ID = @ID AND NAME = @NAME
        private DataSet baseSQLSelectParamSQLServer(List<ClsData> list1, DaoSAT paramBaseDao = null)
        {
            if (paramBaseDao == null)
            {
                DataSet ds = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter("", baseDao.conSQLServer);

                foreach (ClsData ClsData in list1)
                {
                    if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                    {
                        adapter.SelectCommand.CommandText = ClsData.paramString;
                        adapter.SelectCommand.CommandType = CommandType.Text;
                    }
                    else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                    {
                        SqlDbType sqlType = SqlDbType.VarChar;

                        if (ClsData.paramType == BizUtil.eType.INT)
                        {
                            sqlType = SqlDbType.Int;
                        }
                        else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else
                        {
                            sqlType = SqlDbType.VarChar;
                        }
                        adapter.SelectCommand.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;
                    }
                }

                if (baseDao.tranFlagSQLServer == true && baseDao.tranSQLServer != null)
                {
                    //cmd.Transaction = baseDao.tran;
                    adapter.SelectCommand.Transaction = baseDao.tranSQLServer;
                }

                adapter.Fill(ds);

                return ds;            
            }
            else
            {
                DataSet ds = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter("", paramBaseDao.conSQLServer);

                foreach (ClsData ClsData in list1)
                {
                    if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                    {
                        adapter.SelectCommand.CommandText = ClsData.paramString;
                        adapter.SelectCommand.CommandType = CommandType.Text;
                    }
                    else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                    {
                        SqlDbType sqlType = SqlDbType.VarChar;

                        if (ClsData.paramType == BizUtil.eType.INT)
                        {
                            sqlType = SqlDbType.Int;
                        }
                        else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else
                        {
                            sqlType = SqlDbType.VarChar;
                        }
                        adapter.SelectCommand.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;
                    }
                }

                if (paramBaseDao.tranFlagSQLServer == true && paramBaseDao.tranSQLServer != null)
                {
                    //cmd.Transaction = paramBaseDao.tran;
                    adapter.SelectCommand.Transaction = paramBaseDao.tranSQLServer;
                }

                adapter.Fill(ds);

                return ds;
            }
        }

        // ODBC
        // ex) SELECT * FROM TABLE WHERE ID = @ID AND NAME = @NAME
        private DataSet baseSQLSelectParamODBC(List<ClsData> list1, DaoSAT paramBaseDao = null)
        {
            if (paramBaseDao == null)
            {
                DataSet ds = new DataSet();
                OdbcDataAdapter adapter = new OdbcDataAdapter("", baseDao.conODBC);

                foreach (ClsData ClsData in list1)
                {
                    if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                    {
                        adapter.SelectCommand.CommandText = ClsData.paramString;
                        adapter.SelectCommand.CommandType = CommandType.Text;
                    }
                    else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                    {
                        SqlDbType sqlType = SqlDbType.VarChar;

                        if (ClsData.paramType == BizUtil.eType.INT)
                        {
                            sqlType = SqlDbType.Int;
                        }
                        else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else
                        {
                            sqlType = SqlDbType.VarChar;
                        }
                        adapter.SelectCommand.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;
                    }
                }

                if (baseDao.tranFlagODBC == true && baseDao.tranODBC != null)
                {
                    //cmd.Transaction = baseDao.tran;
                    adapter.SelectCommand.Transaction = baseDao.tranODBC;
                }

                adapter.Fill(ds);

                return ds;
            }
            else
            {
                DataSet ds = new DataSet();
                OdbcDataAdapter adapter = new OdbcDataAdapter("", paramBaseDao.conODBC);

                foreach (ClsData ClsData in list1)
                {
                    if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                    {
                        adapter.SelectCommand.CommandText = ClsData.paramString;
                        adapter.SelectCommand.CommandType = CommandType.Text;
                    }
                    else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                    {
                        SqlDbType sqlType = SqlDbType.VarChar;

                        if (ClsData.paramType == BizUtil.eType.INT)
                        {
                            sqlType = SqlDbType.Int;
                        }
                        else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                        {
                            sqlType = SqlDbType.Decimal;
                        }
                        else
                        {
                            sqlType = SqlDbType.VarChar;
                        }
                        adapter.SelectCommand.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;
                    }
                }

                if (paramBaseDao.tranFlagODBC == true && paramBaseDao.tranODBC != null)
                {
                    adapter.SelectCommand.Transaction = paramBaseDao.tranODBC;
                }

                adapter.Fill(ds);

                return ds;
            }
        }


        // MySQL
        // ex) SELECT * FROM TABLE WHERE ID = @ID AND NAME = @NAME
        private DataSet baseSQLSelectParamMySQL(List<ClsData> list1)
        {
            DataSet ds = new DataSet();
            MySqlDataAdapter adapter = new MySqlDataAdapter("", baseDao.conMySQL);

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                {
                    adapter.SelectCommand.CommandText = ClsData.paramString;
                    adapter.SelectCommand.CommandType = CommandType.Text;
                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    SqlDbType sqlType = SqlDbType.VarChar;

                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        sqlType = SqlDbType.Int;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else
                    {
                        sqlType = SqlDbType.VarChar;
                    }
                    adapter.SelectCommand.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;
                }
            }

            if (baseDao.tranFlagMySQL == true && baseDao.tranMySQL != null)
            {
                adapter.SelectCommand.Transaction = baseDao.tranMySQL;
            }

            adapter.Fill(ds);

            return ds;
        }


        //
        //  SQL Execute with Parameter
        //
        public int baseSQLExecuteParam(List<ClsData> list1)
        {
            if(baseDao.isMySQL)
            {
                return baseSQLExecuteParamMySQL(list1);
            }
            else if(baseDao.isSQLServer)
            {
                return baseSQLExecuteParamSQLServer(list1);
            }
            else if (baseDao.isODBC)
            {
                return baseSQLExecuteParamODBC(list1);
            }
            else
            {
                return -1;
            }
        }

        // SQLServer
        // ex) INSERT INTO TABLE (C1,C2) VALUES (@C1, @C2)
        public int baseSQLExecuteParamSQLServer(List<ClsData> list1)
        {
            int ret = 0;
            SqlCommand cmd = new SqlCommand("", baseDao.conSQLServer);

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                {
                    cmd.CommandText = ClsData.paramString;
                    cmd.CommandType = CommandType.Text;

                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    SqlDbType sqlType = SqlDbType.VarChar;

                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        sqlType = SqlDbType.Int;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else
                    {
                        sqlType = SqlDbType.VarChar;
                    }
                    cmd.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;

                }

            }

            //transaction
            if (baseDao.tranFlagSQLServer == true && baseDao.tranSQLServer != null)
            {
                cmd.Transaction = baseDao.tranSQLServer;
            }
            ret = cmd.ExecuteNonQuery();

            return ret;
        }

        // ODBC
        // ex) INSERT INTO TABLE (C1,C2) VALUES (@C1, @C2)
        public int baseSQLExecuteParamODBC(List<ClsData> list1)
        {
            int ret = 0;
            OdbcCommand cmd = new OdbcCommand("", baseDao.conODBC);

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                {
                    cmd.CommandText = ClsData.paramString;
                    cmd.CommandType = CommandType.Text;

                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    SqlDbType sqlType = SqlDbType.VarChar;

                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        sqlType = SqlDbType.Int;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else
                    {
                        sqlType = SqlDbType.VarChar;
                    }
                    cmd.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;

                }

            }

            //transaction
            if (baseDao.tranFlagODBC== true && baseDao.tranODBC != null)
            {
                cmd.Transaction = baseDao.tranODBC;
            }
            ret = cmd.ExecuteNonQuery();

            return ret;
        }


        // MySQL
        // ex) INSERT INTO TABLE (C1,C2) VALUES (@C1, @C2)
        public int baseSQLExecuteParamMySQL(List<ClsData> list1)
        {
            int ret = 0;
            MySqlCommand cmd = new MySqlCommand("", baseDao.conMySQL);

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.SQL)
                {
                    cmd.CommandText = ClsData.paramString;
                    cmd.CommandType = CommandType.Text;
                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    SqlDbType sqlType = SqlDbType.VarChar;

                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        sqlType = SqlDbType.Int;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else
                    {
                        sqlType = SqlDbType.VarChar;
                    }
                    cmd.Parameters.Add(ClsData.paramString, sqlType).Value = ClsData.paramValue;
                }
            }

            //transaction
            if (baseDao.tranFlagMySQL == true && baseDao.tranMySQL != null)
            {
                cmd.Transaction = baseDao.tranMySQL;
            }
            ret = cmd.ExecuteNonQuery();

            return ret;
        }
        

        //
        // Procedure with Parameter
        //
        public List<ClsData> baseProcedureParam(List<ClsData> list1)
        {
            if(baseDao.isMySQL)
            {
                return baseProcedureParamMySQL(list1);
            }
            else if(baseDao.isSQLServer)
            {
                return baseProcedureParamSQLServer(list1);
            }
            else if (baseDao.isODBC)
            {
                return baseProcedureParamODBC(list1);
            }
            else
            {
                return new List<ClsData>();
            }
        }



        
        //
        // SQLServer Procedure with Parameter
        //
        private List<ClsData> baseProcedureParamSQLServer(List<ClsData> list1)
        {
            List<ClsData> ret = new List<ClsData>();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baseDao.conSQLServer;
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.PROCEDURE)
                {
                    cmd.CommandText = ClsData.paramString;
                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    SqlParameter param = new SqlParameter();
                    SqlDbType sqlType = SqlDbType.VarChar;
                    ParameterDirection sqlDirection = ParameterDirection.Input;
                    int sqlSize = 0;

                    // parameter type
                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        sqlType = SqlDbType.Int;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        sqlType = SqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.VARCHAR)
                    {
                        sqlType = SqlDbType.VarChar;
                    }
                    
                    // parameter direction
                    if (ClsData.paramInOut == BizUtil.eInOut.IN)
                    {
                        sqlDirection = ParameterDirection.Input;
                    }
                    else if (ClsData.paramInOut == BizUtil.eInOut.OUT)
                    {
                        sqlDirection = ParameterDirection.Output;
                    }
                    else if (ClsData.paramInOut == BizUtil.eInOut.INOUT)
                    {
                        sqlDirection = ParameterDirection.InputOutput;
                    }

                    //param size
                    if (ClsData.paramSize == BizUtil.eSize.S_100)
                    {
                        sqlSize = 100;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S_500)
                    {
                        sqlSize = 500;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S1000)
                    {
                        sqlSize = 1000;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S4000)
                    {
                        sqlSize = 4000;
                    }

                    param.ParameterName = ClsData.paramString;
                    param.SqlDbType = sqlType;
                    param.Direction = sqlDirection;

                    
                    param.Value = "" + ClsData.paramValue;
                    if (sqlSize > 0) { param.Size = sqlSize; }
                    cmd.Parameters.Add(param);                    

                }

            }

            // transaction
            if (baseDao.tranFlagSQLServer == true && baseDao.tranSQLServer != null)
            {
                cmd.Transaction = baseDao.tranSQLServer;
            }

            ///cmd.ExecuteNonQuery();
            DataSet dsSQLServer = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dsSQLServer);


            // DataTable 먼저 처리함
            for (int i = 0; i < dsSQLServer.Tables.Count; i++)
            {
                if (!dsSQLServer.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                {
                    ClsData item = new ClsData();
                    item.paramDataSet = new DataSet();
                    item.paramDataSet.Tables.Add(dsSQLServer.Tables[i].Copy());

                    item.paramDataTable = dsSQLServer.Tables[i].Copy();

                    ret.Add(item);
                }
            }
            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER &&
                    (ClsData.paramInOut == BizUtil.eInOut.INOUT || ClsData.paramInOut == BizUtil.eInOut.OUT))
                {
                    ClsData item = new ClsData();

                    if (ClsData.paramType == BizUtil.eType.VARCHAR || ClsData.paramType == BizUtil.eType.CLOB)
                    {
                        item.paramType = BizUtil.eType.VARCHAR;
                        item.paramString = cmd.Parameters[ClsData.paramString].Value.ToString();
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64)
                    {
                        item.paramType = BizUtil.eType.INT64;
                        item.paramInt64 = Int64.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        item.paramType = BizUtil.eType.DECIMAL;
                        item.paramDeciaml = Decimal.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        item.paramType = BizUtil.eType.INT;
                        item.paramInt = Int32.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        item.paramType = BizUtil.eType.DOUBLE;
                        item.paramDouble = Double.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                                        
                }
            }                       
            
            return ret;
        }



        //
        // ODBC Procedure with Parameter
        //
        private List<ClsData> baseProcedureParamODBC(List<ClsData> list1)
        {
            List<ClsData> ret = new List<ClsData>();

            OdbcCommand cmd = new OdbcCommand();
            cmd.Connection = baseDao.conODBC;
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.PROCEDURE)
                {
                    cmd.CommandText = ClsData.paramString;
                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    OdbcParameter param = new  OdbcParameter();
                    OdbcType odbcType = OdbcType.VarChar;
                    ParameterDirection sqlDirection = ParameterDirection.Input;
                    int sqlSize = 0;

                    // parameter type
                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        odbcType = OdbcType.Int;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        odbcType = OdbcType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        odbcType = OdbcType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.VARCHAR)
                    {
                        odbcType = OdbcType.VarChar;
                    }

                    // parameter direction
                    if (ClsData.paramInOut == BizUtil.eInOut.IN)
                    {
                        sqlDirection = ParameterDirection.Input;
                    }
                    else if (ClsData.paramInOut == BizUtil.eInOut.OUT)
                    {
                        sqlDirection = ParameterDirection.Output;
                    }
                    else if (ClsData.paramInOut == BizUtil.eInOut.INOUT)
                    {
                        sqlDirection = ParameterDirection.InputOutput;
                    }

                    //param size
                    if (ClsData.paramSize == BizUtil.eSize.S_100)
                    {
                        sqlSize = 100;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S_500)
                    {
                        sqlSize = 500;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S1000)
                    {
                        sqlSize = 1000;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S4000)
                    {
                        sqlSize = 4000;
                    }

                    param.ParameterName = ClsData.paramString;
                    param.OdbcType = odbcType;
                    param.Direction = sqlDirection;


                    param.Value = "" + ClsData.paramValue;
                    if (sqlSize > 0) { param.Size = sqlSize; }
                    cmd.Parameters.Add(param);

                }

            }

            // transaction
            if (baseDao.tranFlagODBC == true && baseDao.tranODBC != null)
            {
                cmd.Transaction = baseDao.tranODBC;
            }

            ///cmd.ExecuteNonQuery();
            DataSet dsODBC = new DataSet();
            OdbcDataAdapter da = new OdbcDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dsODBC);


            // DataTable 먼저 처리함
            for (int i = 0; i < dsODBC.Tables.Count; i++)
            {
                if (!dsODBC.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                {
                    ClsData item = new ClsData();
                    item.paramDataSet = new DataSet();
                    item.paramDataSet.Tables.Add(dsODBC.Tables[i].Copy());

                    item.paramDataTable = dsODBC.Tables[i].Copy();

                    ret.Add(item);
                }
            }
            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER &&
                    (ClsData.paramInOut == BizUtil.eInOut.INOUT || ClsData.paramInOut == BizUtil.eInOut.OUT))
                {
                    ClsData item = new ClsData();

                    if (ClsData.paramType == BizUtil.eType.VARCHAR || ClsData.paramType == BizUtil.eType.CLOB)
                    {
                        item.paramType = BizUtil.eType.VARCHAR;
                        item.paramString = cmd.Parameters[ClsData.paramString].Value.ToString();
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64)
                    {
                        item.paramType = BizUtil.eType.INT64;
                        item.paramInt64 = Int64.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        item.paramType = BizUtil.eType.DECIMAL;
                        item.paramDeciaml = Decimal.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        item.paramType = BizUtil.eType.INT;
                        item.paramInt = Int32.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        item.paramType = BizUtil.eType.DOUBLE;
                        item.paramDouble = Double.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        ret.Add(item);
                    }

                }
            }

            return ret;
        }

        //
        // MySQL Procedure with Parameter
        //
        private List<ClsData> baseProcedureParamMySQL(List<ClsData> list1)
        {
            List<ClsData> ret = new List<ClsData>();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = baseDao.conMySQL;
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.PROCEDURE)
                {
                    ///string packageName = ClsData.paramString.Substring(ClsData.paramString.LastIndexOf(".") + 1);
                    string packageName = ClsData.paramString.Replace(".", "$");
                    cmd.CommandText = packageName;
                }
                else if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER)
                {
                    MySqlParameter param = new MySqlParameter();
                    MySqlDbType sqlType = MySqlDbType.VarChar;
                    ParameterDirection sqlDirection = ParameterDirection.Input;
                    int sqlSize = 0;

                    // parameter type
                    if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        sqlType = MySqlDbType.Int32;
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        sqlType = MySqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64 || ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        sqlType = MySqlDbType.Decimal;
                    }
                    else if (ClsData.paramType == BizUtil.eType.VARCHAR)
                    {
                        sqlType = MySqlDbType.VarChar;
                    }
                    else if(ClsData.paramType == BizUtil.eType.BLOB)
                    {
                        sqlType = MySqlDbType.Blob;
                    }
                    
                    
                    // parameter direction
                    if (ClsData.paramInOut == BizUtil.eInOut.IN)
                    {
                        sqlDirection = ParameterDirection.Input;
                    }
                    else if (ClsData.paramInOut == BizUtil.eInOut.OUT)
                    {
                        sqlDirection = ParameterDirection.Output;
                    }
                    else if (ClsData.paramInOut == BizUtil.eInOut.INOUT)
                    {
                        sqlDirection = ParameterDirection.InputOutput;
                    }

                    //param size
                    if (ClsData.paramSize == BizUtil.eSize.S_100)
                    {
                        sqlSize = 100;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S_500)
                    {
                        sqlSize = 500;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S1000)
                    {
                        sqlSize = 1000;
                    }
                    else if (ClsData.paramSize == BizUtil.eSize.S4000)
                    {
                        sqlSize = 4000;
                    }


                    if (ClsData.paramType == BizUtil.eType.BLOB)
                    {
                        byte[] data = (byte[])ClsData.paramValue;

                        param.ParameterName = ClsData.paramString;
                        param.MySqlDbType = sqlType;
                        param.Direction = sqlDirection;

                        param.Value = data;
                        if (sqlSize > 0) { param.Size = sqlSize; }
                        cmd.Parameters.Add(param);
                    }
                    else
                    {
                        param.ParameterName = ClsData.paramString;
                        param.MySqlDbType = sqlType;
                        param.Direction = sqlDirection;


                        param.Value = "" + ClsData.paramValue;
                        if (sqlSize > 0) { param.Size = sqlSize; }
                        cmd.Parameters.Add(param);
                    }

                    
                }
            }

            // transaction
            if (baseDao.tranFlagMySQL == true && baseDao.tranMySQL != null)
            {
                cmd.Transaction = baseDao.tranMySQL;
            }

            
            DataSet dsMySQL = new DataSet();
            DataSet dsParam = new DataSet();
            MySqlDataAdapter da = new MySqlDataAdapter();

            da.SelectCommand = cmd;
            da.Fill(dsMySQL);

            foreach (MySqlParameter outParamter in cmd.Parameters)
            {
                DataTable dataTable = new DataTable();
                dataTable.TableName = outParamter.ParameterName;
                if (outParamter.Direction == ParameterDirection.InputOutput || outParamter.Direction == ParameterDirection.Output)
                {
                    if (!outParamter.ParameterName.StartsWith("O_RESULT_CURSOR"))
                    {
                        dataTable.Columns.Add(new DataColumn(outParamter.ParameterName));
                        DataRow dataRow = dataTable.NewRow();
                        dataRow = dataTable.NewRow();
                        dataRow[outParamter.ParameterName] = outParamter.Value;
                        dataTable.Rows.Add(dataRow);

                        dsParam.Tables.Add(dataTable);
                    }                    
                }
            }

            //O_RESULT_CURSOR
            List<string> arrTableName = new List<string>();

            // 테이블 명칭 추출
            for (int i = 0; i < dsMySQL.Tables.Count; i++)
            {
                if (dsMySQL.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                {
                    for (int j = 0; j < dsMySQL.Tables[i].Rows.Count; j++)
                    {
                        arrTableName.Add(dsMySQL.Tables[i].Rows[j][0].ToString());
                    }
                }
            }

            // 테이블 추출
            int idxTable = 0;
            for (int i = 0; i < dsMySQL.Tables.Count; i++)
            {
                if (!dsMySQL.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                {
                    DataTable dataTable = new DataTable();
                    dataTable = dsMySQL.Tables[i];

                    if (arrTableName.Count >= idxTable + 1)
                    {
                        dataTable.TableName = arrTableName[idxTable];
                        dsParam.Tables.Add(dataTable.Copy());
                        idxTable++;
                    }                    
                    
                }
            }

           
            idxTable = 0;
            foreach (ClsData ClsData in list1)
            {
                if (ClsData.paramGubn == BizUtil.eGubn.PARAMETER &&
                    (ClsData.paramInOut == BizUtil.eInOut.INOUT || ClsData.paramInOut == BizUtil.eInOut.OUT))
                {
                    ClsData item = new ClsData();

                    if (ClsData.paramType == BizUtil.eType.CURSOR)
                    {
                        item.paramType = BizUtil.eType.CURSOR;

                        if (dsParam.Tables[ClsData.paramString] == null)
                        {
                            item.paramDataTable = null;
                        }
                        else
                        {
                            item.paramDataTable = dsParam.Tables[ClsData.paramString].Copy();
                            item.paramDataSet = new DataSet();
                            item.paramDataSet.Tables.Add(dsParam.Tables[ClsData.paramString].Copy());
                        }
                        ret.Add(item);
                        idxTable++;
                    }
                    else if (ClsData.paramType == BizUtil.eType.VARCHAR || ClsData.paramType == BizUtil.eType.CLOB)
                    {
                        item.paramType = BizUtil.eType.VARCHAR;

                        ///item.paramString = cmd.Parameters[ClsData.paramString].Value.ToString();
                        item.paramString = dsParam.Tables[ClsData.paramString].Rows[0][0].ToString();

                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT64)
                    {
                        item.paramType = BizUtil.eType.INT64;

                        ///item.paramInt64 = Int64.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        item.paramInt64 = Int64.Parse(dsParam.Tables[ClsData.paramString].Rows[0][0].ToString());

                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.DECIMAL)
                    {
                        item.paramType = BizUtil.eType.DECIMAL;

                        ///item.paramDeciaml = Decimal.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        item.paramDeciaml = Decimal.Parse(dsParam.Tables[ClsData.paramString].Rows[0][0].ToString());

                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.INT)
                    {
                        item.paramType = BizUtil.eType.INT;

                        ///item.paramInt = Int32.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        item.paramInt = Int32.Parse(dsParam.Tables[ClsData.paramString].Rows[0][0].ToString());

                        ret.Add(item);
                    }
                    else if (ClsData.paramType == BizUtil.eType.DOUBLE)
                    {
                        item.paramType = BizUtil.eType.DOUBLE;

                        ///item.paramDouble = Double.Parse(cmd.Parameters[ClsData.paramString].Value.ToString());
                        item.paramDouble = Double.Parse(dsParam.Tables[ClsData.paramString].Rows[0][0].ToString());

                        ret.Add(item);
                    }


                }
            }
           
            
            return ret;
        }


        //
        // SQL Select with Parameter : AACT
        //
        public ClsData baseProcedureParamAACT(List<ClsData> list1)
        {
            List<ClsData> retList = null;
            ClsData ret = new ClsData();

            retList = baseProcedureParam(list1);

            if(retList.Count == 4)
            {
                ret.outDataSet = retList[0].paramDataSet;
                ret.outDataTable = retList[0].paramDataTable;
                ret.outErrFlag = retList[1].paramString;
                ret.outRetCode = retList[2].paramString;
                ret.outRetMsg = retList[3].paramString;
                //
                ret.outErrorMsg = retList[3].paramString;
            }
          
            else
            {       // param count=3
                ret.outErrFlag = retList[0].paramString;
                ret.outRetCode = retList[1].paramString;
                ret.outRetMsg = retList[2].paramString;
                //
                ret.outErrorMsg = retList[2].paramString;
            }

            return ret;
        }


        //
        // SQL Select with Parameter : Tariff
        //
        public ClsData baseProcedureParamTariff(List<ClsData> list1)
        {
            List<ClsData> retList = null;
            ClsData ret = new ClsData();

            retList = baseProcedureParam(list1);
            //int a = retList.Count;
            if (retList.Count == 3)
            {
                if (retList[0].paramType == BizUtil.eType.CURSOR)
                {
                    ret.outDataSet = retList[0].paramDataSet;
                    ret.outDataTable = retList[0].paramDataTable;

                    ret.outRetCode = retList[1].paramString;
                    ret.outRetMsg = retList[2].paramString;
                    //
                    ret.outErrorCd = retList[1].paramString;
                    ret.outErrorMsg = retList[2].paramString;
                }
                else {
                    ret.outErrFlag = retList[0].paramString;
                    ret.outRetCode = retList[1].paramString;
                    ret.outRetMsg = retList[2].paramString;
                }
                
            }else if (retList.Count == 4)               // tariff 박정훈 수정
            {
                if (retList[0].paramType == BizUtil.eType.CURSOR)
                {
                    ret.outDataSet = retList[0].paramDataSet;
                    ret.outDataTable = retList[0].paramDataTable;

                    ret.outErrFlag = retList[1].paramString;
                    ret.outRetCode = retList[2].paramString;
                    ret.outRetMsg = retList[3].paramString;

                }
                else 
                {
                    ret.outRetSID = Convert.ToInt64(retList[0].paramString);
                    ret.outErrFlag = retList[1].paramString;
                    ret.outRetCode = retList[2].paramString;
                    ret.outRetMsg = retList[3].paramString;
                }

                
            }
            else if (retList.Count == 0 || retList.Count == null)
            {
                ret.outRetCode = "Y";
                ret.outRetMsg = "조회된 값이 없습니다.";
            }
            
            else
            {       // param count=2
                ret.outRetCode = retList[0].paramString;
                ret.outRetMsg = retList[1].paramString;

                ret.outErrFlag = retList[0].paramString;
                ret.outErrorMsg = retList[1].paramString;
            }

            return ret;
        }


        //
        // DB 시간
        //
        public string baseGetDBDateTime()
        {
            string ret = "";
            string sql = "";

            if (baseDao.isMySQL)
            {
                sql = "SELECT  DATE_FORMAT( NOW(), '%Y-%m-%d %H:%i:%s') AS COL1 ";
            }
            else if(baseDao.isSQLServer)
            {
                sql = "SELECT CONVERT(varchar, getdate(), 120) AS COL1 ";
            }
            else
            {
                sql = "SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS COL1 FROM DUAL ";
            }
            
            List<ClsData> List1 = new List<ClsData>();
            ClsData item = null;
            DataSet ds = null;

            //sql
            item = new ClsData();
            item.setData(BizUtil.eGubn.SQL, sql, BizUtil.eType.NULL, "");
            List1.Add(item);

            ds = this.baseSQLSelectParam(List1);

            ret = ds.Tables[0].Rows[0]["COL1"].ToString();

            return ret;
        }

        /*
         * Oracle GUID 값
         * */
        public string baseGetGUID()
        {
            return Guid.NewGuid().ToString();
        }


        //
        // WAS 시간
        //
        public string baseGetWASDateTime()
        {
            return DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet baseGetAllYesNoList()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;

            dc1 = new DataColumn("code", Type.GetType("System.String"));
            dc2 = new DataColumn("name", Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);

            //
            dr = dt.NewRow();
            dr["code"] = "";
            dr["name"] = "전체";
            dt.Rows.Add(dr);


            //
            dr = dt.NewRow();
            dr["code"] = "Y";
            dr["name"] = "예";
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = "아니오";
            dt.Rows.Add(dr);

            ds.Tables.Add(dt);

            return ds;
        }


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet baseGetSelectYesNoList()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;

            dc1 = new DataColumn("code", Type.GetType("System.String"));
            dc2 = new DataColumn("name", Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);

            //
            dr = dt.NewRow();
            dr["code"] = "*";
            dr["name"] = "(선택)";
            dt.Rows.Add(dr);


            //
            dr = dt.NewRow();
            dr["code"] = "Y";
            dr["name"] = "Yes";
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = "No";
            dt.Rows.Add(dr);

            ds.Tables.Add(dt);

            return ds;
        }
       
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet baseGetSelectXrayYesNoExamList()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;
            

            dc1 = new DataColumn("code", Type.GetType("System.String"));
            dc2 = new DataColumn("name", Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);

            //
            dr = dt.NewRow();
            dr["code"] = "Y";
            dr["name"] = "Yes";
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = "No";
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = null;
            dr["name"] = "검사안함";
            dt.Rows.Add(dr);


            ds.Tables.Add(dt);

            return ds;
        }


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet baseGetYesNoList()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;

            dc1 = new DataColumn("code", Type.GetType("System.String"));
            dc2 = new DataColumn("name", Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);

            //
            dr = dt.NewRow();
            dr["code"] = "Y";
            dr["name"] = YesNoCaption[0];
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = YesNoCaption[1];
            dt.Rows.Add(dr);

            ds.Tables.Add(dt);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet baseCUSTOMER_TYPEList()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr = null;
            DataColumn dc1 = null;
            DataColumn dc2 = null;

            dc1 = new DataColumn("code", Type.GetType("System.String"));
            dc2 = new DataColumn("name", Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = CUSTOMER_TYPECaption[0];
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = CUSTOMER_TYPECaption[1];
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = CUSTOMER_TYPECaption[2];
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = CUSTOMER_TYPECaption[3];
            dt.Rows.Add(dr);
            ds.Tables.Add(dt);
            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = CUSTOMER_TYPECaption[4];
            dt.Rows.Add(dr);

            //
            dr = dt.NewRow();
            dr["code"] = "N";
            dr["name"] = CUSTOMER_TYPECaption[5];
            dt.Rows.Add(dr);

            return ds;
        }
        public Hashtable convertRowToHashTable(DataTable dataTable, int rowIndex, string bizFormName = "", string methodName = "", bool iFlag = false)
        {
            Hashtable hashTable = new Hashtable();
          


            string key = null;
            string value = null;
           
            foreach (DataColumn dataColumn in dataTable.Columns)
            {
                key = (string)dataColumn.ColumnName;
                value = Convert.ToString(dataTable.Rows[rowIndex][key]);
                if (iFlag)
                {
                    if (key.IndexOf("I_") != 0)
                    {
                        key = "I_" + key;    
                    }
                }
                else
                {

                }
                if (hashTable.Contains(key) == false)
                {
                    hashTable.Add(key, value);
                }
            }
            return hashTable;
        }

        public DataTable filterParameterHashTable(DataSet ds, string table_name, string filter)
        {
            DataTable baseTable = new DataTable();
            DataTable dataTable = new DataTable();
            baseTable = ds.Tables[table_name];
            if (baseTable != null && baseTable.Rows.Count != 0) 
            {
                dataTable = baseTable.Clone();
                DataRow[] filterResult = baseTable.Select(filter);
                for (int i = 0; i < filterResult.Length; i++)
                {
                    dataTable.ImportRow(filterResult[i]);
                }
            }

            return dataTable;
        }

        public DataTable baseMetaDataForSP(string packageName, string procedureName, DaoSAT paramBaseDao = null)
        {
            bool isOracle = true;
            bool isSQLServer = false;
            bool isMySQL = false;

            if (paramBaseDao == null)
            {
                baseDao.ConnectDB();

                isOracle = baseDao.isOracle;
                isSQLServer = baseDao.isSQLServer;
                isMySQL = baseDao.isMySQL;
            }
            else
            {
                isOracle = paramBaseDao.isOracle;
                isSQLServer = paramBaseDao.isSQLServer;
                isMySQL = paramBaseDao.isMySQL;
            }

            if (isSQLServer)
            {
                return baseMetaDataForSPSQLServer(packageName, procedureName, paramBaseDao);
            }
            else if (isMySQL)
            {
                if (paramBaseDao == null)
                {
                    return baseMetaDataForSPMySQL(packageName, procedureName, baseDao);
                }
                else
                {
                    return baseMetaDataForSPMySQL(packageName, procedureName, paramBaseDao);
                }
                
            }
            else
            {
                return new DataTable();
            }            
        }

        
        public DataTable baseMetaDataForSPSQLServer(string packageName, string procedureName, DaoSAT paramBaseDao = null)
        {   
            DataTable metaDatatable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            SqlCommand cmd;
            if (paramBaseDao == null)
            {
                cmd = new SqlCommand("SYS_GET_PROCEDURE_ARGS", baseDao.conSQLServer);
            }
            else
            {
                cmd = new SqlCommand("SYS_GET_PROCEDURE_ARGS", paramBaseDao.conSQLServer);
                cmd.Transaction = paramBaseDao.tranSQLServer;
            }

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("I_PACKAGE_NAME", SqlDbType.VarChar).Value = packageName;
            cmd.Parameters.Add("I_PROCUEDURE_NAME", SqlDbType.VarChar).Value = procedureName;
            cmd.Parameters.Add("I_LANGUAGE_CODE", SqlDbType.VarChar).Value = "en";
            cmd.Parameters.Add("I_PROGRESS_GUID", SqlDbType.VarChar).Value = baseGetGUID();
            cmd.Parameters.Add("I_REQUEST_USER_ID", SqlDbType.VarChar).Value = "SYSTEM";
            cmd.Parameters.Add("I_REQUEST_IP_ADDRESS", SqlDbType.VarChar).Value = "WebService";
            cmd.Parameters.Add("I_REQUEST_PROGRAM_ID", SqlDbType.VarChar).Value = "baseMetaDataForSP()";

            cmd.Parameters.Add("O_ERROR_FLAG", SqlDbType.VarChar, 4000).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("O_RETURN_CODE", SqlDbType.VarChar, 4000).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("O_RETURN_MESSAGE", SqlDbType.VarChar, 4000).Direction = ParameterDirection.Output;
            
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(metaDatatable);

            ////if (paramBaseDao == null)
            ////{
            ////    baseDao.DisConnectDB();
            ////}
            
            return metaDatatable;
        }

        public DataTable baseMetaDataForSPMySQL(string packageName, string procedureName, DaoSAT paramBaseDao = null)
        {


            DataTable metaDatatable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter();
            MySqlCommand cmd;
            if (paramBaseDao == null)
            {
                cmd = new MySqlCommand("SYS_GET_PROCEDURE_ARGS", baseDao.conMySQL);
            }
            else
            {
                cmd = new MySqlCommand("SYS_GET_PROCEDURE_ARGS", paramBaseDao.conMySQL);
                cmd.Transaction = paramBaseDao.tranMySQL;
            }

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("I_PACKAGE_NAME", MySqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("I_PROCUEDURE_NAME", MySqlDbType.VarChar).Value = packageName + "$" + procedureName;
            cmd.Parameters.Add("I_LANGUAGE_CODE", MySqlDbType.VarChar).Value = "en";
            cmd.Parameters.Add("I_PROGRESS_GUID", MySqlDbType.VarChar).Value = baseGetGUID();
            cmd.Parameters.Add("I_REQUEST_USER_ID", MySqlDbType.VarChar).Value = "SYSTEM";
            cmd.Parameters.Add("I_REQUEST_IP_ADDRESS", MySqlDbType.VarChar).Value = "WebService";
            cmd.Parameters.Add("I_REQUEST_PROGRAM_ID", MySqlDbType.VarChar).Value = "baseMetaDataForSP()";

            cmd.Parameters.Add("O_ERROR_FLAG", MySqlDbType.VarChar, 4000).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("O_RETURN_CODE", MySqlDbType.VarChar, 4000).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("O_RETURN_MESSAGE", MySqlDbType.VarChar, 4000).Direction = ParameterDirection.Output;

            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(metaDatatable);

            ////if (paramBaseDao == null) 
            ////{
            ////    baseDao.DisConnectDB();
            ////}

            return metaDatatable;
        }




        public SqlDbType getSQLServerType(string dataType)
        {
            switch (dataType)
            {
                case "NUMBER":
                    return SqlDbType.Decimal;
                case "CLOB":
                    return SqlDbType.Text;
                case "BLOB":
                    return SqlDbType.Image;                
            }
            return SqlDbType.VarChar;
        }

        public MySqlDbType getMySQLType(string dataType)
        {
            switch (dataType.ToUpper())
            {
                case "NUMBER":
                    return MySqlDbType.Decimal;
                case "CLOB":
                    return MySqlDbType.LongText;
                case "BLOB":
                    return MySqlDbType.Blob;
            }
            return MySqlDbType.VarChar;
        }

        public Hashtable basePackageSPAutoBinding(Hashtable ht, string packageFullName, DaoSAT paramBaseDao = null, DataTable parmMetaDataTable = null)
        {
            string[] packageName = packageFullName.Split('.');
            DataTable metaDataTable;
            Hashtable bindHashTable =  new Hashtable();

            if (parmMetaDataTable == null)
            {
                metaDataTable = this.baseMetaDataForSP(packageName[0], packageName[1], paramBaseDao);
            }
            else
            {
                metaDataTable = parmMetaDataTable;
            }


            foreach (DataRow mataDataRow in metaDataTable.Rows)
            {
                string argumentName = mataDataRow["ARGUMENT_NAME"].ToString();
                string inout = mataDataRow["IN_OUT"].ToString();

                string parameterName = mataDataRow["ARGUMENT_NAME"].ToString();
                string parameterDataType = mataDataRow["DATA_TYPE"].ToString();
                Object parameterValue = null;
                if (ht[parameterName] != null)
                {
                    parameterValue = ht[parameterName];

                    if (parameterDataType == "NUMBER")
                    {
                        if (parameterValue == "")
                        {
                            parameterValue = "0";
                        }
                    }
                }
                
                Object[] parameterObject = { parameterDataType, parameterValue };

                if (inout == "IN" && ht.Contains(argumentName) == true)
                {
                    bindHashTable.Add(parameterName, parameterObject);
                }
                else
                {
                    if (inout == "IN/OUT" && ht[argumentName] != null)
                    {
                        bindHashTable.Add(parameterName, parameterObject);
                    }
                    else
                    {

                        bindHashTable.Add(parameterName, parameterObject);
                    }
                    //string parameterName = mataDataRow["ARGUMENT_NAME"].ToString(); // IN/OUT 파라미터의 경우 VALUE를 NULL로 보내버림 ㅠㅠ
                    //string parameterDataType = mataDataRow["DATA_TYPE"].ToString();
                    //bindHashTable.Add(parameterName, parameterDataType);  
                }

            }

            return bindHashTable;
        }
        public DataSet basePackageSPAutoBindingAndCall(Hashtable ht, string packageFullName)
        {
            if (ht.ContainsKey("SAT_CONNECT"))
            {
                DaoSAT tempDao = new DaoSAT();
                tempDao.ConnectDB(ht["SAT_CONNECT"].ToString());
                Hashtable bindingHash = basePackageSPAutoBinding(ht, packageFullName, tempDao);
                Hashtable bindingHash1 = basePackageSPAutoBinding(ht, packageFullName, tempDao);
                Hashtable bindingHash2 = basePackageSPAutoBinding(ht, packageFullName, tempDao);
                if (ht.ContainsKey("CONNECT_TIME"))
                {
                    bindingHash.Add("CONNECT_TIME", ht["CONNECT_TIME"]);
                }
                return baseCallPackageSP(bindingHash, packageFullName, tempDao);
            }
            else
            {
                Hashtable bindingHash = basePackageSPAutoBinding(ht, packageFullName);
                if (ht.ContainsKey("CONNECT_TIME"))
                {
                    bindingHash.Add("CONNECT_TIME", ht["CONNECT_TIME"]);
                }
                return baseCallPackageSP(bindingHash, packageFullName);
            }
        }

        public DataSet basePackageSPAutoBindingAndCall(Hashtable ht, string packageFullName, DaoSAT baseDao)
        {
            Hashtable bindingHash = basePackageSPAutoBinding(ht, packageFullName, baseDao);
            return baseCallPackageSP(bindingHash, packageFullName, baseDao);
        }

        public Hashtable basePackageSPManualBinding(Hashtable ht, string packageFullName)
        {


            string[] packageName = packageFullName.Split('.');
            DataTable metaDataTable = this.baseMetaDataForSP(packageName[0], packageName[1]);
            Hashtable bindHashTable = new Hashtable();
            string parameterName = null;
            string parameterValue = null;
            string parameterDataType = null;

            foreach (DictionaryEntry  item in ht)
            {
                parameterName = item.Key.ToString().Trim();
                parameterValue = item.Value.ToString().Trim();
                switch (parameterName)
                {
                    case "I_LANGUAGE_CODE":
                    case "I_PROGRESS_GUID":
                    case "I_REQUEST_USER_ID":
                    case "I_REQUEST_IP_ADDRESS":
                    case "I_REQUEST_PROGRAM_ID":
                        bindHashTable.Add(parameterName, parameterValue);
                        break;
                }
            }

            foreach (DataRow mataDataRow in metaDataTable.Rows)
            {
                string argumentName = mataDataRow["ARGUMENT_NAME"].ToString();
                string inout = mataDataRow["IN_OUT"].ToString();

                if (inout != "IN")
                {
                    parameterName = mataDataRow["ARGUMENT_NAME"].ToString();
                    parameterDataType = mataDataRow["DATA_TYPE"].ToString();
                    bindHashTable.Add(parameterName, parameterDataType);
                }
            }

            return bindHashTable;
        }
       

        public DataSet baseCallPackageSP(Hashtable ht, string packageFullName, DaoSAT paramBaseDao = null)
        {
            if (paramBaseDao == null)
            {
                if (baseDao.isMySQL)
                {
                    return baseCallPackageSPMySQL(ht, packageFullName, paramBaseDao);
                }
                else if (baseDao.isSQLServer)
                {
                    return baseCallPackageSPSQLServer(ht, packageFullName, paramBaseDao);
                }
                else
                {
                    return new DataSet();
                }
            }
            else
            {
                if (paramBaseDao.isMySQL)
                {
                    return baseCallPackageSPMySQL(ht, packageFullName, paramBaseDao);
                }
                else if (paramBaseDao.isSQLServer)
                {
                    return baseCallPackageSPSQLServer(ht, packageFullName, paramBaseDao);
                }
                else
                {
                    return new DataSet();
                }
            }

            
        }

        
        public DataSet baseCallPackageSPSQLServer(Hashtable ht, string _packageFullName, DaoSAT paramBaseDao = null)
        {
            string packageFullName = _packageFullName.Substring(_packageFullName.LastIndexOf(".") + 1);
            DataSet dataSet = new DataSet();
            
            if (paramBaseDao == null)
            {
                baseDao.ConnectDB();
            }

            SqlCommand cmd = null;
            
            if (paramBaseDao == null)
            {
                cmd = new SqlCommand(packageFullName, baseDao.conSQLServer);
                cmd.Transaction = baseDao.tranSQLServer;
            }
            else
            {
                cmd = new SqlCommand(packageFullName, paramBaseDao.conSQLServer);
                cmd.Transaction = paramBaseDao.tranSQLServer;
            }

            cmd.CommandType = CommandType.StoredProcedure;
            string parameterName = null;
            Object[] parameterObject = null;

            foreach (DictionaryEntry item in ht)
            {
                parameterName = item.Key.ToString().Trim();
                parameterObject = (Object[])item.Value;

                if (parameterName.Contains("I_") && parameterName.IndexOf("I_") == 0)
                {
                    if (getSQLServerType((string)parameterObject[0]) == SqlDbType.Decimal)
                    {
                        Int64 sid;
                        Decimal number;
                        try
                        {
                            sid = Convert.ToInt64(parameterObject[1]);
                        }
                        catch (Exception)
                        {
                            sid = 0;
                        }
                        try
                        {
                            number = Convert.ToDecimal(parameterObject[1]);
                        }
                        catch (Exception)
                        {
                            number = 0;
                        }

                        if (parameterName.Contains("_SID"))
                        {

                            cmd.Parameters.Add(parameterName, getSQLServerType((string)parameterObject[0])).Value = sid;
                        }
                        else
                        {
                            cmd.Parameters.Add(parameterName, getSQLServerType((string)parameterObject[0])).Value = number;
                        }
                    }
                    else
                    {                        
                        if (getSQLServerType((string)parameterObject[0]) == SqlDbType.VarChar)
                        {
                            string strValue = parameterObject[1] == null ? "".TrimEnd() : parameterObject[1].ToString().TrimEnd();
                            cmd.Parameters.Add(parameterName, getSQLServerType((string)parameterObject[0])).Value = strValue;
                        }
                        else
                        {
                            cmd.Parameters.Add(parameterName, getSQLServerType((string)parameterObject[0])).Value = parameterObject[1];
                        }                        
                    }
                }
                else if (parameterName.Contains("IO_") && parameterName.IndexOf("IO_") == 0)
                {
                    SqlParameter I_OUT_Parameter = new SqlParameter();
                    I_OUT_Parameter.Value = parameterObject[1];
                    I_OUT_Parameter.Direction = ParameterDirection.InputOutput;
                    I_OUT_Parameter.ParameterName = parameterName;
                    I_OUT_Parameter.Size = 4000;
                    I_OUT_Parameter.SqlDbType = getSQLServerType((string)parameterObject[0]);
                    cmd.Parameters.Add(I_OUT_Parameter);
                }
                else
                {
                    SqlParameter OUT_Parameter = new SqlParameter();
                    OUT_Parameter.Value = parameterObject[1];
                    OUT_Parameter.Direction = ParameterDirection.Output;
                    OUT_Parameter.ParameterName = parameterName;
                    OUT_Parameter.Size = 4000;
                    OUT_Parameter.SqlDbType = getSQLServerType((string)parameterObject[0]);
                    cmd.Parameters.Add(OUT_Parameter);
                }
            }
            try
            {
                DataSet dsSQLServer = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
            
                if (paramBaseDao == null)
                {
                    da.Fill(dsSQLServer);
                }
                else
                {
                    cmd.Transaction = paramBaseDao.tranSQLServer;
                    da.Fill(dsSQLServer);
                }

                //parameter
                foreach (SqlParameter outParamter in cmd.Parameters)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.TableName = outParamter.ParameterName;
                    if ((outParamter.ParameterName.Contains("O_") && outParamter.ParameterName.IndexOf("O_") == 0) || (outParamter.ParameterName.Contains("IO_") && outParamter.ParameterName.IndexOf("IO_") == 0))
                    {                        
                        dataTable.Columns.Add(new DataColumn(outParamter.ParameterName));
                        DataRow dataRow = dataTable.NewRow();
                        dataRow[outParamter.ParameterName] = outParamter.Value;
                        dataTable.Rows.Add(dataRow);
                        
                        dataSet.Tables.Add(dataTable.Copy());
                    }
                }

                //O_RESULT_CURSOR
                List<string> arrTableName = new List<string>();
                int idxTable = 0;

                // 테이블 명칭 추출
                for (int i = 0; i < dsSQLServer.Tables.Count; i++)
                {                    
                    if(dsSQLServer.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR") )
                    {
                        for (int j = 0; j < dsSQLServer.Tables[i].Rows.Count; j++ )
                        {
                            arrTableName.Add(dsSQLServer.Tables[i].Rows[j][0].ToString());
                        }
                    }
                }

                // 테이블 추출
                for (int i = 0; i < dsSQLServer.Tables.Count; i++)
                {
                    if (! dsSQLServer.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                    {
                        idxTable++;
                        DataTable dataTable = new DataTable();
                        dataTable = dsSQLServer.Tables[i];

                        if (arrTableName.Count >= idxTable)
                        {
                            dataTable.TableName = arrTableName[idxTable];
                        }
                        else
                        {
                            dataTable.TableName = "O_RESULT_CURSOR_" + idxTable;
                        }
                        dataSet.Tables.Add(dataTable.Copy());                        
                    }                    
                }
            }
            catch (Exception exception)
            {
                dataSet = new DataSet();
                DataTable dataTable;

                dataTable = new DataTable();
                dataTable.TableName = "O_ERROR_FLAG";
                DataColumn column = new DataColumn("O_ERROR_FLAG", typeof(string));
                dataTable.Columns.Add(column);
                DataRow row = dataTable.NewRow();
                row["O_ERROR_FLAG"] = 'Y';
                dataTable.Rows.Add(row);
                dataSet.Tables.Add(dataTable.Copy());

                dataTable = new DataTable();
                dataTable.TableName = "O_RETURN_CODE";
                column = new DataColumn("O_RETURN_CODE", typeof(string));
                dataTable.Columns.Add(column);
                row = dataTable.NewRow();
                row["O_RETURN_CODE"] = "ORACLE ERROR";
                dataTable.Rows.Add(row);
                dataSet.Tables.Add(dataTable.Copy());

                dataTable = new DataTable();
                dataTable.TableName = "O_RETURN_MESSAGE";
                column = new DataColumn("O_RETURN_MESSAGE", typeof(string));
                dataTable.Columns.Add(column);
                row = dataTable.NewRow();
                row["O_RETURN_MESSAGE"] = exception.ToString();
                dataTable.Rows.Add(row);
                dataSet.Tables.Add(dataTable.Copy());
                ////if (paramBaseDao == null)
                ////{
                ////    baseDao.DisConnectDB();
                ////}
                return dataSet;
            }
            ////if (paramBaseDao == null)
            ////{
            ////    baseDao.DisConnectDB();
            ////}

            return dataSet;
        }

        public DataSet baseCallPackageSPMySQL(Hashtable ht, string _packageFullName, DaoSAT paramBaseDao = null)
        {
            ///string packageFullName = _packageFullName.Substring(_packageFullName.LastIndexOf(".") + 1);
            string packageFullName = _packageFullName.Replace(".", "$");
            DataSet dataSet = new DataSet();
            
            if (paramBaseDao == null)
            {
                baseDao.ConnectDB();
            }

            MySqlCommand cmd = null;
            

            if (paramBaseDao == null)
            {
                cmd = new MySqlCommand(packageFullName, baseDao.conMySQL);
                if (ht.ContainsKey("CONNECT_TIME"))
                {
                    cmd.CommandTimeout = BizUtil.getInt(ht["CONNECT_TIME"]);
                    ht.Remove("CONNECT_TIME");
                }
                if (baseDao.tranFlagMySQL)
                {
                    cmd.Transaction = baseDao.tranMySQL;
                }                
            }
            else
            {
                cmd = new MySqlCommand(packageFullName, paramBaseDao.conMySQL);
                if (ht.ContainsKey("CONNECT_TIME"))
                {
                    cmd.CommandTimeout = BizUtil.getInt(ht["CONNECT_TIME"]);
                    ht.Remove("CONNECT_TIME");
                }
                if (paramBaseDao.tranFlagMySQL)
                {
                    cmd.Transaction = paramBaseDao.tranMySQL;
                }                
            }

            cmd.CommandType = CommandType.StoredProcedure;
            string parameterName = null;
            Object[] parameterObject = null;

            foreach (DictionaryEntry item in ht)
            {
                parameterName = item.Key.ToString().Trim();
                parameterObject = (Object[])item.Value;

                if (parameterName.Contains("I_") && parameterName.IndexOf("I_") == 0)
                {
                    if (getMySQLType((string)parameterObject[0]) == MySqlDbType.Decimal)
                    {
                        Int64 sid;
                        Decimal number;
                        try
                        {
                            sid = Convert.ToInt64(parameterObject[1]);
                        }
                        catch (Exception)
                        {
                            sid = 0;
                        }
                        try
                        {
                            number = Convert.ToDecimal(parameterObject[1]);
                        }
                        catch (Exception)
                        {
                            number = 0;
                        }

                        if (parameterName.Contains("_SID"))
                        {

                            cmd.Parameters.Add(parameterName, getMySQLType((string)parameterObject[0])).Value = sid;
                        }
                        else
                        {
                            cmd.Parameters.Add(parameterName, getMySQLType((string)parameterObject[0])).Value = number;
                        }
                    }
                    else
                    {
                        if (getMySQLType((string)parameterObject[0]) == MySqlDbType.Blob)
                        {
                            byte[] data = (byte[])parameterObject[1];
                            cmd.Parameters.Add(parameterName, getMySQLType((string)parameterObject[0])).Value = data;
                        }
                        else if (getMySQLType((string)parameterObject[0]) == MySqlDbType.VarChar)
                        {
                            string strValue = parameterObject[1] == null ? "".TrimEnd() : parameterObject[1].ToString().TrimEnd();
                            //MYSQL "" BLANK 를 NULL값으로 처리
                            if (strValue == "")
                            {
                                strValue = null;
                            }
                            cmd.Parameters.Add(parameterName, getMySQLType((string)parameterObject[0])).Value = strValue;
                        }
                        else
                        {
                            cmd.Parameters.Add(parameterName, getMySQLType((string)parameterObject[0])).Value = parameterObject[1];
                        }                        
                    }
                }
                else if (parameterName.Contains("IO_") && parameterName.IndexOf("IO_") == 0)
                {
                    MySqlParameter I_OUT_Parameter = new MySqlParameter();
                    I_OUT_Parameter.Value = parameterObject[1];
                    I_OUT_Parameter.Direction = ParameterDirection.InputOutput;
                    I_OUT_Parameter.ParameterName = parameterName;
                    I_OUT_Parameter.Size = 4000;
                    I_OUT_Parameter.MySqlDbType = getMySQLType((string)parameterObject[0]);
                    cmd.Parameters.Add(I_OUT_Parameter);
                }
                else
                {
                    MySqlParameter OUT_Parameter = new MySqlParameter();
                    OUT_Parameter.Value = parameterObject[1];
                    OUT_Parameter.Direction = ParameterDirection.Output;
                    OUT_Parameter.ParameterName = parameterName;
                    OUT_Parameter.Size = 4000;
                    OUT_Parameter.MySqlDbType = getMySQLType((string)parameterObject[0]);
                    cmd.Parameters.Add(OUT_Parameter);
                }
            }
            try
            {
                DataSet dsMySQL = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.SelectCommand = cmd;
                ///da.UpdateCommand = cmd;
                                
                da.Fill(dsMySQL);
                ///cmd.ExecuteNonQuery();
                
                foreach (MySqlParameter outParamter in cmd.Parameters)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.TableName = outParamter.ParameterName;
                    if ((outParamter.ParameterName.Contains("O_") && outParamter.ParameterName.IndexOf("O_") == 0) || (outParamter.ParameterName.Contains("IO_") && outParamter.ParameterName.IndexOf("IO_") == 0))
                    {                        
                        dataTable.Columns.Add(new DataColumn(outParamter.ParameterName));
                        DataRow dataRow = dataTable.NewRow();
                        dataRow = dataTable.NewRow();
                        dataRow[outParamter.ParameterName] = outParamter.Value;
                        dataTable.Rows.Add(dataRow);
                        
                        dataSet.Tables.Add(dataTable);
                    }
                }


                //O_RESULT_CURSOR
                List<string> arrTableName = new List<string>();                

                // 테이블 명칭 추출
                for (int i = 0; i < dsMySQL.Tables.Count; i++)
                {
                    if (dsMySQL.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                    {
                        for (int j = 0; j < dsMySQL.Tables[i].Rows.Count; j++)
                        {
                            arrTableName.Add(dsMySQL.Tables[i].Rows[j][0].ToString());
                        }
                    }
                }

                // 테이블 추출
                int idxTable = 0;
                for (int i = 0; i < dsMySQL.Tables.Count; i++)
                {
                    if (!dsMySQL.Tables[i].Columns[0].ColumnName.ToString().StartsWith("O_RESULT_CURSOR"))
                    {
                        DataTable dataTable = new DataTable();
                        dataTable = dsMySQL.Tables[i];

                        if (arrTableName.Count >= idxTable + 1)
                        {
                            dataTable.TableName = arrTableName[idxTable];
                        }
                        else
                        {
                            dataTable.TableName = "O_RESULT_CURSOR_" + idxTable;
                        }
                        dataSet.Tables.Add(dataTable.Copy());
                        idxTable++;                        
                    }
                }
            }
            catch (Exception exception)
            {
                dataSet = new DataSet();
                DataTable dataTable;

                dataTable = new DataTable();
                dataTable.TableName = "O_ERROR_FLAG";
                DataColumn column = new DataColumn("O_ERROR_FLAG", typeof(string));
                dataTable.Columns.Add(column);
                DataRow row = dataTable.NewRow();
                row["O_ERROR_FLAG"] = 'Y';
                dataTable.Rows.Add(row);
                dataSet.Tables.Add(dataTable.Copy());

                dataTable = new DataTable();
                dataTable.TableName = "O_RETURN_CODE";
                column = new DataColumn("O_RETURN_CODE", typeof(string));
                dataTable.Columns.Add(column);
                row = dataTable.NewRow();
                row["O_RETURN_CODE"] = "MYSQL ERROR";
                dataTable.Rows.Add(row);
                dataSet.Tables.Add(dataTable.Copy());

                dataTable = new DataTable();
                dataTable.TableName = "O_RETURN_MESSAGE";
                column = new DataColumn("O_RETURN_MESSAGE", typeof(string));
                dataTable.Columns.Add(column);
                row = dataTable.NewRow();
                row["O_RETURN_MESSAGE"] = exception.ToString();
                dataTable.Rows.Add(row);
                dataSet.Tables.Add(dataTable.Copy());
                ////if (paramBaseDao == null)
                ////{
                ////    baseDao.DisConnectDB();
                ////}
                return dataSet;
            }
            ////if (paramBaseDao == null)
            ////{
            ////    baseDao.DisConnectDB();
            ////}

            return dataSet;
        }

        
        public DataSet callProc(Hashtable hs, DataSet ds)
        {

            DataSet result = null;

            Type type = this.GetType();
            string methodName = hs["SAT_METHODNAME"].ToString();
            object[] parametersArray = new object[] { hs, ds };
            MethodInfo methodInfo = type.GetMethod(methodName);
            if (methodInfo != null)
            {
                result = (DataSet)methodInfo.Invoke(this, parametersArray);
            }
            else
            {
                result = new DataSet();
            }
            return result;
        }

        public DataTable getSQLCOLUMNStructure(string sql)
        {

            List<ClsData> List1 = new List<ClsData>();
            ClsData item = null;
            DataSet ds = null;

            //sql
            item = new ClsData();
            item.setData(BizUtil.eGubn.SQL, sql, BizUtil.eType.NULL, "");
            List1.Add(item);
            
            this.baseConnectDB();
            ds = this.baseSQLSelectParam(List1);            

            return ds.Tables[0];
        }

        public DataTable fillBaseParameterForSPIntoGrid(DataTable dataTable, string guid = "")
        {
            addBaseParameterColumns(ref dataTable);
            if (guid.Length == 0)
            {
              //  guid = BaseUtil.getGUID();
            }
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
               fillBaseParameterToRow(ref dataTable, i, guid);
            }

            return dataTable.Copy();
        }

        public void addBaseParameterColumns(ref DataTable dataTable)
        {           
            Hashtable hashTable = baseParameterForSP();
            string key = null;
            string value = null;
            foreach (DictionaryEntry item in hashTable)
            {
                key = item.Key.ToString();
                value = item.Value.ToString();
                if (dataTable.Columns.Contains(key) == false)
                {
                    DataColumn datacolumn = new DataColumn();
                    datacolumn.ColumnName = key;

                    datacolumn.Caption = key;

                    dataTable.Columns.Add(datacolumn);
                }

            }
        }

        public void fillBaseParameterToRow(ref DataTable dataTable, int rowIndex, string guid)
        {
            
            Hashtable hashTable = baseParameterForSP();
            string key = null;
            string value = null;
            foreach (DictionaryEntry item in hashTable)
            {
                key = item.Key.ToString();
                value = item.Value.ToString();
                if (key == "I_PROGRESS_GUID")
                {
                    dataTable.Rows[rowIndex][key] = guid;
                }
                else
                {
                    dataTable.Rows[rowIndex][key] = value;
                }
            }
        }

        public Hashtable baseParameterForSP()
        {
            Hashtable ht = new Hashtable();
            ht.Add("I_LANGUAGE_CODE", "KOR");
            ht.Add("I_PROGRESS_GUID", baseGetGUID());
            ht.Add("I_REQUEST_USER_ID", "SYSTEM");
            ht.Add("I_REQUEST_IP_ADDRESS", "127.0.0.1");
            ht.Add("I_REQUEST_PROGRAM_ID", "SYSTEM");
            return ht;
        }

       
        public string GetOBJECTSID()
        {
            string ret = "";
            string sql = "";
            if(baseDao.isMySQL)
            {
                sql="SELECT  SCM_OBJECT_SID() AS COL1 FROM DUAL";
            }
            else{
                sql="SELECT  SCM_OBJECT_SID.NEXTVAL AS COL1 FROM DUAL";
            }
            

            List<ClsData> List1 = new List<ClsData>();
            ClsData item = null;
            DataSet ds = null;

            //sql
            item = new ClsData();
            item.setData(BizUtil.eGubn.SQL, sql, BizUtil.eType.NULL, "");
            List1.Add(item);
            this.baseConnectDB();
            ds = this.baseSQLSelectParam(List1);

            ret = ds.Tables[0].Rows[0]["COL1"].ToString();

            return ret;
        }

        /// <summary>
        /// DataTable을 HashTable로 변경
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <returns>Hashtable[]</returns>
        public static Hashtable[] getDataTableToHashTable(DataTable dt)
        {
            Hashtable[] hs_arr = new Hashtable[dt.Rows.Count];

            int hs_arr_index = 0;

            foreach (DataRow dr in dt.Rows)
            {
                Hashtable hs = new Hashtable();
                foreach (DataColumn dc in dt.Columns)
                {
                    hs.Add(dc.ColumnName, dt.Rows[hs_arr_index][dc.ColumnName]);
                }
                hs_arr[hs_arr_index] = hs;
                hs_arr_index = hs_arr_index + 1;
            }

            return hs_arr;
        }

        // 프로그램 내에서 로그 파악을 위해 만들어 놓음 (윤상천 이사님이)
        public static void linitial()
        {
            dtLog = new DataTable();

            //[1] 필드정의
            dtLog.Columns.Add(new DataColumn("Time", typeof(string)));
            dtLog.Columns.Add(new DataColumn("Procedure", typeof(string)));
            dtLog.Columns.Add(new DataColumn("Message", typeof(string)));
            dtLog.Columns.Add(new DataColumn("Value", typeof(long)));
        }

        public static void writeLog(string strProcedure, string strMessage)
        {
            DataRow row = null;

            DateTime nNow = DateTime.Now;
            dtLog_row_num++;

            dtLog_LongTime = nNow.Millisecond + (nNow.Second + (nNow.Minute + nNow.Hour * 60) * 60) * 1000;


            //[2] 행추가하기, 데이터 넣기
            //----LOOP로직[시작]----
            row = dtLog.NewRow();  //행추가
            row["Time"] = nNow.ToString("HH:mm:ss.ffff");
            row["Procedure"] = strProcedure;
            row["Message"] = strMessage;

            if (dtLog_row_num > 1)
            {
                row["Value"] = dtLog_LongTime - dtPre_LongTime;
            }
            else
            {
                row["Value"] = dtLog_LongTime;
            }
            dtLog.Rows.Add(row);

            dtPre_LongTime = dtLog_LongTime;

            //----LOOP로직[끝]----

        }
        // 프로그램 내에서 로그 파악을 위해 만들어 놓음 (윤상천 이사님이)

    }
}