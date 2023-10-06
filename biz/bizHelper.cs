using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T2LHomePage
{
    public class bizHelper:BizBase
    {
        public bizHelper()
        {
            this.baseConnectDB();
        }

        public bizHelper(string conStr)
        {
            this.baseConnectDB(conStr);
        }

        // 조회 호출 PROC
        // hashTable SP_NAME 필수.
        public DataSet operationSP(Hashtable hs)
        {
            return basePackageSPAutoBindingAndCall(hs, hs["SP_NAME"].ToString());
        }

        // 트랜잭션 저장, 삭제 호출
        // 호출전 후에 baseTrans, ...baseCommit 처리할 것!
        // baseTrans / baseCommit / Dipose() 필수..
        public DataSet operationSPTr(Hashtable hs)
        {
            return basePackageSPAutoBindingAndCall(hs, hs["SP_NAME"].ToString(), baseDao);
        }

        public DataSet operationSPTr(Hashtable ht, string packageFullName)
        {
            Hashtable bindingHash = basePackageSPAutoBinding(ht, packageFullName, baseDao);
            return baseCallPackageSP(bindingHash, packageFullName, baseDao);
        }
        //단순 쿼리 실행
        //
        //baseSQLDataset(string SQL) return : DataSet;
        //
        //

        //mssql 추가작업
        // MS-SQL
        //신규작업 후 t2l꺼에 맞게 수정 처리

        public void DisConnect()
        {
            this.Dispose();
        }

        public DataSet excuteDataSet(string sql)
        {
            return this.excuteDataSetMs(sql);
        }

        public DataSet excuteDataSetProcedure(Hashtable hs)
        {
            return this.excuteDataSetProcedureBase(hs);
        }
    }
}