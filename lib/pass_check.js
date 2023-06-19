const pass = document.querySelector('#pword');
const pass_conf = document.querySelector('#pword_conf');
let pass_arr = []

console.log(pass.value);
console.log(pass_conf);
console.log('test')

pass_conf.addEventListener('keyup', (e) => {
    if (pass.value == pass_conf.value) {
        // pass_conf.classList.remove('invalid')
        // pass_conf.classList.add('valid')
        console.log(pass_conf);
    }
});