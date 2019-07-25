using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SdmSurvey.Class
{
    public class LogHelper
    {
        public readonly log4net.ILog loginfo = log4net.LogManager.GetLogger("loginfo");
        public readonly log4net.ILog logerror = log4net.LogManager.GetLogger("logerror");

        public void WriteLog(string info, string innerText)
        {
            if (loginfo.IsInfoEnabled)
            {
                loginfo.Info(info);
            }
        }

        public void WriteLog(string info, Exception se)
        {
            if (logerror.IsErrorEnabled)
            {
                logerror.Error(info, se);
            }
        }
    }
}

