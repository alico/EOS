using System;
using System.Collections.Generic;
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

namespace VotingMachine
{
    /// <summary>
    /// Interaction logic for Step4UserControl.xaml
    /// </summary>
    public partial class Step4UserControl : UserControl
    {
        private MainWindow m_mainWindow;
        private Timer m_timer;
        private int timeCounter;
        public Step4UserControl(MainWindow mainWindow)
        {
            InitializeComponent();
            m_mainWindow = mainWindow;
            m_timer = new Timer();
            m_timer.Enabled = true;
            m_timer.Interval = 1000;
            timeCounter = 10;
            m_timer.Elapsed += new ElapsedEventHandler(timerElapsed);
            prepareForm();
        }

        private void prepareForm()
        {
            if (!string.IsNullOrEmpty(Globals.CurrenttrackingCode))
            {
                resultImage.Source = new BitmapImage(new Uri(@"\Images\Green_tick.png", UriKind.Relative));
                resultText.Text = "Oy verme işleminiz başarı ile gerçekleştirilmiştir!";
                trackingCodeText.Text = "Onay Kodu: " + Globals.CurrenttrackingCode;
                description.Text = "Seçim işlemi sonrasında internet sitemizden bu onay kodu ile oyunuzun sayılıp sayılmadığını teyit edebilirsiniz.";
                m_timer.Start();
            }
        }

        private void timerElapsed(object o, ElapsedEventArgs e)
        {
            if (timeCounter <= 0)
            {
                m_timer.Stop();
                trigger.Dispatcher.BeginInvoke(new Action(delegate()
                {
                    trigger.Text = " ";
                }));
            }
            else
            {
                closingTime.Dispatcher.BeginInvoke(new Action(delegate()
                    {
                        closingTime.Text = "Bu ekran " + timeCounter + " saniye sonra kapanacaktır";
                    }));
                timeCounter--;
            }


        }

        private void trigger_TextChanged(object sender, TextChangedEventArgs e)
        {
            m_mainWindow.changeStep(1);
        }
    }
}
