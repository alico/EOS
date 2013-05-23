using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;



namespace VotingMachine
{

    public partial class MainWindow : Window
    {
        
        public MainWindow()
        {
            InitializeComponent();
            var uc = new EnteranceUserControl(this);
            MainStackPanel.Children.Add(uc);
            //listenFingerPrintDevice();
            //
       
            //StackPanel panel = new StackPanel();
            //panel.Orientation= Orientation.Horizontal;
            //var candidates = new List<string>();
            //candidates.Add("1-Ali KIZILDAĞ");
            //candidates.Add("2-Ali KIZILDAĞ");
            //candidates.Add("10-Ali KIZILDAĞ");
            //candidates.Add("11-Ali KIZILDAĞ");
            //panel.Margin = new Thickness(10, 10, 0, 0);
            //for (int i = 1; i < 20; i++)
            //{
            //    var party = new PartyUserControl("1", "Milliyetçi Hareket Partisi", "http://nevsehirmhp.com/haber_resim/Parti_Logosu.jpg","MHP","Devlet BAHÇELİ",candidates);
            //    panel.Children.Add(party);
            //    var tab = new TextBlock();
            //    panel.Children.Add(tab);
            //    tab.Width = 5;
            //    if (i%8 == 0)
            //    {
            //        MainStackPanel.Children.Add(panel);
            //        panel = new StackPanel();
            //        panel.Orientation = Orientation.Horizontal;
            //        panel.Margin= new Thickness(10,20,0,0);
            //    }


            //}
        }

        private void StackPanelMouseDown(object sender, MouseButtonEventArgs e)
        {
        }

        private void cikisBorder_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MessageBoxResult result = System.Windows.MessageBox.Show("Çıkmak istediğinizden emin misiniz?", "Çıkış", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (result == MessageBoxResult.OK)
                this.Close();
        }
        private void Image_ImageFailed(object sender, ExceptionRoutedEventArgs e)
        {

        }

        public void changeStep(int stepId)
        {       
            MainStackPanel.Children.Clear();
            switch (stepId)
            {    
                case 1 :
                    {
                        Globals.CurrenttrackingCode = null;
                        var uc = new Step1UserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
                case 2:
                    {
                        var uc = new Step2UserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
                case 3:
                    {
                        var uc = new Step3UserControl(this);
                        MainStackPanel.Children.Add(uc);
                   
                        break;
                    }
                case 4:
                    {
                        Globals.CurrentParty = null;
                        Globals.CurrentVoter = null;
                        var uc = new Step4UserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
            }
        }

    }
}
