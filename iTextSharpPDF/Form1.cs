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

        private static iTextSharp.text.pdf.PdfPCell GetCellForBorderedTable(Phrase phrase, int align, BaseColor color)
        {
            iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(phrase);
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            cell.BackgroundColor = color;
            cell.VerticalAlignment = iTextSharp.text.pdf.PdfPCell.ALIGN_CENTER;
            return cell;
        }

        private void buttonTwainBib_Click_Click(object sender, EventArgs e)
        {
            Font times16BoldCyan = FontFactory.GetFont(FontFactory.TIMES_BOLD, 16, BaseColor.BLUE);
            Font courier11BoldYellow = FontFactory.GetFont(FontFactory.COURIER_BOLD, 11, BaseColor.YELLOW);
            Font helvetica9 = FontFactory.GetFont(FontFactory.HELVETICA, 9, BaseColor.BLACK);
            Font LinkFont = FontFactory.GetFont(FontFactory.HELVETICA, 9, iTextSharp.text.Font.UNDERLINE, BaseColor.BLUE);
            try
            {
                using (var ms = new MemoryStream())
                {
                    using (var doc = new Document(PageSize.A4, 25, 25, 25, 25))
                    {
                        //Create a writer that's bound to our PDF abstraction and our stream
                        using (var writer = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, ms))
                        {
                            //Open the document for writing
                            doc.Open();

                            // The "guts" of the code will go here
                            Paragraph twainBibText = new Paragraph("Mark Twain - Concise Book Bibliography", times16BoldCyan);
                            doc.Add(twainBibText);

                            Chunk chunkTwainCentral = new Chunk("Read selected Twain works online - annotated, with color-coded dialog, ", helvetica9);
                            Anchor anchorTwainCentral = new Anchor("hyar", LinkFont);
                            anchorTwainCentral.Reference = "http://twaincentral.azurewebsites.net/";
                            Paragraph parTwainCentral = new Paragraph();
                            parTwainCentral.Add(chunkTwainCentral);
                            parTwainCentral.Add(anchorTwainCentral);
                            doc.Add(parTwainCentral);

                            Chunk chunkTwainRes = new Chunk("Download a free novel about Samuel Clemens (Mark Twain) ", helvetica9);
                            Anchor anchorTwainRes = new Anchor("rot cheer", LinkFont);
                            anchorTwainRes.Reference = "http://www.lulu.com/shop/blackbird-crow-raven/the-resurrection-of-samuel-clemens/ebook/product-17541930.html";
                            Paragraph parTwainRes = new Paragraph();
                            parTwainRes.Add(chunkTwainRes);
                            parTwainRes.Add(anchorTwainRes);
                            doc.Add(parTwainRes);

                            // Table for headings
                            iTextSharp.text.pdf.PdfPTable tblHeadings = new iTextSharp.text.pdf.PdfPTable(3);
                            tblHeadings.WidthPercentage = 80;
                            tblHeadings.SpacingBefore = 10f;
                            float[] headingRowWidths = new float[] { 300f, 100f, 600f };
                            tblHeadings.SetWidths(headingRowWidths);
                            tblHeadings.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phraseYear = new Phrase("Year of Publication", courier11BoldYellow);
                            iTextSharp.text.pdf.PdfPCell cellYear = GetCellForBorderedTable(phraseYear, Element.ALIGN_CENTER, BaseColor.BLUE);
                            tblHeadings.AddCell(cellYear);

                            Phrase phraseblankHeading = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellBlankSectionHeading = new iTextSharp.text.pdf.PdfPCell(phraseblankHeading);
                            cellBlankSectionHeading.BorderWidth = 0;
                            tblHeadings.AddCell(cellBlankSectionHeading);

                            Phrase phraseTitle = new Phrase("Title", courier11BoldYellow);
                            iTextSharp.text.pdf.PdfPCell cellTitle = GetCellForBorderedTable(phraseTitle, Element.ALIGN_CENTER, BaseColor.BLUE);
                            tblHeadings.AddCell(cellTitle);
                            doc.Add(tblHeadings);

                            // Contents
                            // Innocents Abroad
                            iTextSharp.text.pdf.PdfPTable tblIARow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblIARow.WidthPercentage = 80;
                            tblIARow.SpacingBefore = 4f;
                            float[] IARowWidths = new float[] { 300f, 100f, 600f };
                            tblIARow.SetWidths(IARowWidths);
                            tblIARow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1869 = new Phrase("1869", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1869 = GetCellForBorderedTable(phrase1869, Element.ALIGN_CENTER, BaseColor.GREEN);
                            tblIARow.AddCell(cell1869);

                            // Blank cell
                            Phrase phraseblankIARow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellBlankIARow = new iTextSharp.text.pdf.PdfPCell(phraseblankIARow);
                            cellBlankIARow.BorderWidth = 0;
                            tblIARow.AddCell(cellBlankIARow);

                            Anchor anchorIA = new Anchor("The Innocents Abroad, or The New Pilgrim's Progress", LinkFont);
                            anchorIA.Reference = "http://www.amazon.com/exec/obidos/ASIN/1619492350/garrphotgall-20";
                            Paragraph parIA = new Paragraph();
                            parIA.Add(anchorIA);
                            tblIARow.AddCell(parIA);

                            doc.Add(tblIARow);

                            // Roughing It
                            iTextSharp.text.pdf.PdfPTable tblRIRow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblRIRow.WidthPercentage = 80;
                            tblRIRow.SpacingBefore = 4f;
                            float[] RIRowWidths = new float[] { 300f, 100f, 600f };
                            tblRIRow.SetWidths(RIRowWidths);
                            tblRIRow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1872 = new Phrase("1872", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1872 = GetCellForBorderedTable(phrase1872, Element.ALIGN_CENTER, BaseColor.GREEN);
                            tblRIRow.AddCell(cell1872);

                            // Blank cell
                            Phrase phraseblankRIRow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellBlankRIRow = new iTextSharp.text.pdf.PdfPCell(phraseblankRIRow);
                            cellBlankRIRow.BorderWidth = 0;
                            tblRIRow.AddCell(cellBlankRIRow);

                            Anchor anchorRI = new Anchor("Roughing It", LinkFont);
                            anchorRI.Reference = "http://www.amazon.com/exec/obidos/ASIN/0451531108/garrphotgall-20";
                            Paragraph parRI = new Paragraph();
                            parRI.Add(anchorRI);
                            tblRIRow.AddCell(parRI);

                            doc.Add(tblRIRow);

                            // The Adventures of Tom Sawyer
                            iTextSharp.text.pdf.PdfPTable tblTSRow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblTSRow.WidthPercentage = 80;
                            tblTSRow.SpacingBefore = 4f;
                            float[] TSRowWidths = new float[] { 300f, 100f, 600f };
                            tblTSRow.SetWidths(TSRowWidths);
                            tblTSRow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1876 = new Phrase("1876", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1876 = GetCellForBorderedTable(phrase1876, Element.ALIGN_CENTER, BaseColor.YELLOW);
                            tblTSRow.AddCell(cell1876);

                            // Blank cell
                            Phrase phraseblankTSRow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellblankTSRow = new iTextSharp.text.pdf.PdfPCell(phraseblankTSRow);
                            cellblankTSRow.BorderWidth = 0;
                            tblTSRow.AddCell(cellblankTSRow);

                            Anchor anchorTS = new Anchor("The Adventures of Tom Sawyer", LinkFont);
                            anchorTS.Reference = "http://www.amazon.com/exec/obidos/ASIN/0486400778/garrphotgall-20";
                            Paragraph parTS = new Paragraph();
                            parTS.Add(anchorTS);
                            tblTSRow.AddCell(parTS);

                            doc.Add(tblTSRow);

                            // Tramp Abroad
                            iTextSharp.text.pdf.PdfPTable tblTARow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblTARow.WidthPercentage = 80;
                            tblTARow.SpacingBefore = 4f;
                            float[] TARowWidths = new float[] { 300f, 100f, 600f };
                            tblTARow.SetWidths(TARowWidths);
                            tblTARow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1880 = new Phrase("1880", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1880 = GetCellForBorderedTable(phrase1880, Element.ALIGN_CENTER, BaseColor.GREEN);
                            tblTARow.AddCell(cell1880);

                            // Blank cell
                            Phrase phraseblankTARow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellBlankTARow = new iTextSharp.text.pdf.PdfPCell(phraseblankTARow);
                            cellBlankTARow.BorderWidth = 0;
                            tblTARow.AddCell(cellBlankTARow);

                            Anchor anchorTA = new Anchor("A Tramp Abroad", LinkFont);
                            anchorTA.Reference = "http://www.amazon.com/A-Tramp-Abroad-Mark-Twain/dp/1496085213/garrphotgall-20";
                            Paragraph parTA = new Paragraph();
                            parTA.Add(anchorTA);
                            tblTARow.AddCell(parTA);

                            doc.Add(tblTARow);

                            // The Prince and the Pauper
                            iTextSharp.text.pdf.PdfPTable tblPAPRow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblPAPRow.WidthPercentage = 80;
                            tblPAPRow.SpacingBefore = 4f;
                            float[] PaPRowWidths = new float[] { 300f, 100f, 600f };
                            tblPAPRow.SetWidths(PaPRowWidths);
                            tblPAPRow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1881 = new Phrase("1881", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1881 = GetCellForBorderedTable(phrase1881, Element.ALIGN_CENTER, BaseColor.YELLOW);
                            tblPAPRow.AddCell(cell1881);

                            // Blank cell
                            Phrase phraseblankPapRow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellblankPapRow = new iTextSharp.text.pdf.PdfPCell(phraseblankPapRow);
                            cellblankPapRow.BorderWidth = 0;
                            tblPAPRow.AddCell(cellblankPapRow);

                            Anchor anchorPap = new Anchor("The Prince and the Pauper", LinkFont);
                            anchorPap.Reference = "http://www.amazon.com/exec/obidos/ASIN/0486411109/garrphotgall-20";
                            Paragraph parPap = new Paragraph();
                            parPap.Add(anchorPap);
                            tblPAPRow.AddCell(parPap);

                            doc.Add(tblPAPRow);

                            // Life on the Mississippi
                            iTextSharp.text.pdf.PdfPTable tblLotMRow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblLotMRow.WidthPercentage = 80;
                            tblLotMRow.SpacingBefore = 4f;
                            float[] LotMRowWidths = new float[] { 300f, 100f, 600f };
                            tblLotMRow.SetWidths(LotMRowWidths);
                            tblLotMRow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1883 = new Phrase("1883", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1883 = GetCellForBorderedTable(phrase1883, Element.ALIGN_CENTER, BaseColor.GREEN);
                            tblLotMRow.AddCell(cell1883);

                            // Blank cell
                            Phrase phraseblankLotMRow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellBlankLotMRow = new iTextSharp.text.pdf.PdfPCell(phraseblankLotMRow);
                            cellBlankLotMRow.BorderWidth = 0;
                            tblLotMRow.AddCell(cellBlankLotMRow);

                            Anchor anchorLotM = new Anchor("Life on the Mississippi", LinkFont);
                            anchorLotM.Reference = "http://www.amazon.com/exec/obidos/ASIN/0486414264/garrphotgall-20";
                            Paragraph parLotM = new Paragraph();
                            parLotM.Add(anchorLotM);
                            tblLotMRow.AddCell(parLotM);

                            doc.Add(tblLotMRow);

                            // The Adventures of Hucklberry Finn
                            iTextSharp.text.pdf.PdfPTable tblHFRow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblHFRow.WidthPercentage = 80;
                            tblHFRow.SpacingBefore = 4f;
                            float[] HFRowWidths = new float[] { 300f, 100f, 600f };
                            tblHFRow.SetWidths(HFRowWidths);
                            tblHFRow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1884 = new Phrase("1884", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1884 = GetCellForBorderedTable(phrase1884, Element.ALIGN_CENTER, BaseColor.YELLOW);
                            tblHFRow.AddCell(cell1884);

                            // Blank cell
                            Phrase phraseblankHFRow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellblankHFRow = new iTextSharp.text.pdf.PdfPCell(phraseblankHFRow);
                            cellblankHFRow.BorderWidth = 0;
                            tblHFRow.AddCell(cellblankHFRow);

                            Anchor anchorHF = new Anchor("The Adventures of Huckleberry Finn", LinkFont);
                            anchorHF.Reference = "http://www.amazon.com/exec/obidos/ASIN/1456405721/garrphotgall-20";
                            Paragraph parHF = new Paragraph();
                            parHF.Add(anchorHF);
                            tblHFRow.AddCell(parHF);

                            doc.Add(tblHFRow);

                            // Connecticut Yankee
                            iTextSharp.text.pdf.PdfPTable tblCYRow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblCYRow.WidthPercentage = 80;
                            tblCYRow.SpacingBefore = 4f;
                            float[] CYRowWidths = new float[] { 300f, 100f, 600f };
                            tblCYRow.SetWidths(CYRowWidths);
                            tblCYRow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1889 = new Phrase("1889", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1889 = GetCellForBorderedTable(phrase1889, Element.ALIGN_CENTER, BaseColor.YELLOW);
                            tblCYRow.AddCell(cell1889);

                            // Blank cell
                            Phrase phraseblankCYRow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellblankCYRow = new iTextSharp.text.pdf.PdfPCell(phraseblankCYRow);
                            cellblankCYRow.BorderWidth = 0;
                            tblCYRow.AddCell(cellblankCYRow);

                            Anchor anchorCY = new Anchor("A Connecticut Yankee in King Arthur's Court", LinkFont);
                            anchorCY.Reference = "http://www.amazon.com/exec/obidos/ASIN/0486415910/garrphotgall-20";
                            Paragraph parCY = new Paragraph();
                            parCY.Add(anchorCY);
                            tblCYRow.AddCell(parCY);

                            doc.Add(tblCYRow);

                            // Following the Equator
                            iTextSharp.text.pdf.PdfPTable tblFtERow = new iTextSharp.text.pdf.PdfPTable(3);
                            tblFtERow.WidthPercentage = 80;
                            tblFtERow.SpacingBefore = 4f;
                            float[] FtERowWidths = new float[] { 300f, 100f, 600f };
                            tblFtERow.SetWidths(FtERowWidths);
                            tblFtERow.HorizontalAlignment = Element.ALIGN_LEFT;

                            Phrase phrase1897 = new Phrase("1897", helvetica9);
                            iTextSharp.text.pdf.PdfPCell cell1897 = GetCellForBorderedTable(phrase1897, Element.ALIGN_CENTER, BaseColor.GREEN);
                            tblFtERow.AddCell(cell1897);

                            // Blank cell
                            Phrase phraseblankFtERow = new Phrase();
                            iTextSharp.text.pdf.PdfPCell cellBlankFtERow = new iTextSharp.text.pdf.PdfPCell(phraseblankFtERow);
                            cellBlankFtERow.BorderWidth = 0;
                            tblFtERow.AddCell(cellBlankFtERow);

                            Anchor anchorFtE = new Anchor("Following the Equator", LinkFont);
                            anchorFtE.Reference = "http://www.amazon.com/exec/obidos/ASIN/1619492369/garrphotgall-20";
                            Paragraph parFtE = new Paragraph();
                            parFtE.Add(anchorFtE);
                            tblFtERow.AddCell(parFtE);

                            doc.Add(tblFtERow);

                            doc.Close();
                        }
                        var bytes = ms.ToArray();
                        String PDFFileName = String.Format("AlwaysTheTwainShallMeet_{0}.pdf", DateTime.Now.ToShortTimeString());
                        PDFFileName = PDFFileName.Replace(":", "_");
                        var testFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), PDFFileName);
                        File.WriteAllBytes(testFile, bytes);
                        MessageBox.Show(String.Format("{0} written", PDFFileName));
                    }
                }
            }
            catch (DocumentException dex)
            {
                MessageBox.Show(String.Format("DocumentException: {0}", dex.Message));
                throw (dex);
            }
            catch (IOException ioex) // this may be reached if you try to generate a new file in the same minute as the last one created (just try it again if that happens, or change the name of the file to include seconds also)
            {
                MessageBox.Show(String.Format("IOException: {0}", ioex.Message));
                throw (ioex);
            }
            catch (Exception ex)
            {
                String exMsg = ex.Message;
                MessageBox.Show(String.Format("General Exception: {0}", ex.Message));
            }
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

            PdfWriter.GetInstance(document, new FileStream(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\MySamplePDF.pdf", FileMode.Create));
            document.Open();

            iTextSharp.text.html.simpleparser.HTMLWorker hw = new iTextSharp.text.html.simpleparser.HTMLWorker(document);

            hw.Parse(new StringReader(htmlText));
            document.Close();

            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //pnlPerson.RenderControl(hw);
            //StringReader sr = new StringReader(sw.ToString());
            //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //pdfDoc.Open();
            //htmlparser.Parse(sr);
            //pdfDoc.Close();
            //Response.Write(pdfDoc);
            //Response.End();
        }
    }
}
