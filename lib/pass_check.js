const pass = document.querySelector('#pword');
const pass_conf = document.querySelector('#pword_conf');
let pass_arr = []

console.log(pass.value);
console.log(pass_conf);
console.log('test')

function printLog(aoe) {
    console.log(aoe)
}

pass.addEventListener('keyup', (e) => {
    pass_arr.push(e.key)
});