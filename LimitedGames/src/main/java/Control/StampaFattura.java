package Control;

import Model.Utente.*;
import Model.Ordine.*;

import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Collection;
import java.util.Map;

@WebServlet("/StampaFattura")
public class StampaFattura extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String fileName = "fattura.pdf";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	AcquistoDAO model = new AcquistoDAO();
    	OrdineDAO ordineModel = new OrdineDAO();
        final String PATH = request.getServletContext().getRealPath(File.separator) + File.separator + "pdf" +
                File.separator;

        PDDocument document = Loader.loadPDF(new File(PATH + fileName));
        UtenteBean utenteBean = (UtenteBean) request.getSession().getAttribute("user");
        int idOrdine = Integer.parseInt(request.getParameter("ordine"));    
        OrdineBean ordine = null;
        Collection<AcquistoBean> acquisti = null;
        try {
        	ordine = ordineModel.doRetrieveByKey(idOrdine);
        	acquisti = model.doRetrieveByOrdine(ordine.getId());
        }catch(Exception e) {
        	e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
        }

        PDPage page = document.getPage(0);
        page.setMediaBox(PDRectangle.A4);

        PDPageContentStream contentStream = new PDPageContentStream(document, page, PDPageContentStream.AppendMode.APPEND, true);

        contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 8);

        contentStream.beginText();
        contentStream.newLineAtOffset(430.864f, 588.7037f);
        contentStream.showText(LocalDate.now().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)));
        contentStream.endText();

        contentStream.beginText();
        contentStream.newLineAtOffset(430.864f, 571.963f);
        assert ordine != null;
        contentStream.showText(ordine.getDataOrdine().toString());
        contentStream.endText();

        contentStream.beginText();
        contentStream.newLineAtOffset(46.6203f, 595.2537f);
        contentStream.showText(utenteBean.getNome());
        contentStream.endText();

        contentStream.beginText();
        contentStream.newLineAtOffset(46.6203f, 584.2537f);
        contentStream.showText(utenteBean.getCognome());
        contentStream.endText();
        contentStream.beginText();

        contentStream.newLineAtOffset(46.6203f, 573.2537f);
        contentStream.showText(utenteBean.getVia() + " " + utenteBean.getCAP());
        contentStream.endText();

        contentStream.beginText();
        contentStream.newLineAtOffset(46.6203f, 562.2537f);
        contentStream.showText(utenteBean.getCitta());
        contentStream.endText();

        contentStream.beginText();
        contentStream.newLineAtOffset(405.1517f, 544.2341f);
        contentStream.showText(ordine.getPrezzo() + " €");
        contentStream.endText();

        float coord = 401.0316f;
        for (AcquistoBean a : acquisti) {
            contentStream.beginText();
            contentStream.newLineAtOffset(42.7409f, coord);
            contentStream.showText(String.valueOf(a.getTitolo())+" "+String.valueOf(a.getEdizione()+" Edition  ")+String.valueOf(a.getPiattaforma()));
            contentStream.endText();

            contentStream.beginText();
            contentStream.newLineAtOffset(288.2813f, coord);
            contentStream.showText(String.valueOf(a.getQuantita()));
            contentStream.endText();

            contentStream.beginText();
            contentStream.newLineAtOffset(344.4793f, coord);
            contentStream.showText( a.getPrezzo() + " €");
            contentStream.endText();

            contentStream.beginText();
            contentStream.newLineAtOffset(515.6068f, coord);
            contentStream.showText((a.getPrezzo() * a.getQuantita() + " €"));
            contentStream.endText();

            coord -= 15;
        }

        contentStream.close();

        document.save(new File(PATH + "output.pdf"));
        document.close();

        response.setContentType("application/pdf");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=output.pdf");
        response.sendRedirect("pdf/output.pdf");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}