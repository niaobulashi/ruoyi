import request from '@/utils/request'

// 查询订单管理列表
export function listOrder(query) {
  return request({
    url: '/develop/order/list',
    method: 'get',
    timeout: 400000,
    params: query
  })
}

// 查询订单管理详细
export function getOrder(id) {
  return request({
    url: '/develop/order/' + id,
    method: 'get',
    timeout: 400000
  })
}

// 新增订单管理
export function addOrder(data) {
  return request({
    url: '/develop/order',
    method: 'post',
    data: data
  })
}

// 修改订单管理
export function updateOrder(data) {
  return request({
    url: '/develop/order',
    method: 'put',
    data: data
  })
}

// 删除订单管理
export function delOrder(id) {
  return request({
    url: '/develop/order/' + id,
    method: 'delete'
  })
}

// 导出订单管理
export function exportOrder(query) {
  return request({
    url: '/develop/order/export',
    method: 'get',
    timeout: 400000,
    params: query
  })
}
