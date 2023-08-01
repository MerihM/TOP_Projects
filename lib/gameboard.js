const Player = function (name, icon, id) {
    return { name, icon, id };
}
const p1 = Player('Player One', 'X', 1);
const p2 = Player('Player Two', 'O', 2);
let currP = p1;
const squares = document.querySelectorAll(".square")
const positions = [['k', 'k', 'k'], ['k', 'k', 'k'], ['k', 'k', 'k']];
const usedPositions = [];

squares.forEach(x => {
    x.addEventListener('click', clickEvent)
})

function clickEvent(x) {
    let e = x.srcElement
    if (usedPositions.includes(e.id))
        return;
    addToArray(e.id);
    e.innerHTML = currP.icon;
    checkWin(positions);
    switchPlayers();
}

let addToArray = (pos) => {
    switch (pos) {
        case '0':
        case '1':
        case '2':
            positions[0][pos] = currP.icon;
            usedPositions.push(pos);
            break;
        case '3':
        case '4':
        case '5':
            positions[1][pos - 3] = currP.icon;
            usedPositions.push(pos);
            break
        case '6':
        case '7':
        case '8':
            positions[2][pos - 6] = currP.icon;
            usedPositions.push(pos);
            break
    }
}

const switchPlayers = () => {
    if (currP == p1)
        currP = p2;
    else
        currP = p1;
}

const checkWin = (arr) => {
    arr.forEach(subArr => {
        if (horizontalWin(subArr))
            winMsg();
    })
    if (verticalWin(arr))
        winMsg();
    if (diagonalWin(arr))
        winMsg();
}

const horizontalWin = arr => {
    if (arr.includes('k'))
        return;
    return (arr[0] == arr[1] && arr[1] == arr[2] && arr[2] == arr[0]);
}

const verticalWin = arr => {
    for (let i = 0; i < 3; i++) {
        let notK = (arr[0][i] !== 'k' && arr[1][i] !== 'k' && arr[2][i] !== 'k');
        let same = (arr[0][i] == arr[1][i] && arr[2][i] == arr[1][i] && arr[0][i] == arr[2][i]);
        if (notK && same)
            return true;
    }
    return false
}

const diagonalWin = arr => {
    let leftNotK = (arr[0][0] !== 'k' && arr[1][1] !== 'k' && arr[2][2] !== 'k');
    let rightNotK = (arr[2][0] !== 'k' && arr[1][1] !== 'k' && arr[2][0] !== 'k');
    let leftDiag = (arr[0][0] == arr[1][1] && arr[2][2] == arr[1][1] && arr[0][0] == arr[2][2]);
    let rightDiag = (arr[0][2] == arr[1][1] && arr[2][0] == arr[1][1] && arr[0][2] == arr[2][0]);
    let left = (leftDiag && leftNotK);
    let right = (rightDiag && rightNotK);
    return (left || right);
}

const winMsg = () => {
    alert(`${currP.name} wins!!!`);
    squares.forEach(x => {
        x.removeEventListener('click', clickEvent);
    })

}