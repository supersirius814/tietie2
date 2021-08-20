import request from '@/utils/request';

/**
 * Simple RESTful resource class
 */
class Resource {
  constructor(uri) {
    this.uri = uri;
    this.baseUrl = '/api/v2/';
  }
  list(query) {
    return request({
      url: this.baseUrl + this.uri,
      method: 'get',
      params: query,
    });
  }
  get(id) {
    return request({
      url: this.baseUrl + this.uri + '/' + id,
      method: 'get',
    });
  }
  store(resource) {
    return request({
      url: this.baseUrl + this.uri,
      method: 'post',
      data: resource,
    });
  }
  update(id, resource) {
    return request({
      url: this.baseUrl + this.uri + '/' + id,
      method: 'put',
      data: resource,
    });
  }
  destroy(id) {
    return request({
      url: this.baseUrl + this.uri + '/' + id,
      method: 'delete',
    });
  }
}

export { Resource as default };
