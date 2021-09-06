package com.ruoyi.system.service.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.exception.base.BaseException;
import com.ruoyi.common.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysCalendarMapper;
import com.ruoyi.system.domain.SysCalendar;
import com.ruoyi.system.service.ISysCalendarService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import static com.ruoyi.common.utils.DateUtils.differentDays;

/**
 * 工作日历Service业务层处理
 *
 * @author niaobulashi
 * @date 2020-11-25
 */
@Service
public class SysCalendarServiceImpl implements ISysCalendarService {
    static final Logger logger = LoggerFactory.getLogger(SysCalendarServiceImpl.class);
    public static final String DEF_CHATSET = "UTF-8";
    public static final int DEF_CONN_TIMEOUT = 30000;
    public static final int DEF_READ_TIMEOUT = 30000;
    public static String userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
    public static final String INFO = "1";
    
    @Resource
    private SysCalendarMapper sysCalendarMapper;
    
    /**
     * 查询工作日历
     *
     * @param dateStr 工作日历ID
     * @return 工作日历
     */
    @Override
    public SysCalendar selectSysCalendarById(String dateStr) {
        return sysCalendarMapper.selectSysCalendarById(dateStr);
    }
    
    /**
     * 查询工作日历列表
     *
     * @param sysCalendar 工作日历
     * @return 工作日历
     */
    @Override
    public List<SysCalendar> selectSysCalendarList(SysCalendar sysCalendar) {
        return sysCalendarMapper.selectSysCalendarList(sysCalendar);
    }
    
    /**
     * 新增工作日历
     *
     * @param sysCalendar 工作日历
     * @return 结果
     */
    @Override
    public int insertSysCalendar(SysCalendar sysCalendar) {
        return sysCalendarMapper.insertSysCalendar(sysCalendar);
    }
    
    /**
     * 修改工作日历
     *
     * @param sysCalendar 工作日历
     * @return 结果
     */
    @Override
    public int updateSysCalendar(SysCalendar sysCalendar) {
        return sysCalendarMapper.updateSysCalendar(sysCalendar);
    }
    
    /**
     * 批量删除工作日历
     *
     * @param dateStrs 需要删除的工作日历ID
     * @return 结果
     */
    @Override
    public int deleteSysCalendarByIds(String[] dateStrs) {
        return sysCalendarMapper.deleteSysCalendarByIds(dateStrs);
    }
    
    /**
     * 删除工作日历信息
     *
     * @param dateStr 工作日历ID
     * @return 结果
     */
    @Override
    public int deleteSysCalendarById(String dateStr) {
        return sysCalendarMapper.deleteSysCalendarById(dateStr);
    }
    
