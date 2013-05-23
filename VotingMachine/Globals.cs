using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;


namespace VotingMachine
{
    class Globals
    {
        public static InternetService.Voter CurrentVoter { get; set; }

        public static Election CurrentElection { get; set; }

        public static PartyModel CurrentParty { get; set; }

        public static string CurrenttrackingCode { get; set; }

        public static string Password { get { return "123456"; } }

        public static bool IsElectionStarted { get; set; }

        public static string Hash(string data)
        {
            MD5CryptoServiceProvider alg = new MD5CryptoServiceProvider();
            byte[] byteValue = System.Text.Encoding.UTF8.GetBytes(data);
            byte[] hashingByte = alg.ComputeHash(byteValue);
            return Convert.ToBase64String(hashingByte);
        }

        public static string GetUnixTimeStamp()
        {
            TimeSpan span = (DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0).ToLocalTime());
            return span.TotalSeconds.ToString();
        }

        public static object GetService(string serviceType,string method)
        {
            try
            {
                var myBinding = new BasicHttpBinding();
                myBinding.MaxReceivedMessageSize = int.MaxValue;
                var endPointUrl = string.Empty;
                if (serviceType == "Merkez")
                {
                    endPointUrl = "http://192.168.1.222:5779/MerkezService/"+method;
                    var myEndpoint = new EndpointAddress(endPointUrl);
                    var myChannelFactory = new ChannelFactory<MerkezService.IMerkezService>(myBinding, myEndpoint);
                    MerkezService.IMerkezService client = null;
                    client = myChannelFactory.CreateChannel();
                    
                    return client;
                }
                else if (serviceType == "Internet")
                {
                    endPointUrl = "http://192.168.1.222:5778/InternetService/" + method;
                    var myEndpoint = new EndpointAddress(endPointUrl);
                    var myChannelFactory = new ChannelFactory<InternetService.IInternetService>(myBinding, myEndpoint);
                    InternetService.IInternetService client = null;
                    client = myChannelFactory.CreateChannel();
                    return client;
                }
            }

            catch (Exception)
            {
              
            }
            return null;
        }

        public static InternetService.VoterResponse GetVoter(string biometricId)
        {
            try
            {
                var service = GetService("Internet", "GetVoter") as InternetService.IInternetService;
                var timestamp = GetUnixTimeStamp();
                var hash = Hash(Password + timestamp);
                var result =service.GetVoter(biometricId,Globals.CurrentElection.ElectionId,timestamp, hash);
               
                return result;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }

    class Election
    {
        public int ElectionId;
        public string ElectionName;
        public DateTime StartDate;
        public DateTime EndDate;
    }


}
