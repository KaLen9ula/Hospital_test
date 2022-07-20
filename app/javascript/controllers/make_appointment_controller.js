import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    greet(event) {

        $.ajax({
            url: '/appointments', beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            }, type: 'POST', data: {doctor_id:this.data.get("myValue")}
        });
    }
}
