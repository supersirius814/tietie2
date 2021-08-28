import request from '@/utils/request';
import Resource from '@/api/resource';

class MaintenanceResource extends Resource {
  constructor() {
    super('maintenance');
  }

  update(id, updateData) {
    return request({
      url: this.baseUrl + this.uri + '/' + id + '/put/update',
      method: 'post',
      data: updateData,
    });
  }
}

export { MaintenanceResource as default };
