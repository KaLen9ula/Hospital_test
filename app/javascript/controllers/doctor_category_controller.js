import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    greet(event) {
        $.ajax({
            url: this.data.get("myValue"), beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            }, type: 'POST', data: {id:$("#id option:checked").val() }

        });
    }
    clear(event){
        document.getElementById('show-doctors').innerHTML = ''
        $('#id option[value=""]').prop('selected', true)
    }
}
