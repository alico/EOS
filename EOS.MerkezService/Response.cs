using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EOS.MerkezService
{

    public class SetVoteResult
    {
        public Error Error { get; set; }
        public string AckCode { get; set; }
        public string TrackingCode { get; set; }
    }

    public class Error
    {
        public string ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
    }
}