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
    private static final String CONTENT = "<h3>概要</h3><p>项目中，管理员需要编辑合同模板，客户根据模板填写信息后，系统生成pdf文件上传到远程端。我们的合同模板在项目中用的是<strong>富文本编辑</strong>，存储到数据库中是带有<strong>html标签</strong>的字符串。</p><p><strong>html可以直接转为pdf</strong>，网上有很多工具/框架。也有人分析了各种工具的优劣。可自行搜索。这里使用的是<strong>iText</strong>框架</p><p><br></p><p><br></p><p><br></p><h3>坑点</h3><p>1.富文本编辑器编辑的文本是带有样式的，<strong>一定切记切记</strong>要前端把<strong>编辑器的样式文件</strong>给你！！！否则转换后的pdf没有样式</p><p>2.远程服务器（非win系统）中文显示不出来的问题，就是字体的问题。网上搜有三种方式，我这的处理是将1）win10系统的字体文件拷贝出来，放到项目的资源文件夹中，2）代码引入字体，3）在html的body标签加上字体（字体可以换成其他的）</p><p>3.本地生成的pdf打开没问题，但上传到远程服务器后打不开。我怀疑是因为生成pdf后该文件被占用，没有及时释放该File 对象，导<em>致上传的pdf被破坏。</em>我的解决方式是将上传文件步骤与生成pdf分别写到两个方法，暂时这么处理（哪位大佬知道原因的可以告诉下嘛？）</p><p>4.itext转换pdf，对标签的要求比较高。html文件的标签一定要有头有尾，像<strong>要转换成</strong></p><p>5.报没有document的错误时（具体错<span class=\"ql-size-huge\">误信息忘了），</span>首先考虑字体名称是不是写错了。</p><p><br></p><p>";
    /**
     * 拼接CONTENT 使成为完整的html,\"font-family: SimSun;\"
     */
    private static final String COMPLETE_CONTENT = "<html><head></head><body style=\"font-family: SimSun;\">" + CONTENT + "</body></html>";
    
    public static void main(String[] args) throws Exception {
        PdfUtilsTest utils = new PdfUtilsTest();
        String content = utils.content2Html();
        utils.html2Pdf(content);
    }
    
    /**
     * html转换成pdf文件
     *
     * @param htmlContent
     * @throws Exception
     */
    public void html2Pdf(String htmlContent) throws Exception {
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
     * 获取html
     *
     * @return
     */
    public String content2Html() {
        String content = COMPLETE_CONTENT;
        content = content.replace("<br>", "<br/>");
        return content;
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
