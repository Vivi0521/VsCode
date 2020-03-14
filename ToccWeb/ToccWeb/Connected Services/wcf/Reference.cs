﻿//------------------------------------------------------------------------------
// <auto-generated>
//     這段程式碼是由工具產生的。
//     執行階段版本:4.0.30319.42000
//
//     對這個檔案所做的變更可能會造成錯誤的行為，而且如果重新產生程式碼，
//     變更將會遺失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace ToccWeb.wcf {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="wcf.IBusinessLogic")]
    public interface IBusinessLogic {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetDataSet", ReplyAction="http://tempuri.org/IBusinessLogic/GetDataSetResponse")]
        System.Data.DataSet GetDataSet(string FunctionCode, string var1, string var2, string var3, string var4, string var5);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/UpdateSummaryRequestNo", ReplyAction="http://tempuri.org/IBusinessLogic/UpdateSummaryRequestNoResponse")]
        string UpdateSummaryRequestNo(System.Data.DataSet ds);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetRequestNoBCST", ReplyAction="http://tempuri.org/IBusinessLogic/GetRequestNoBCSTResponse")]
        bool GetRequestNoBCST(string sRequestNo, int iLayer);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/XMLOutCom", ReplyAction="http://tempuri.org/IBusinessLogic/XMLOutComResponse")]
        System.Data.DataTable XMLOutCom(string rptStatus, string div, string rptGroup, string wkno, string sid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/RunSPQueryService", ReplyAction="http://tempuri.org/IBusinessLogic/RunSPQueryServiceResponse")]
        System.Data.DataTable RunSPQueryService(string system_code, string function_code, string begin_Time, string end_Time, string chart_no, string req_no, string ccode, string ord_state, string tech_id, int image_count, string study_uid, string exec_doc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetRobotSQLStr", ReplyAction="http://tempuri.org/IBusinessLogic/GetRobotSQLStrResponse")]
        System.Data.DataSet GetRobotSQLStr(string functionName, string Var1, string Var2, string Var3, string Var4, string Var5);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/PacsGetLISODOR", ReplyAction="http://tempuri.org/IBusinessLogic/PacsGetLISODORResponse")]
        System.Data.DataSet PacsGetLISODOR(string system_code, string function_code, System.DateTime begin_time, System.DateTime end_time, string Chart_no, string Req_no);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetExamReportDataByRequestNo", ReplyAction="http://tempuri.org/IBusinessLogic/GetExamReportDataByRequestNoResponse")]
        System.Data.DataSet GetExamReportDataByRequestNo(string requestNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetXRayReportByChartNo", ReplyAction="http://tempuri.org/IBusinessLogic/GetXRayReportByChartNoResponse")]
        System.Data.DataTable GetXRayReportByChartNo(string chartNo, string beginTime, string endTime);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetXRayUploadTimeByChartNo", ReplyAction="http://tempuri.org/IBusinessLogic/GetXRayUploadTimeByChartNoResponse")]
        System.Data.DataTable GetXRayUploadTimeByChartNo(string chartNo, string beginTime, string endTime);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetVitalSignsByChartNo", ReplyAction="http://tempuri.org/IBusinessLogic/GetVitalSignsByChartNoResponse")]
        System.Data.DataTable GetVitalSignsByChartNo(string chartNo, string beginTime, string endTime);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetCloudTravelHistoryByID", ReplyAction="http://tempuri.org/IBusinessLogic/GetCloudTravelHistoryByIDResponse")]
        System.Data.DataTable GetCloudTravelHistoryByID(string id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetPatientData", ReplyAction="http://tempuri.org/IBusinessLogic/GetPatientDataResponse")]
        System.Data.DataTable GetPatientData(string idNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/GetComeInHospitalReason", ReplyAction="http://tempuri.org/IBusinessLogic/GetComeInHospitalReasonResponse")]
        System.Data.DataTable GetComeInHospitalReason();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBusinessLogic/SaveComeInHospitalReasonAndTravelHistory", ReplyAction="http://tempuri.org/IBusinessLogic/SaveComeInHospitalReasonAndTravelHistoryRespons" +
            "e")]
        bool SaveComeInHospitalReasonAndTravelHistory(string idNo, string reason, string comment, string msg, string ip);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IBusinessLogicChannel : ToccWeb.wcf.IBusinessLogic, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class BusinessLogicClient : System.ServiceModel.ClientBase<ToccWeb.wcf.IBusinessLogic>, ToccWeb.wcf.IBusinessLogic {
        
        public BusinessLogicClient() {
        }
        
        public BusinessLogicClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public BusinessLogicClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public BusinessLogicClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public BusinessLogicClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet GetDataSet(string FunctionCode, string var1, string var2, string var3, string var4, string var5) {
            return base.Channel.GetDataSet(FunctionCode, var1, var2, var3, var4, var5);
        }
        
        public string UpdateSummaryRequestNo(System.Data.DataSet ds) {
            return base.Channel.UpdateSummaryRequestNo(ds);
        }
        
        public bool GetRequestNoBCST(string sRequestNo, int iLayer) {
            return base.Channel.GetRequestNoBCST(sRequestNo, iLayer);
        }
        
        public System.Data.DataTable XMLOutCom(string rptStatus, string div, string rptGroup, string wkno, string sid) {
            return base.Channel.XMLOutCom(rptStatus, div, rptGroup, wkno, sid);
        }
        
        public System.Data.DataTable RunSPQueryService(string system_code, string function_code, string begin_Time, string end_Time, string chart_no, string req_no, string ccode, string ord_state, string tech_id, int image_count, string study_uid, string exec_doc) {
            return base.Channel.RunSPQueryService(system_code, function_code, begin_Time, end_Time, chart_no, req_no, ccode, ord_state, tech_id, image_count, study_uid, exec_doc);
        }
        
        public System.Data.DataSet GetRobotSQLStr(string functionName, string Var1, string Var2, string Var3, string Var4, string Var5) {
            return base.Channel.GetRobotSQLStr(functionName, Var1, Var2, Var3, Var4, Var5);
        }
        
        public System.Data.DataSet PacsGetLISODOR(string system_code, string function_code, System.DateTime begin_time, System.DateTime end_time, string Chart_no, string Req_no) {
            return base.Channel.PacsGetLISODOR(system_code, function_code, begin_time, end_time, Chart_no, Req_no);
        }
        
        public System.Data.DataSet GetExamReportDataByRequestNo(string requestNo) {
            return base.Channel.GetExamReportDataByRequestNo(requestNo);
        }
        
        public System.Data.DataTable GetXRayReportByChartNo(string chartNo, string beginTime, string endTime) {
            return base.Channel.GetXRayReportByChartNo(chartNo, beginTime, endTime);
        }
        
        public System.Data.DataTable GetXRayUploadTimeByChartNo(string chartNo, string beginTime, string endTime) {
            return base.Channel.GetXRayUploadTimeByChartNo(chartNo, beginTime, endTime);
        }
        
        public System.Data.DataTable GetVitalSignsByChartNo(string chartNo, string beginTime, string endTime) {
            return base.Channel.GetVitalSignsByChartNo(chartNo, beginTime, endTime);
        }
        
        public System.Data.DataTable GetCloudTravelHistoryByID(string id) {
            return base.Channel.GetCloudTravelHistoryByID(id);
        }
        
        public System.Data.DataTable GetPatientData(string idNo) {
            return base.Channel.GetPatientData(idNo);
        }
        
        public System.Data.DataTable GetComeInHospitalReason() {
            return base.Channel.GetComeInHospitalReason();
        }
        
        public bool SaveComeInHospitalReasonAndTravelHistory(string idNo, string reason, string comment, string msg, string ip) {
            return base.Channel.SaveComeInHospitalReasonAndTravelHistory(idNo, reason, comment, msg, ip);
        }
    }
}
