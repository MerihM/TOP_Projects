const buttons = document.querySelectorAll('.numbers');
const upperScreen = document.querySelector('.letterSmall');
const lowerScreen = document.querySelector('.letterBig');
const clear = document.querySelector('.clear');

clear.addEventListener('click', () => {
    lowerScreen.innerText = '';
    upperScreen.innerText = '';
})

for (let btn of buttons) {
    btn.addEventListener('click', () => writeNumber(btn));
}

function writeNumber(e) {
    upperScreen.innerText += e.innerText;
    lowerScreen.innerText = e.innerText;
    // console.log(e.innerText);
}