    /**
     * 同步工作日历信息
     *
     * @param sysCalendar 日期区间
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void syncCalendar(SysCalendar sysCalendar) {
        try {
            logger.info("同步开始日期:" + sysCalendar.getBeginTime());
            logger.info("同步结束日期:" + sysCalendar.getEndTime());
            Calendar compareDay = new GregorianCalendar();
            SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.YYYY_MM_DD);
            Date startDate = sdf.parse(sysCalendar.getBeginTime());
            Date endDate = sdf.parse(sysCalendar.getEndTime());
            int differentDays = differentDays(startDate, endDate);
            logger.info(sysCalendar.getBeginTime() + " ~ " + sysCalendar.getEndTime() + " ,间隔天数为" + differentDays);
            for (int i = 0; i < differentDays; i++) {
                compareDay.setTime(startDate);
                compareDay.add(Calendar.DATE, i);
                String day = sdf.format(compareDay.getTime());
                logger.info("日期：" + day);
                // 获取日期详情
                getRequest(day);
                // 等待5s，避免请求频率太快，被拉进黑名单
                TimeUnit.SECONDS.sleep(5);
            }
            // 同步工作日信息接口调用
        } catch (Exception e) {
            throw new BaseException("同步工作日历信息失败：" + e.getMessage());
        }
    }
    
    /**
     * 获取当天的详细信息
     * @param dateStr
     */
    public void getRequest(String dateStr) {
        SysCalendar cal = new SysCalendar();
        String result = null;
        // 请求接口地址
        String url = "http://tool.bitefu.net/jiari/";
        // 请求参数
        Map params = new HashMap();
        // 您申请的appKey
        params.put("info", INFO);
        // 指定日期,格式为YYYYMMDD,如月份和日期小于10,则取个位,如:20120101
        params.put("d", dateStr);
        try {
            // 发送请求
            result = net(url, params, "GET");
            System.out.println("返回报文：" + result);
            // 转换返回报文为json格式
            JSONObject object = JSONObject.parseObject(result);
            if (object.getString("status").equals("1")) {
                // 根据日期和日期类型查询数据库中是否存在
                SysCalendar calendar = sysCalendarMapper.selectSysCalendarById(dateStr);
                // 若存在
                if (calendar != null) {
                    // 判断接口返回的日期类型和数据中保存的是否一致，若不一致，则更新
                    if (calendar.getType().equals(object.get("type"))) {
                        // 说明国家法定节假日有变化，之前存入的数据，需要变更
                        // 赋值工作日历数据
                        setSysCalendar(dateStr, cal, object);
                        sysCalendarMapper.updateSysCalendar(cal);
                    }
                    // 若为空，则直接新增日期
                } else {
                    // 赋值工作日历数据
                    setSysCalendar(dateStr, cal, object);
                    sysCalendarMapper.insertSysCalendar(cal);
                }
            } else {
                logger.info(object.get("success") + ":" + object.get("msg"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 赋值工作日历数据
     *
     * @param dateStr 同步日期
     * @param cal     工作日历vo
     * @param object  object
     */
    private void setSysCalendar(String dateStr, SysCalendar cal, JSONObject object) {
        cal.setDateStr(dateStr.replaceAll("-",""));
        cal.setType(object.getString("type"));
        cal.setTypeName(object.getString("typename"));
        cal.setYearName(object.getString("yearname"));
        cal.setNongLiCn(object.getString("nonglicn"));
        cal.setNongLi(object.getString("nongli"));
        cal.setAnimalsYear(object.getString("shengxiao"));
        cal.setThrottle(object.getString("jieqi"));
        cal.setWeekCn(object.getString("weekcn"));
        cal.setWeek1(object.getString("week1"));
        cal.setWeek2(object.getString("week2"));
        cal.setWeek3(object.getString("week3"));
        cal.setDayNum(object.getString("daynum"));
        cal.setWeekNum(object.getString("weeknum"));
        if (object.containsKey("avoid")) {
            cal.setAvoid(object.getString("avoid"));
        }
        if (object.containsKey("suit")) {
            cal.setSuit(object.getString("suit"));
        }
    }
    
    /**
     * 发送请求
     *
     * @param strUrl 请求地址
     * @param params 请求参数
     * @param method 请求方法
     * @return 网络请求字符串
     * @throws Exception exception
     */
    public static String net(String strUrl, Map params, String method) throws Exception {
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        String rs = null;
        try {
            StringBuffer sb = new StringBuffer();
            if (method == null || method.equals("GET")) {
                strUrl = strUrl + "?" + urlencode(params);
            }
            URL url = new URL(strUrl);
            conn = (HttpURLConnection) url.openConnection();
            if (method == null || method.equals("GET")) {
                conn.setRequestMethod("GET");
            } else {
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
            }
            conn.setRequestProperty("User-agent", userAgent);
            conn.setUseCaches(false);
            conn.setConnectTimeout(DEF_CONN_TIMEOUT);
            conn.setReadTimeout(DEF_READ_TIMEOUT);
            conn.setInstanceFollowRedirects(false);
            conn.connect();
            if (params != null && method.equals("POST")) {
                try {
                    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
                    out.writeBytes(urlencode(params));
                } catch (Exception e) {
                    // TODO: handle exception
                }
            }
            InputStream is = conn.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sb.append(strRead);
            }
            rs = sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                reader.close();
            }
            if (conn != null) {
                conn.disconnect();
            }
        }
        return rs;
    }
    
    /**
     * 将map型转为请求参数型
     * @param data
     * @return the string
     */
    public static String urlencode(Map<String, Object> data) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry i : data.entrySet()) {
            try {
                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue() + "", "UTF-8")).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
}
