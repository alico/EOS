namespace EOS.FingerPrintReader
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.axSBXPC1 = new AxSBXPCLib.AxSBXPC();
            ((System.ComponentModel.ISupportInitialize)(this.axSBXPC1)).BeginInit();
            this.SuspendLayout();
            // 
            // axSBXPC1
            // 
            this.axSBXPC1.Enabled = true;
            this.axSBXPC1.Location = new System.Drawing.Point(360, 322);
            this.axSBXPC1.Name = "axSBXPC1";
            this.axSBXPC1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axSBXPC1.OcxState")));
            this.axSBXPC1.Size = new System.Drawing.Size(100, 50);
            this.axSBXPC1.TabIndex = 0;
            this.axSBXPC1.Visible = false;
            // 
            // FingerPrintReader
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(389, 99);
            this.Controls.Add(this.axSBXPC1);
            this.Name = "FingerPrintReader";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.MainForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.axSBXPC1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private AxSBXPCLib.AxSBXPC axSBXPC1;
    }
}

