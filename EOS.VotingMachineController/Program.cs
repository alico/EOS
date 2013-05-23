using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Threading;
using EOS.VotingMachineController.MerkezService;
using System.ServiceModel;

namespace EOS.VotingMachineController
{
    class Program
    {
        private static bool isElectionStart = false; 
        static void Main(string[] args)
        {
            TimerCallback callback = new TimerCallback(RequestService);

            Timer stateTimer = new Timer(callback, null, 0, 3000);
            for (; ; ) { }           
        }
        private static void RequestService(Object state)
        {
            int result = 0;
            var myBinding = new BasicHttpBinding();
            var myEndpoint = new EndpointAddress("http://localhost:9462/Service1.svc");
            var myChannelFactory = new ChannelFactory<IService1>(myBinding, myEndpoint);

            IService1 client = null;

            try
            {
                client = myChannelFactory.CreateChannel();
                result =  client.GetLastElectionStatus();
                
                ((ICommunicationObject)client).Close();
            }
            catch (Exception ex)
            { }

            string votingMachinePath = @"C:\Sites\EOS\VotingMachine\bin\Debug\VotingMachine.exe";
            string fingerPrintReaderPath = @"C:\Sites\EOS\EOS.FingerPrintReader\bin\Debug\EOS.FingerPrintReader.exe";
            Process votingMachine = new Process();
            Process fingerPrintReader = new Process();
            if (result == 5)
            {
                if (!isElectionStart)
                {

                    votingMachine.StartInfo.FileName = votingMachinePath;
                    fingerPrintReader.StartInfo.FileName = fingerPrintReaderPath;

                    votingMachine.Start();
                    fingerPrintReader.Start();
                }
                isElectionStart = true;
            } 
            if (result == 6)
            {
                if (isElectionStart)
                {
                    votingMachine.Close();
                    fingerPrintReader.Close();
                }
                isElectionStart = false;
            }
        }
    }
}

