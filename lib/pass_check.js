const pass = document.querySelector('#pword');
const pass_conf = document.querySelector('#pword_conf');
const form = document.querySelector('#form_id')

pass_conf.addEventListener('keyup', (e) => {
    console.log(pass_conf);
    if (pass.value == pass_conf.value) {
        pass_conf.classList.remove('invalid')
        pass_conf.classList.add('valid')
    }
    else {
        pass_conf.classList.remove('valid')
        pass_conf.classList.add('invalid')
    }
});

function validateForm() {
    if (pass.value !== pass_conf.value) {
        alert("Passwords don't match")
        return false
    }
    return true
}