package util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.stream.Stream;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.element.Image;

import entity.Application;
import entity.Semester;

public class PDF {
	/** 生成PDF申请表 */
	public static ByteArrayInputStream generate(Application application,Semester semester) throws IOException {
		String path="/home/shouyinji1/eclipse-workspace/ClassroomBorrowingManagementSystem/";
		//String dest=path+"application-"+application.getId()+".pdf";
		ByteArrayOutputStream bao = new ByteArrayOutputStream();//新建一个输出流

        //生成文件的pdfDoc对象
        PdfWriter dfWriter = new PdfWriter(bao);
        dfWriter.setSmartMode(true);
        PdfDocument pdf = new PdfDocument(dfWriter);
        Document doc=new Document(pdf);
        // 添加Logo
        doc.add(new Image(ImageDataFactory.create(path+"src/hyit-logo.jpg")).scale(0.5f,0.5f));
        // 仿宋字体
        PdfFont sysFont=PdfFontFactory.createFont(path+"src/simfang.ttf",PdfEncodings.IDENTITY_H,true);
        // 添加标题
        doc.add(new Paragraph("淮阴工学院"+semester.getsName()).setTextAlignment(TextAlignment.CENTER)
        		.setFontSize(25)
        		.setFont(sysFont));
        doc.add(new Paragraph("教室借用申请信息表").setTextAlignment(TextAlignment.CENTER)
        		.setFontSize(25)
        		.setFont(sysFont));
        // 添加表格
		Table table = new Table(new float[] { 10, 10, 10, 10, 10, 10, 10, 10, }).setWidth(520).setFixedLayout();
		table.setFont(sysFont);
		table.addCell(new Cell(1,8).add(new Paragraph("申请与申请者信息")).setTextAlignment(TextAlignment.CENTER));
		table.addCell(new Cell().add(new Paragraph("申请ID：")).setBold());
		table.addCell(Integer.toString(application.getId()));
		table.addCell(new Cell().add(new Paragraph("申请时间：")).setBold());
		table.addCell(new Cell(1,3).add(new Paragraph(application.getFormatSubmitTime())));
		table.addCell(new Cell().add(new Paragraph("申请者ID：")).setBold());
		table.addCell(application.getUserID());
		table.addCell(new Cell().add(new Paragraph("姓名：")).setBold());
		table.addCell(new Cell(1,2).add(new Paragraph(application.getUser().getName())));
		table.addCell(new Cell().add(new Paragraph("部门：")).setBold());
		table.addCell(new Cell(1,4).add(new Paragraph(application.getUser().getDepartment())));
		table.addCell(new Cell().add(new Paragraph("电话：")).setBold());
		table.addCell(new Cell(1,2).add(new Paragraph(application.getUser().getPhone())));
		table.addCell(new Cell().add(new Paragraph("邮箱：")).setBold());
		table.addCell(new Cell(1,4).add(new Paragraph(application.getUser().getEmail())));

		table.addCell(new Cell(1,8).add(new Paragraph("申请教室信息")).setTextAlignment(TextAlignment.CENTER));
		table.addCell(new Cell().add(new Paragraph("教室编号：")).setBold());
		table.addCell(application.getRoomID());
		table.addCell(new Cell().add(new Paragraph("名称：")).setBold());
		table.addCell(application.getClassroom().getName());
		table.addCell(new Cell().add(new Paragraph("类型：")).setBold());
		table.addCell(application.getClassroom().getType());
		table.addCell(new Cell().add(new Paragraph("容量：")).setBold());
		table.addCell(application.getClassroom().getCapacity());
		table.addCell(new Cell().add(new Paragraph("校区：")).setBold());
		table.addCell(application.getClassroom().getXiaoQu());
		table.addCell(new Cell().add(new Paragraph("教学区：")).setBold());
		table.addCell(application.getClassroom().getJiaoXueQu());
		table.addCell(new Cell().add(new Paragraph("教学楼：")).setBold());
		table.addCell(application.getClassroom().getJiaoXueLou());
		table.addCell(new Cell().add(new Paragraph("楼层：")).setBold());
		table.addCell(application.getClassroom().getFloor());

		table.addCell(new Cell(1,8).add(new Paragraph("申请使用时间")).setTextAlignment(TextAlignment.CENTER));
		table.addCell(new Cell().add(new Paragraph("周次：")).setBold());
		table.addCell(Integer.toString(application.getZhouCi()));
		table.addCell(new Cell().add(new Paragraph("星期：")).setBold());
		table.addCell(Integer.toString(application.getXingQi()));
		table.addCell(new Cell().add(new Paragraph("开始节次：")).setBold());
		table.addCell(Integer.toString(application.getsJieCi()));
		table.addCell(new Cell().add(new Paragraph("结束节次：")).setBold());
		table.addCell(Integer.toString(application.geteJieCi()));

		table.addCell(new Cell(1,8).add(new Paragraph("申请目的")).setTextAlignment(TextAlignment.CENTER));
		table.addCell(new Cell().add(new Paragraph("申请类型：")).setBold());
		table.addCell(application.getType());
		table.addCell(new Cell().add(new Paragraph("申请用途：")).setBold());
		table.addCell(new Cell(1,5).add(new Paragraph(application.getPurpose())));

		table.addCell(new Cell(1,8).add(new Paragraph("审批意见")).setTextAlignment(TextAlignment.CENTER));
		table.addCell(new Cell().add(new Paragraph("审批人：")).setBold());
		table.addCell(application.getReviewer().getName());
		table.addCell(new Cell().add(new Paragraph("审批时间：")).setBold());
		table.addCell(new Cell(1,3).add(new Paragraph(application.getFormatReviewTime())));	
		table.addCell(new Cell().add(new Paragraph("意见：")).setBold());
		table.addCell("abc");
		table.addCell(new Cell().add(new Paragraph("意见内容：")).setBold());
		table.addCell(new Cell(1,7).add(new Paragraph(application.getReviewContent())));

        doc.add(table);
        doc.close();
        
        ByteArrayInputStream swapStream = new ByteArrayInputStream(bao.toByteArray());//将输出流转换为输入流
        return swapStream;
	}
}
