const buttons = document.querySelectorAll('.numbers');
const upperScreen = document.querySelector('.letterSmall');
const lowerScreen = document.querySelector('.letterBig');
const clear = document.querySelector('.clear');
const btnOperators = document.querySelectorAll('.operators');
const equal = document.querySelector('.equal');
let first, second, operationBefore = false, operation = '', operatorCalled = false;


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


function assignmentScreens(op) {
    operation = op.value;
    upperScreen.innerText = (first + " " + op.innerText);
    operationBefore = true;
    operatorCalled = true;
}

function operatorCalculation(op) {

    if (!operatorCalled) {
        first = lowerScreen.innerText * 1;
        assignmentScreens(op);
    }
    else {
        first = switchOperation();
        assignmentScreens(op);
    }
}

function switchOperation() {
    second = lowerScreen.innerText * 1;
    switch (operation) {
        case '+':
            return first + second;
        case '-':
            return first - second;
        case 'div':
            return first / second;
        case 'time':
            return (first * second);
    }
}

function equals() {
    let num = Math.round(switchOperation() * 100) / 100;

    if (!num) {
        lowerScreen.innerText = '';
        upperScreen.innerText = '';
        return;
    }

    lowerScreen.innerText = num;
    upperScreen.innerText += " " + second + " " + " = ";
    if (operatorCalled)
        operatorCalled = false;
}

function writeNumber(e) {
    if (operationBefore)
        lowerScreen.innerText = '';
    lowerScreen.innerText += e.innerText;
    operationBefore = false;
}