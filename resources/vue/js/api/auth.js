import request from '@/utils/request';

export function login(data) {
  return request({
    url: '/auth/login',
    method: 'post',
    data: data,
  });
}

export function getInfo(token) {
  return new Promise((resolve, reject) => {
    resolve({
      'data': {
        'id': 1,
        'name': 'Admin',
        'email': 'admin@laravue.dev',
        'roles': ['admin'],
        'permissions': ['view menu element ui', 'view menu permission', 'view menu components', 'view menu charts', 'view menu nested routes', 'view menu table', 'view menu administrator', 'view menu theme', 'view menu clipboard', 'view menu excel', 'view menu zip', 'view menu pdf', 'view menu i18n', 'manage user', 'manage article', 'manage permission'],
        'avatar': 'https:\/\/i.pravatar.cc',
      },
    });
  });
}

export function logout() {
  return request({
    url: '/auth/logout',
    method: 'post',
  });
}

export function csrf() {
  return request({
    url: '/sanctum/csrf-cookie',
    method: 'get',
  });
}
