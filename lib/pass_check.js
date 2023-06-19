const pass = document.querySelector('#pword');
const pass_conf = document.querySelector('#pword_conf');
let pass_arr = []

pass_conf.addEventListener('keyup', (e) => {
    console.log(pass_conf);
    if (pass.value == pass_conf.value) {
        pass_conf.classList.remove('invalid')
        pass_conf.classList.add('valid')
    }
});