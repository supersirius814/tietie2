import request from '@/utils/request';
import Resource from '@/api/resource';
import mock from '@/api/mock/maintenance.json';

class MaintenanceResource extends Resource {
  constructor() {
    super('maintenance');
  }

  listTest(query) {
    return new Promise((resolve, reject) => {
      resolve(mock);
    });
  }

  permissions(id) {
    return request({
      url: '/' + this.uri + '/' + id + '/permissions',
      method: 'get',
    });
  }

  updatePermission(id, permissions) {
    return request({
      url: '/' + this.uri + '/' + id + '/permissions',
      method: 'put',
      data: permissions,
    });
  }
}

export { MaintenanceResource as default };
