using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.Configuration;
using System.ServiceProcess;

namespace EOS.ServiceHost
{
    class Program
    {
        static void Main(string[] args)
        {
            System.ServiceModel.ServiceHost internetServiceHost = new System.ServiceModel.ServiceHost(typeof(EOS.InternetService.InternetService));
            internetServiceHost.Open();

            System.ServiceModel.ServiceHost merkezServiceHost = new System.ServiceModel.ServiceHost(typeof(EOS.MerkezService.MerkezService));
            merkezServiceHost.Open();

            System.ServiceModel.ServiceHost NufusMudurluguServiceHost = new System.ServiceModel.ServiceHost(typeof(TCNufusMudurlugu.srvPopulation));
            NufusMudurluguServiceHost.Open();
            Console.ReadLine();
        }
    }

    //class Program : ServiceBase
    //{
    //    public Program()
    //    {
    //        this.ServiceName = "EOS.ServiceHost";
    //    }
    //    static void Main(string[] args)
    //    {
    //        System.ServiceProcess.ServiceBase.Run(new Program()); 
    //    }

    //    protected override void OnStart(string[] args)
    //    {
    //        try
    //        {
    //            System.ServiceModel.ServiceHost internetServiceHost = new System.ServiceModel.ServiceHost(typeof(EOS.InternetService.InternetService));
    //            internetServiceHost.Open();

    //            System.ServiceModel.ServiceHost merkezServiceHost = new System.ServiceModel.ServiceHost(typeof(EOS.MerkezService.MerkezService));
    //            merkezServiceHost.Open();

    //            System.ServiceModel.ServiceHost NufusMudurluguServiceHost = new System.ServiceModel.ServiceHost(typeof(TCNufusMudurlugu.srvPopulation));
    //            NufusMudurluguServiceHost.Open();
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
          
    //    }

    //    protected override void OnStop()
    //    {
    //    }

    //}
}
