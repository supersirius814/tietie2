import request from '@/utils/request';
import Resource from '@/api/resource';

class MaintenanceResource extends Resource {
    constructor() {
        super('maintenance');
    }

    classHistory(query) {
        return request({
            url: this.baseUrl + this.uri + '/class_history',
            method: 'get',
            params: query,
        });
    }

    storeHistory(query) {
        return request({
            url: this.baseUrl + this.uri + '/shop_history',
            method: 'get',
            params: query,
        });
    }

    createProgress(id, insertData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/progress/create',
            method: 'post',
            data: insertData,
        });
    }

    createQuotation(id, insertData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/quotation/create',
            method: 'post',
            data: insertData,
        });
    }

    createAccounting(id, insertData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/accounting/create',
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

    customCodeSearch(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/customCodeSearch',
            method: 'get',
        });
    }

    ultimateCustomSearch(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/ultimateCustomSearch',
            method: 'post',
            data: updateData,
        });
    }

    getUploadFiles(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/getUploadFiles',
            method: 'get',
        });
    }

    saveNotes(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/saveNotes',
            method: 'post',
            data: updateData,
        });
    }

    update_customerid(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/update_customerid',
            method: 'post',
            data: updateData,
        });
    }

    big_middleconnect(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/big_middleconnect',
            method: 'get',
        });
    }

    middle_bigconnect(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/middle_bigconnect',
            method: 'get',
        });
    }

    depart_name(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/depart_name',
            method: 'get',
        });
    }
}

export { MaintenanceResource as default };