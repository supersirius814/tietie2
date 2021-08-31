import request from '@/utils/request';
import Resource from '@/api/resource';

class MaintenanceResource extends Resource {
  constructor() {
    super('maintenance');
  }

  classHistory(query){
    return request({
      url: this.baseUrl + this.uri + '/class_history',
      method: 'get',
      params: query,
    });
  }

  storeHistory(query){
    return request({
      url: this.baseUrl + this.uri + '/shop_history',
      method: 'get',
      params: query,
    });
  }

  createProgress(id, insertData){
    return request({
      url: this.baseUrl + this.uri + '/' + id + '/progress/create',
      method: 'post',
      data: insertData,
    });
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
