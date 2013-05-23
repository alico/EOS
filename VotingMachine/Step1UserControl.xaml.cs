using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Threading;
using System.Net.Sockets;
using System.Diagnostics;
using VotingMachine.MerkezService;

namespace VotingMachine
{
    /// <summary>
    /// Interaction logic for Step1UserControl.xaml
    /// </summary>
    public partial class Step1UserControl : UserControl
    {
        private MainWindow m_mainWindow;
        private System.Timers.Timer m_Timer;
        public Step1UserControl(MainWindow window)
        {
            InitializeComponent();
            m_Timer = new System.Timers.Timer();
            m_mainWindow = window;
            startApplication();
            prepareForm();
           

        }

        private void listenFingerPrintDevice()
        {
            var listener = new TcpListener(8500);
            listener.Start();
            var data = string.Empty;
            byte[] rcvBuffer = new byte[1024];
            int bytesRcvd;

            while (true)
            {
                TcpClient client = null;
                NetworkStream netStream = null;
                try
                {
                    client = listener.AcceptTcpClient();
                    netStream = client.GetStream();

                    int totalBytesEchoed = 0;
                    while ((bytesRcvd = netStream.Read(rcvBuffer, 0, rcvBuffer.Length)) > 0)
                    {
                        totalBytesEchoed += bytesRcvd;
                    }
                    data = Encoding.ASCII.GetString(rcvBuffer, 0, totalBytesEchoed);
                    var result = Globals.GetVoter(data);
                    if (result.Error != null)
                    {
                        var error = result.Error;
                        if (error.ErrorCode == "1")
                        {
                            var preMessage = string.Empty;
                            message.Dispatcher.BeginInvoke(new Action(delegate()
                            {
                                preMessage = message.Text;
                                message.Text = "Bir seçimde yalnızca bir oy kullanabilirsiniz!";
                            }));

                            Thread.Sleep(3000);
                            message.Dispatcher.BeginInvoke(new Action(delegate()
                            {
                                message.Text = preMessage;
                            }));
                        }
                        else if (error.ErrorCode == "2")
                        {
                            var preMessage = string.Empty;
                            message.Dispatcher.BeginInvoke(new Action(delegate()
                            {
                                preMessage = message.Text;
                                message.Text = "Bu parmak izi hiçbir seçmen ile eşleştirilemedi!";
                            }));

                            Thread.Sleep(3000);
                            message.Dispatcher.BeginInvoke(new Action(delegate()
                            {
                                message.Text = preMessage;
                            }));
                        }
                        else
                        {
                            var preMessage = string.Empty;
                            message.Dispatcher.BeginInvoke(new Action(delegate()
                            {
                                preMessage = message.Text;
                                message.Text = "Sunucu ile bağlantı hatası!";
                            }));

                            Thread.Sleep(3000);
                            message.Dispatcher.BeginInvoke(new Action(delegate()
                            {
                                message.Text = preMessage;
                            }));
                        }
                    }
                    else
                    {
                        if (result.Data != null)
                        {
                            var voter = result.Data;
                            if (voter.VoterStatus.Value)
                            {
                                Globals.CurrentVoter = voter;
                                message.Dispatcher.BeginInvoke(new Action(delegate()
                                {
                                    message.Text = "Hoş Geldiniz " + voter.Name +" "+voter.Surname + "!";
                                }));

                                netStream.Close();
                                client.Close();
                                listener.Stop();
                                Thread.Sleep(3000);
                                trigger.Dispatcher.BeginInvoke(new Action(delegate()
                                {
                                    trigger.Text = " ";
                                }));
                            }
                            else 
                            {
                                var preMessage = string.Empty;
                                message.Dispatcher.BeginInvoke(new Action(delegate()
                                {
                                    preMessage = message.Text;
                                    message.Text = "Seçmen pasifleştirilmiştir!";
                                }));

                                Thread.Sleep(3000);
                                message.Dispatcher.BeginInvoke(new Action(delegate()
                                {
                                    message.Text = preMessage;
                                })); 
                            }
                        }
                       
                    }
                   
                }
                catch (Exception e)
                {

                }

            }
        }

        private void startFingerPrintService()
        {
            stopFingerPrintService();
            Process.Start(@"C:\Users\Alico\Documents\visual studio 2010\Projects\EOS\EOS.FingerPrintReader\bin\Debug\EOS.FingerPrintReader.exe");
        }

        private void stopFingerPrintService()
        {
            var processList = Process.GetProcesses().ToList();
            processList.ToList();
            if (processList.Any(x => x.ProcessName == ("EOS.FingerPrintReader")))
            {
                var process = processList.Where(x => x.ProcessName == ("EOS.FingerPrintReader")).ToList();
                foreach (var p in process)
                {
                    p.Kill();
                }
            }
        }

        private void startApplication()
        {
            startFingerPrintService();
            var listenerThread = new Thread(new ThreadStart(listenFingerPrintDevice));
            listenerThread.Start();
            listenerThread.IsBackground = true;
        }

        private void trigger_TextChanged(object sender, TextChangedEventArgs e)
        {
            stopFingerPrintService();
            m_Timer.Stop();
            m_mainWindow.changeStep(2);
        }

        private void prepareForm()
        {
            electionName.Text += Globals.CurrentElection.ElectionName;
            startDate.Text += Globals.CurrentElection.StartDate;
            finishDate.Text += Globals.CurrentElection.EndDate;
            m_Timer.Interval = 5000;
            m_Timer.Elapsed += new ElapsedEventHandler(timer_elapsed);
            m_Timer.Start();

        }

        private void timer_elapsed(object o, ElapsedEventArgs e)
        {
            m_Timer.Stop();
            var service = Globals.GetService("Merkez", "GetServerDate") as IMerkezService;
            var serverDate = service.GetServerDate();
            var time = Math.Ceiling((Globals.CurrentElection.EndDate - serverDate).TotalMinutes);
            if (time <= 0)
            {
                Globals.IsElectionStarted = false;
            }
            timeLeft.Dispatcher.BeginInvoke(new Action(delegate()
            {
                timeLeft.Text = "Kalan Zaman: ";
                timeLeft.Text += time+ " Dakika";
            }));
            m_Timer.Start();
        }
    }
}


