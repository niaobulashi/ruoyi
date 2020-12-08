import request from '@/utils/request'

// 查询日报管理列表
export function listDaily(query) {
  return request({
    url: '/attendance/daily/list',
    method: 'get',
    params: query
  })
}

// 查询日报管理详细
export function getDaily(dailyId) {
  return request({
    url: '/attendance/daily/' + dailyId,
    method: 'get'
  })
}

// 新增日报管理
export function addDaily(data) {
  return request({
    url: '/attendance/daily',
    method: 'post',
    data: data
  })
}

// 修改日报管理
export function updateDaily(data) {
  return request({
    url: '/attendance/daily',
    method: 'put',
    data: data
  })
}

// 删除日报管理
export function delDaily(dailyId) {
  return request({
    url: '/attendance/daily/' + dailyId,
    method: 'delete'
  })
}

// 导出日报管理
export function exportDaily(query) {
  return request({
    url: '/attendance/daily/export',
    method: 'get',
    params: query
  })
}