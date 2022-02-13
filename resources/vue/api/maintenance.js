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

    customsList() {
        return request({
            url: this.baseUrl + this.uri + '/customsList',
            method: 'get'
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

    editAccountingId(id, updateData) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/accounting/update',
            method: 'post',
            data: updateData,
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

    deleteQuotationId(id, data) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/deleteQuotationId',
            method: 'post',
            data: data,
        });
    }

    deleteAccountingId(id, data) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/deleteAccountingId',
            method: 'post',
            data: data,
        });
    }

    getAccountingSubjects(id, data) {
        return request({
            url: this.baseUrl + this.uri + '/' + id + '/getAccountingSubjects',
            method: 'post',
            data: data,
        });
    }

    getSubjects() {
        return request({
            url: this.baseUrl + this.uri + '/getSubjects',
            method: 'get',
        });
    }

    // depart_name(id) {
    //     return request({
    //         url: this.baseUrl + this.uri + '/' + id + '/depart_name',
    //         method: 'get',
    //     });
    // }

    eventcheckCountfunc() {
        return request({
            url: this.baseUrl + this.uri + '/eventcheckCountfunc',
            method: 'get',
        });
    }

    csvExport(data) {
        return request({
            url: this.baseUrl + this.uri + '/csv/export',
            method: 'post',
            data: data,
        });
    }

    csvImport(data) {
        return request({
            url: this.baseUrl + this.uri + '/csv/import',
            method: 'post',
            data: data,
        });
    }

    getParents(data) {
        return request({
            url: this.baseUrl + this.uri + '/getParents',
            method: 'post',
            data: data,
        });
    }

    getPartners_staff(data) {
        return request({
            url: this.baseUrl + this.uri + '/getPartners_staff',
            method: 'post',
            data: data,
        });
    }

    progressSendMail(data) {
        return request({
            url: this.baseUrl + this.uri + '/progressSendMail',
            method: 'post',
            data: data,
        });
    }

    chkMaintenanceId() {
        return request({
            url: this.baseUrl + this.uri + '/chkMaintenanceId',
            method: 'get',
        });
    }
    chkShopCode() {
        return request({
            url: this.baseUrl + this.uri + '/chkShopCode',
            method: 'get',
        });
    }
    chkpartner() {
        return request({
            url: this.baseUrl + this.uri + '/chkpartner',
            method: 'get',
        });
    }

    getStatusDeadline() {
        return request({
            url: this.baseUrl + this.uri + '/getStatusDeadline',
            method: 'get',
        });
    }


}

export { MaintenanceResource as default };