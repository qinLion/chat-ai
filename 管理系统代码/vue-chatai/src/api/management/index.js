import request from '@/utils/request'

// 获取用户列表
export function userList(query) {
  return request({
    url: '/system/app/user/list',
    method: 'get',
    params: query
  })
}
// 更改用户的状态
export function userUpdate(query) {
  return request({
    url: '/system/app/user/update',
    method: 'get',
    params: query
  })
}
// 获取聊天列表
export function messageList(query) {
  return request({
    url: '/system/app/message/list',
    method: 'get',
    params: query
  })
}
// 删除聊天列表
export function messageDelete(query) {
  return request({
    url: '/system/app/message/delete',
    method: 'get',
    params: query
  })
}
// 获取反馈列表
export function feedbackList(query) {
  return request({
    url: '/system/app/feedback/list',
    method: 'get',
    params: query
  })
}
// 删除反馈列表
export function feedbackDelete(query) {
  return request({
    url: '/system/app/feedback/delete',
    method: 'get',
    params: query
  })
}
// 获取文章列表
export function articleList(query) {
  return request({
    url: '/system/app/article/list',
    method: 'get',
    params: query
  })
}
// 新增文章
export function articleAdd(data) {
  return request({
    url: '/system/app/article/add',
    method: 'post',
    data: data
  })
}
// 删除文章
export function articleDelete(query) {
  return request({
    url: '/system/app/article/delete',
    method: 'get',
    params: query
  })
}
// 根据id获取文章
export function articleSelect(query) {
  return request({
    url: '/system/app/article/select',
    method: 'get',
    params: query
  })
}
// 修改文章
export function articleUpdate(data) {
  return request({
    url: '/system/app/article/update',
    method: 'post',
    data: data
  })
}
// 获取key列表
export function keyList(query) {
  return request({
    url: '/system/app/key/list',
    method: 'get',
    params: query
  })
}
// 新增key
export function keyAdd(query) {
  return request({
    url: '/system/app/key/add',
    method: 'get',
    params: query
  })
}
// 删除key
export function keyDelete(query) {
  return request({
    url: '/system/app/key/delete',
    method: 'get',
    params: query
  })
}
// 更改key的状态
export function keyUpdate(query) {
  return request({
    url: '/system/app/key/update',
    method: 'get',
    params: query
  })
}
// 测试key
export function keyTest() {
  return request({
    url: '/system/app/key/test',
    method: 'get'
  })
}
