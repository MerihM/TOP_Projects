const buttons = document.querySelectorAll('.numbers');
const upperScreen = document.querySelector('.letterSmall');
const lowerScreen = document.querySelector('.letterBig');
const clear = document.querySelector('.clear');
const btnOperators = document.querySelectorAll('.operators');
const equal = document.querySelector('.equal');
let first, second, operationBefore = false, operation = '',
    operatorCalled = false, equalCalled = false, operationText = '', operationClick = false;


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
    console.log(op);
    operation = op.value;
    operationText = op.innerText;
    upperScreen.innerText = (first + " " + operationText);
    operationBefore = true;
    operatorCalled = true;
    equalCalled = false;
}

function operatorCalculation(op) {

    if (!operationClick) {
        if (!operatorCalled) {
            first = lowerScreen.innerText * 1;
            assignmentScreens(op);
        }
        else {
            first = switchOperation();
            assignmentScreens(op);
        }
    }
    operationClick = true;
}

function switchOperation() {
    if (!equalCalled)
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
    if (equalCalled) {
        upperScreen.innerText = lowerScreen.innerText + ' ' + operationText + ' ';
        first = num;
        num = Math.round(switchOperation() * 100) / 100;
    }
    lowerScreen.innerText = num;
    upperScreen.innerText += " " + second + " " + " = ";
    equalCalled = true;
    operatorCalled = false;
    operationClick = false;
}

function writeNumber(e) {
    if (operationBefore)
        lowerScreen.innerText = '';
    lowerScreen.innerText += e.innerText;
    operationBefore = false;
    operationClick = false;
}