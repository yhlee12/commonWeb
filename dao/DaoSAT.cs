using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data.Odbc;

namespace T2LHomePage
{
    public class DaoSAT
    {
        public bool isOracle = false;
        public bool isSQLServer = false;
        public bool isMySQL = false;
        public bool isODBC = false;

        //SQLServer
        public SqlConnection conSQLServer = null;
        public SqlTransaction tranSQLServer = null;
        public bool tranFlagSQLServer { get; set; }

        //ODBC
        public OdbcConnection conODBC = null;
        public OdbcTransaction tranODBC = null;
        public bool tranFlagODBC { get; set; }

        //MySQL
        public MySqlConnection conMySQL = null;
        public MySqlTransaction tranMySQL = null;
        public bool tranFlagMySQL { get; set; }


        
        public void ConnectDB()
        {
            ConnectionStringSettings conStrSet = ConfigurationManager.ConnectionStrings["ITTConnectionString"];
            string sCon = conStrSet.ProviderName;            

            if (sCon.IndexOf("System.Data.SqlClient") >= 0 && conSQLServer == null)
            {   
                isSQLServer = true;
                conSQLServer = new SqlConnection(conStrSet.ConnectionString);
                conSQLServer.Open();
                tranFlagSQLServer = false;             
            }
            else if (sCon.IndexOf("System.Data.Odbc") >= 0 && conODBC == null)
            {
                isODBC = true;
                conODBC = new OdbcConnection(conStrSet.ConnectionString);
                conODBC.Open();
                tranFlagODBC = false;             
            }
            else if (sCon.IndexOf("MySql.Data.MySqlClient") >= 0 && conMySQL == null)
            {   
                isMySQL = true;
                conMySQL = new MySqlConnection(conStrSet.ConnectionString);
                conMySQL.Open();
                tranFlagMySQL = false;

            }
        }

        public void ConnectDB(string conStr)
        {
            ConnectionStringSettings conStrSet = ConfigurationManager.ConnectionStrings[conStr];
            string sCon = conStrSet.ProviderName;

            if (sCon.IndexOf("System.Data.SqlClient") >= 0 && conSQLServer == null)
            {
                isSQLServer = true;
                conSQLServer = new SqlConnection(conStrSet.ConnectionString);
                conSQLServer.Open();
                tranFlagSQLServer = false;
            }
            else if (sCon.IndexOf("System.Data.Odbc") >= 0 && conODBC == null)
            {
                isODBC = true;
                conODBC = new OdbcConnection(conStrSet.ConnectionString);
                conODBC.Open();
                tranFlagODBC = false;

            }
            else if (sCon.IndexOf("MySql.Data.MySqlClient") >= 0 && conMySQL == null)
            {
                isMySQL = true;
                conMySQL = new MySqlConnection(conStrSet.ConnectionString);
                conMySQL.Open();
                tranFlagMySQL = false;

            }
        }

        public void BeginTran()
        {
            if (isSQLServer)
            {
                tranSQLServer = conSQLServer.BeginTransaction();
                tranFlagSQLServer = true;
            }
            else if(isODBC)
            {
                tranODBC = conODBC.BeginTransaction();
                tranFlagODBC = true;
            }
            else if (isMySQL)
            {
                tranMySQL = conMySQL.BeginTransaction();
                tranFlagMySQL = true;
            }
        }

        public void CommitTran()
        {
            if(isSQLServer)
            {
                tranSQLServer.Commit();
                tranFlagSQLServer = false;
            }
            else if(isODBC)
            {
                tranODBC.Commit();
                tranFlagODBC = false;
            }
            else if(isMySQL)
            {
                tranMySQL.Commit();
                tranFlagMySQL = false;
            }
        }

        public void RollbackTran()
        {
            if (isSQLServer)
            {
                tranSQLServer.Rollback();
                tranFlagSQLServer = false;
            }
            else if(isODBC)
            {
                tranODBC.Rollback();
                tranFlagODBC = false;
            }
            else if(isMySQL)
            {
                tranMySQL.Rollback();
                tranFlagMySQL = false;
            }
        }

        public void DisConnectDB()
        {
            if (isSQLServer)
            {
                if (tranFlagSQLServer == true && tranSQLServer != null)
                {
                    tranSQLServer.Rollback();
                }
                if (conSQLServer != null)
                {
                    conSQLServer.Close();
                    conSQLServer.Dispose();
                    conSQLServer = null;
                }
            }
            else if(isODBC)
            {
                if (tranFlagODBC == true && tranODBC != null)
                {
                    tranODBC.Rollback();
                }
                if (conODBC != null)
                {
                    conODBC.Close();
                    conODBC.Dispose();
                    conODBC = null;
                }
            }
            else if(isMySQL)
            {
                if (tranFlagMySQL == true && tranMySQL != null)
                {
                    tranMySQL.Rollback();
                }
                if (conMySQL != null)
                {
                    conMySQL.Close();
                    conMySQL.Dispose();
                    conMySQL = null;
                }
            }
        }
    }
}