import request from '@/utils/request'

// 查询工作日历列表
export function listCalendar(query) {
  return request({
    url: '/system/calendar/list',
    method: 'get',
    params: query
  })
}

// 查询工作日历详细
export function getCalendar(dateStr) {
  return request({
    url: '/system/calendar/' + dateStr,
    method: 'get'
  })
}

// 新增工作日历
export function addCalendar(data) {
  return request({
    url: '/system/calendar',
    method: 'post',
    data: data
  })
}

// 修改工作日历
export function updateCalendar(data) {
  return request({
    url: '/system/calendar',
    method: 'put',
    data: data
  })
}

// 删除工作日历
export function delCalendar(dateStr) {
  return request({
    url: '/system/calendar/' + dateStr,
    method: 'delete'
  })
}

// 导出工作日历
export function exportCalendar(query) {
  return request({
    url: '/system/calendar/export',
    method: 'get',
    params: query
  })
}

// 同步日历数据
export function syncCalendar(data) {
  return request({
    url: '/system/calendar/dateSyncRange123',
    method: 'post',
    data: data
  })
}
