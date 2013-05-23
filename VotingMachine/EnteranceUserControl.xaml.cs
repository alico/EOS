using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Timers;
using VotingMachine.MerkezService;

namespace VotingMachine
{
    /// <summary>
    /// Interaction logic for EnteranceUserControl.xaml
    /// </summary>
    public partial class EnteranceUserControl : UserControl
    {
        private Timer m_timer;
        private MainWindow m_parentWindow;
        public EnteranceUserControl(MainWindow parentWindow)
        {
            InitializeComponent();
      
            m_parentWindow = parentWindow;
            m_timer = new Timer();
            m_timer.Enabled = true;
            m_timer.Interval = 3000;
            m_timer.Elapsed += new ElapsedEventHandler(timer_elapsed);
            m_timer.Start();
        }

        private void timer_elapsed(object o, EventArgs e)
        {
            m_timer.Stop();
            try
            {
                var service = Globals.GetService("Merkez", "GetActiveElection") as MerkezService.IMerkezService;
                var result = service.GetActiveElection();

                if (result != null)
                {
                    service = Globals.GetService("Merkez", "GetServerDate") as MerkezService.IMerkezService;
                    var serverDate = service.GetServerDate();

                    Globals.CurrentElection = new Election();
                    Globals.CurrentElection.ElectionId = result.ElectionId.Value;
                    Globals.CurrentElection.ElectionName = result.Name;
                    Globals.CurrentElection.EndDate = result.FinishDate.Value;
                    Globals.CurrentElection.StartDate = result.StartDate.Value;

                    prepareForm(result, serverDate);
                    if (result.StartDate.Value <= serverDate && result.FinishDate.Value > serverDate)
                    {
                        Globals.IsElectionStarted = true;
                        trigger.Dispatcher.BeginInvoke(new Action(delegate()
                                                                      {
                                                                          trigger.Text = " ";
                                                                      }));
                    }
                    else
                    {
                        m_timer.Start();
                        Globals.IsElectionStarted = false;
                    }
                }
                else
                {
                    m_timer.Start();
                    description.Dispatcher.BeginInvoke(new Action(delegate()
                    {
                        description.Text = "Gün içerisinde bir seçim bulunmamaktadır.";
                    }));
                }

            }
            catch (Exception)
            {

            }
        }

        private void prepareForm(VElectionDetail result,DateTime serverDate)
        {
            electionName.Dispatcher.BeginInvoke(new Action(delegate()
            {
                electionName.Text = "En Yakın Seçim: ";
                electionName.Text += result.Name;
            }));

            startDate.Dispatcher.BeginInvoke(new Action(delegate()
            {
                startDate.Text = "Başlangıç Zamanı: ";
                startDate.Text += result.StartDate.Value;
            }));

            endDate.Dispatcher.BeginInvoke(new Action(delegate()
            {
                endDate.Text = "Bitiş Zamanı: ";
                endDate.Text += result.FinishDate.Value;
            }));

            left.Dispatcher.BeginInvoke(new Action(delegate()
            {
                if (!Globals.IsElectionStarted)
                {
                    left.Text = "Kalan Zaman: ";
                    left.Text += Math.Ceiling((result.StartDate.Value - serverDate).TotalMinutes) + " Dakika";
                }
                else
                {
                    left.Text = "Seçim zaman aşımında. ";
                }
            }));
        }

        private void trigger_TextChanged(object sender, TextChangedEventArgs e)
        {
            m_parentWindow.changeStep(1);
        }
    }

}
