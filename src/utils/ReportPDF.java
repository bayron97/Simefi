package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.kernel.geom.PageSize;


public class ReportPDF{
	
	public static void solicitudDisponibilidadCreatePDF(String baseUrlHost, String assetsRealPath, String newFilePath, String codSD, String token) throws IOException {
		// IO & Web
        Response response = Jsoup.connect("http://" + baseUrlHost + "/solicitudDisponibilidadALPReport?codSD=" + codSD + "&token=" + token).userAgent("Mozilla/5.0").timeout(100000).ignoreHttpErrors(true).execute();
        Document document = response.parse();
        System.out.println("codsd " + codSD);
        System.out.println("codigo" + codSD);
        System.out.println("Aqui si");
        File htmlSource = new File(assetsRealPath + "/temp"+ Math.random()*10000 +".html");
        System.out.println("aaset " + assetsRealPath + "/temp"+ Math.random()*10000 +".html");
        FileUtils.writeStringToFile(htmlSource, document.outerHtml(), StandardCharsets.UTF_8);
        System.out.println("Aqui no");
        
        PdfWriter writer = new PdfWriter(newFilePath);
        PdfDocument pdfDoc = new PdfDocument(writer);
        pdfDoc.setDefaultPageSize(PageSize.LEGAL.rotate());
        
        //pdfHTML specific code
        ConverterProperties converterProperties = new ConverterProperties();
        converterProperties.setBaseUri(htmlSource.getParent());
        HtmlConverter.convertToPdf(new FileInputStream(htmlSource), pdfDoc, converterProperties);
        
        //Delete Temp File
        htmlSource.delete();
	}
	
	public static void solicitudDisponibilidadGeneralCreatePDF(String baseUrlHost, String assetsRealPath, String newFilePath, String codSD, String token) throws IOException {
		// IO & Web
        Response response = Jsoup.connect("http://" + baseUrlHost + "/solicitudDisponibilidadALPReport?codSD=" + codSD + "&token=" + token).userAgent("Mozilla/5.0").timeout(100000).ignoreHttpErrors(true).execute();
        Document document = response.parse();

        File htmlSource = new File(assetsRealPath + "/temp"+ Math.random()*10000 +".html");
        FileUtils.writeStringToFile(htmlSource, document.outerHtml(), StandardCharsets.UTF_8);
        
        PdfWriter writer = new PdfWriter(newFilePath);
        PdfDocument pdfDoc = new PdfDocument(writer);
        pdfDoc.setDefaultPageSize(PageSize.LEGAL.rotate());
        
        //pdfHTML specific code
        ConverterProperties converterProperties = new ConverterProperties();
        converterProperties.setBaseUri(htmlSource.getParent());
        HtmlConverter.convertToPdf(new FileInputStream(htmlSource), pdfDoc, converterProperties);
        
        //Delete Temp File
        htmlSource.delete();
	}
}
