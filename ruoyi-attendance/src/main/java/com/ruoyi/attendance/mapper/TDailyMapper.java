package com.ruoyi.attendance.mapper;

import java.util.List;

import com.ruoyi.attendance.domain.TDaily;

/**
 * 日报管理Mapper接口
 *
 * @author niaobulashi
 * @date 2020-11-12
 */
public interface TDailyMapper {
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
    public List<TDaily> selectTDailyList(TDaily tDaily);
    
    /**
     * 新增日报管理
     *
     * @param tDaily 日报管理
     * @return 结果
     */
    public int insertTDaily(TDaily tDaily);
    
    /**
     * 修改日报管理
     *
     * @param tDaily 日报管理
     * @return 结果
     */
    public int updateTDaily(TDaily tDaily);
    
    /**
     * 删除日报管理
     *
     * @param dailyId 日报管理ID
     * @return 结果
     */
    public int deleteTDailyById(Long dailyId);
    
    /**
     * 批量删除日报管理
     *
     * @param dailyIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteTDailyByIds(Long[] dailyIds);
}
