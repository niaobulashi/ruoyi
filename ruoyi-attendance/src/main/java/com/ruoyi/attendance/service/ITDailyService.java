package com.ruoyi.attendance.service;

import java.util.List;

import com.ruoyi.attendance.domain.TDaily;
import com.ruoyi.common.core.domain.model.LoginUser;

/**
 * 日报管理Service接口
 *
 * @author niaobulashi
 * @date 2020-11-12
 */
public interface ITDailyService {
    /**
     * 查询日报管理
     *
     * @param dailyId 日报管理ID
     * @return 日报管理
     */
    public TDaily selectTDailyById(Long dailyId);
    
    /**
     * 查询日报管理列表
     *
     * @param tDaily 日报管理
     * @return 日报管理集合
     */
    public List<TDaily> selectTDailyList(TDaily tDaily, LoginUser loginUser);
    
    /**
     * 新增日报管理
     *
     * @param tDaily 日报管理
     * @return 结果
     */
    public int insertTDaily(TDaily tDaily, LoginUser loginUser);
    
    /**
     * 修改日报管理
     *
     * @param tDaily 日报管理
     * @return 结果
     */
    public int updateTDaily(TDaily tDaily);
    
    /**
     * 批量删除日报管理
     *
     * @param dailyIds 需要删除的日报管理ID
     * @return 结果
     */
    public int deleteTDailyByIds(Long[] dailyIds);
    
    /**
     * 删除日报管理信息
     *
     * @param dailyId 日报管理ID
     * @return 结果
     */
    public int deleteTDailyById(Long dailyId);
}
