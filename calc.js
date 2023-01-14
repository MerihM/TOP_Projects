const buttons = document.querySelectorAll('.numbers');
const upperScreen = document.querySelector('.letterSmall');
const lowerScreen = document.querySelector('.letterBig');
const clear = document.querySelector('.clear');
const btnOperators = document.querySelectorAll('.operators');
let first, second, operationBefore = false;

for (let e of btnOperators) {
    e.addEventListener('click', () => operatorCalculation(e));
}

function operatorCalculation(op) {
    if (!lowerScreen.innerText)
        return;
    console.log('I CALCULATE ' + op.innerText);
    if (!first)
        first = lowerScreen.innerText * 1;
    upperScreen.innerText = lowerScreen.innerText + ' ' + op.innerText;
    operationBefore = true;
    console.log(first);
}

function equals(nu1, nu2, operator) {
    switch (operator) {
        case 'div':
            return (nu1 / nu2);
        case 'time':
            return (nu1 * nu2);
        case '+':
            return (nu1 + nu2);
        case '-':
            return (nu1 - nu2);
        default:
            return;
    }
}

clear.addEventListener('click', () => {
    lowerScreen.innerText = '';
    upperScreen.innerText = '';
})

for (let btn of buttons) {
    btn.addEventListener('click', () => writeNumber(btn));
}

function writeNumber(e) {
    if (operationBefore) {
        lowerScreen.innerText = '';
    }
    lowerScreen.innerText += e.innerText;
    operationBefore = false;
}