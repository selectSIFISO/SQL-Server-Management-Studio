namespace iTextSharpPDF
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
            this.buttonTwainBib_Click = new System.Windows.Forms.Button();
            this.btnExport_Click = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // buttonTwainBib_Click
            // 
            this.buttonTwainBib_Click.Location = new System.Drawing.Point(12, 21);
            this.buttonTwainBib_Click.Name = "buttonTwainBib_Click";
            this.buttonTwainBib_Click.Size = new System.Drawing.Size(123, 102);
            this.buttonTwainBib_Click.TabIndex = 0;
            this.buttonTwainBib_Click.Text = "TwainBib";
            this.buttonTwainBib_Click.UseVisualStyleBackColor = true;
            this.buttonTwainBib_Click.Click += new System.EventHandler(this.buttonTwainBib_Click_Click);
            // 
            // btnExport_Click
            // 
            this.btnExport_Click.Location = new System.Drawing.Point(151, 21);
            this.btnExport_Click.Name = "btnExport_Click";
            this.btnExport_Click.Size = new System.Drawing.Size(143, 102);
            this.btnExport_Click.TabIndex = 1;
            this.btnExport_Click.Text = "Export";
            this.btnExport_Click.UseVisualStyleBackColor = true;
            this.btnExport_Click.Click += new System.EventHandler(this.btnExport_Click_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(321, 144);
            this.Controls.Add(this.btnExport_Click);
            this.Controls.Add(this.buttonTwainBib_Click);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonTwainBib_Click;
        private System.Windows.Forms.Button btnExport_Click;
    }
}

