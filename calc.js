const buttons = document.querySelectorAll('.numbers');
const upperScreen = document.querySelector('.letterSmall');
const lowerScreen = document.querySelector('.letterBig');
const clear = document.querySelector('.clear');
const btnOperators = document.querySelectorAll('.operators');
const equal = document.querySelector('.equal');
let first, second, operationBefore = false, operation = '', opCalled = false;


/*
=================================================================================================================

                                            Event listeners
                        
=================================================================================================================
*/


clear.addEventListener('click', () => {
    lowerScreen.innerText = '';
    upperScreen.innerText = '';
})

equal.addEventListener('click', () => equals());

for (let e of btnOperators) {
    e.addEventListener('click', () => operatorCalculation(e));
}

for (let btn of buttons) {
    btn.addEventListener('click', () => writeNumber(btn));
}

/*
=================================================================================================================

                                            Functions
                        
=================================================================================================================
*/


function operatorCalculation(op) {
    first = lowerScreen.innerText * 1;
    operation = op.value;
    upperScreen.innerText = (first + " " + op.innerText);
    operationBefore = true;
    opCalled = true;
}

function equals() {
    let num;
    second = lowerScreen.innerText * 1;

    switch (operation) {
        case '+':
            num = first + second;
            lowerScreen.innerText = Math.round(num * 100) / 100;
            upperScreen.innerText += " " + second + " " + " = ";
            break;
        case '-':
            num = first - second;
            lowerScreen.innerText = Math.round(num * 100) / 100;
            upperScreen.innerText += " " + second + " " + " = ";
            break;
        case 'time':
            num = first * second;
            lowerScreen.innerText = Math.round(num * 100) / 100;
            upperScreen.innerText += " " + second + " " + " = ";
            break;
        case 'div':
            num = (first / second);
            lowerScreen.innerText = Math.round(num * 100) / 100;
            upperScreen.innerText += " " + second + " " + " = ";
            break;
    }
}

function writeNumber(e) {
    if (operationBefore) {
        lowerScreen.innerText = '';
    }
    lowerScreen.innerText += e.innerText;
    operationBefore = false;
}