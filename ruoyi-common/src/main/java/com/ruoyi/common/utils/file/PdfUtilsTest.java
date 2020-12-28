package com.ruoyi.common.utils.file;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;

import java.io.*;
import java.nio.charset.Charset;

/**
 * @version V1.0
 * @Description: 转换pdf工具类
 * @author: hulang
 * @date: 2020/12/09
 */
public class PdfUtilsTest {
    
    /**
     * 模拟从数据库读取的数据
     */
    private static final String CONTENT = "<p><a href=\"http://c.biancheng.net/view/7552.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(211, 52, 40);\">Java一对一答疑，帮助有志青年！使用QQ在线辅导，哪里不懂问哪里，整个过程都是一对一，学习更有针对性。和作者直接交流，不但提升技能，还提升 Level；当你决定加入我们，你已然超越了 90% 的程序员。</a><a href=\"http://c.biancheng.net/view/7552.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 136, 204);\">猛击这里了解详情。</a></p>";
    /**
     * 拼接CONTENT 使成为完整的html,\"font-family: SimSun;\"
     */
    private static final String COMPLETE_CONTENT = "<html><meta charset=\"utf-8\"/><head></head><body style=\"font-family: SimSun;\">" + CONTENT + "</body></html>";
    
    public static void main(String[] args) throws Exception {
        PdfUtilsTest utils = new PdfUtilsTest();
    
        String content = COMPLETE_CONTENT;
        content = content.replace("<br>", "<br/>");
        utils.html2Pdf(content);
    }
    
    /**
     * html转换成pdf文件
     *
     * @param htmlContent
     * @throws Exception
     */
    public void html2Pdf(String htmlContent) throws Exception {
        htmlContent = htmlContent.replaceAll("<div", "<span");
        htmlContent = htmlContent.replaceAll("/div>", "/span><br/>");
        //关闭未封闭式标签br
        htmlContent = htmlContent.replaceAll("<br[^>]*>", "<br/>");
        //处理样式background-color: transparent; IE模式下存在兼容问题，火狐谷歌正常
        htmlContent = htmlContent.replaceAll("background-color: transparent;", " ");
        File dir = new File("./temporary");
        if (!dir.exists()) {
            dir.mkdir();
        }
        File pdfFile = new File(dir + "/测试" + "-" + System.currentTimeMillis() + ".pdf");
        //1 打开文件流
        Document document = new Document();
        FileOutputStream fos = new FileOutputStream(pdfFile);
        InputStream is = new ByteArrayInputStream(htmlContent.getBytes(Charset.forName("UTF-8")));
        InputStream cssIs = new ByteArrayInputStream(getCssFile());
        PdfWriter writer = null;
        try {
            writer = PdfWriter.getInstance(document, fos);
            //3. 设置字体
            XMLWorkerFontProvider fontProvider1 = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
            fontProvider1.register("ruoyi-ui/simsun.ttc");
            
            //3 打开文档
            document.open();
            //4 html转为pdf
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, is, cssIs, Charset.forName("UTF-8"));
            
        } catch (DocumentException | IOException e) {
            throw new RuntimeException("转pdf失败罗~");
        } finally {
            if (null != writer) {
                writer.flush();
            }
            //5 关闭文档
            document.close();
            fos.close();
            cssIs.close();
            is.close();
            writer.close();
        }
    }
    
    /**
     * 获取样式文件
     *
     * @return
     * @throws Exception
     */
    public byte[] getCssFile() throws Exception {
        FileInputStream fileInputStream = new FileInputStream("ruoyi-ui/editor.css");
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1204];
        int len = 0;
        while ((len = fileInputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        fileInputStream.close();
        return outStream.toByteArray();
    }
}
