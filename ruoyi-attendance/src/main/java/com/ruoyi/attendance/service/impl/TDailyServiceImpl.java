package com.ruoyi.attendance.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.aspectj.DataScopeAspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attendance.mapper.TDailyMapper;
import com.ruoyi.attendance.domain.TDaily;
import com.ruoyi.attendance.service.ITDailyService;

/**
 * 日报管理Service业务层处理
 *
 * @author niaobulashi
 * @date 2020-11-12
 */
@Service
public class TDailyServiceImpl implements ITDailyService {
    @Autowired
    private TDailyMapper tDailyMapper;
    
    /**
     * 查询日报管理
     *
     * @param dailyId 日报管理ID
     * @return 日报管理
     */
    @Override
    public TDaily selectTDailyById(Long dailyId) {
        return tDailyMapper.selectTDailyById(dailyId);
    }
    
    /**
     * 查询日报管理列表
     *
     * @param tDaily 日报管理
     * @return 日报管理
     */
    @Override
    public List<TDaily> selectTDailyList(TDaily tDaily, LoginUser loginUser) {
        SysUser user = loginUser.getUser();
        boolean roleFlag = false;
        for (SysRole role : user.getRoles()) {
            String dataScope = role.getDataScope();
            if (DataScopeAspect.DATA_SCOPE_ALL.equals(dataScope)) {
                roleFlag = true;
            }
        }
        // 如果是全部数据权限，则可以查询全部日报内容，否则只能查询自己的日报内容
        if (!roleFlag) {
            tDaily.setUserId(user.getUserId());
        }
        return tDailyMapper.selectTDailyList(tDaily);
    }
    
    /**
     * 新增日报管理
     *
     * @param tDaily 日报管理
     * @return 结果
     */
    @Override
    public int insertTDaily(TDaily tDaily, LoginUser loginUser) {
        SysUser user = loginUser.getUser();
        // 新增日报之前，根据userId，日报日期查询是否存在，存在则不允许重新新增相同日期的日报信息
        TDaily dailyExits = new TDaily();
        dailyExits.setUserId(user.getUserId());
        dailyExits.setDailyTime(tDaily.getDailyTime());
        List<TDaily> dailyList = tDailyMapper.selectTDailyList(dailyExits);
        if (dailyList != null && dailyList.size() > 0) {
            //MessageUtils.message("user.jcaptcha.expire");
            return 0;
        }
        tDaily.setUserId(user.getUserId());
        tDaily.setNickName(user.getNickName());
        tDaily.setCreateTime(DateUtils.getNowDate());
        tDaily.setCreateBy(user.getUserName());
        return tDailyMapper.insertTDaily(tDaily);
    }
    
    /**
     * 修改日报管理
     *
     * @param tDaily 日报管理
     * @return 结果
     */
    @Override
    public int updateTDaily(TDaily tDaily) {
        tDaily.setUpdateTime(DateUtils.getNowDate());
        return tDailyMapper.updateTDaily(tDaily);
    }
    
    /**
     * 批量删除日报管理
     *
     * @param dailyIds 需要删除的日报管理ID
     * @return 结果
     */
    @Override
    public int deleteTDailyByIds(Long[] dailyIds) {
        return tDailyMapper.deleteTDailyByIds(dailyIds);
    }
    
    /**
     * 删除日报管理信息
     *
     * @param dailyId 日报管理ID
     * @return 结果
     */
    @Override
    public int deleteTDailyById(Long dailyId) {
        return tDailyMapper.deleteTDailyById(dailyId);
    }
}
