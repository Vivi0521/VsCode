using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SdmSurvey.Class
{
    public class Question
    {
        public string QuestID { get; set; }
        public string QuestName { get; set; }
        public string ModifiedTime { get; set; }
        public string ModifiedUser { get; set; }
        public string CreaterUser { get; set; }
        public string CreateTime { get; set; }
        public string Dc { get; set; }
        public int OpenCount { get; set; }
        public int WriteCount { get; set; }
        public string EffectDate { get; set; }
        public string Status { get; set; }

    }
}