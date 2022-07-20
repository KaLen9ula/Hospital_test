import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    greet(event) {
        let patient_id = this.data.get("myValue")
        let value = $(`#${patient_id} textarea`).val()
        $.ajax({
            url: '/recommendations', beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            }, type: 'POST', data: {patient_id:this.data.get("myValue"),recommendation:value,doctor_id:this.data.get("myValue2")}
        });
        $(`#${patient_id} `).html('')
    }
}
