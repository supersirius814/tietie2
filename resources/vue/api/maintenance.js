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

    customsearch(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/customsearch',
            method: 'get',
        });
    }

    customsearchAgain(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/customsearchAgain',
            method: 'post',
            data: updateData,
        });
    }

    getPhotoFiles(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/photo_files',
            method: 'get',
        });
    }

    getReportFiles(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/report_files',
            method: 'get',
        });
    }

    getImage(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/getImage',
            method: 'post',
            data: updateData,
        });
    }

    getfile(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/getfile',
            method: 'post',
            data: updateData,
        });
    }

    getQuotationFiles(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/quotation_files',
            method: 'get',
        });
    }

    saveNotes(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/selectreason',
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
    depart_name(id) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/depart_name',
            method: 'get',
        });
    }
}

export { MaintenanceResource as default };