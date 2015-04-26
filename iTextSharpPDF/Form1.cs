using System;
using System.Data;
using System.IO;
using System.Windows.Forms;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace iTextSharpPDF
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();     
        }

        private void btnExport_Click_Click(object sender, EventArgs e)
        {          
            String strSelectUserListBuilder = @"<html><body>
                                <h1>My First Heading</h1>
                                <p style='color:blue'>My first paragraph.</p>
                            </body>
                        </html>";

            String htmlText = strSelectUserListBuilder.ToString();

            Document document = new Document(PageSize.A4, 25, 25, 25, 25);

            PdfWriter.GetInstance(document, new FileStream(Path.GetTempPath() + "\\MySamplePDF.pdf", FileMode.Create));
            document.Open();

            iTextSharp.text.html.simpleparser.HTMLWorker hw = new iTextSharp.text.html.simpleparser.HTMLWorker(document);

            hw.Parse(new StringReader(htmlText));
            document.Close();
        }
    }
}