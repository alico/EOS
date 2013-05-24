using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.ServiceModel;
using System.Text;
using System.Windows.Forms;
using AxSBXPCLib;
using System.Threading;
using WindowsFormsApplication1.srvPopulation;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            clearLog();
        }

        private void getBiometricId()
        {
            axSBXPC1.DotNET();
            var ip = "192.168.1.224";
            var password = 12345678;
            var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);

            while (true)
            {
                Thread.Sleep(3000);
                //var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);
                var generalData = axSBXPC1.ReadGeneralLogData(1);

                int dwTMachineNumber = 0;
                int dwEnrollNumber = 0;
                int dwEMachineNumber = 0;
                int dwVerifyMode = 0;
                int dwYear = 0;
                int dwMonth = 0;
                int dwDay = 0;
                int dwHour = 0;
                int dwMinute = 0;
                int dwSecond = 0;

                var general = axSBXPC1.GetGeneralLogData(1,
                                                         ref dwTMachineNumber,
                                                         ref dwEnrollNumber,
                                                         ref dwEMachineNumber,
                                                         ref dwVerifyMode,
                                                         ref dwYear,
                                                         ref dwMonth,
                                                         ref dwDay,
                                                         ref dwHour,
                                                         ref dwMinute,
                                                         ref dwSecond);
                if (general)
                {
                    textBox2.Text = dwEnrollNumber.ToString();
                    button2.Enabled = true;
                    axSBXPC1.Disconnect();
                    break;
                }
                //general.ToString();
                //generalData.ToString();

            }
        }
        private void clearLog()
        {
            axSBXPC1.DotNET();
            var ip = "192.168.1.224";
            var password = 12345678;
            var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);


            var generalData = axSBXPC1.ReadGeneralLogData(1);

            int dwTMachineNumber = 0;
            int dwEnrollNumber = 0;
            int dwEMachineNumber = 0;
            int dwVerifyMode = 0;
            int dwYear = 0;
            int dwMonth = 0;
            int dwDay = 0;
            int dwHour = 0;
            int dwMinute = 0;
            int dwSecond = 0;

            var general = axSBXPC1.GetGeneralLogData(1,
                                                     ref dwTMachineNumber,
                                                     ref dwEnrollNumber,
                                                     ref dwEMachineNumber,
                                                     ref dwVerifyMode,
                                                     ref dwYear,
                                                     ref dwMonth,
                                                     ref dwDay,
                                                     ref dwHour,
                                                     ref dwMinute,
                                                     ref dwSecond);
            if (general)
            {
                axSBXPC1.Disconnect();
            }
        }

        public string sendData(string identityNo, string Id)
        {
            try
            {

                var myBinding = new BasicHttpBinding();
                var myEndpoint = new EndpointAddress("http://192.168.1.222:5778/InternetService/SetFingerPrint");
                var myChannelFactory = new ChannelFactory<IInternetService>(myBinding, myEndpoint);

                IInternetService client = null;

                client = myChannelFactory.CreateChannel();
                var result = client.SetFingerPrint(identityNo, Id, "123456");
                ((ICommunicationObject)client).Close();
                return result; 
            }

            catch (Exception e)
            {
                return "ERROR!";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            clearLog();
            button1.Enabled = false;
            getBiometricId();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string result = sendData(textBox1.Text, textBox2.Text);
            messageBox.Text = result;
            button2.Enabled = false;
            button1.Enabled = true;
            textBox1.Text = string.Empty;
            textBox2.Text = string.Empty;
        }


    }
}
