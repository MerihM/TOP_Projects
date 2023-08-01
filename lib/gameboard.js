const Player = function (name, icon, id) {
    return { name, icon, id };
}
const p1 = Player('Player One', 'X', 1);
const p2 = Player('Player Two', 'O', 2);
let currP = p1;
const squares = document.querySelectorAll(".square")
const positions = [['k', 'k', 'k'], ['k', 'k', 'k'], ['k', 'k', 'k']];
const usedPositions = [];

squares.forEach(e => {
    e.addEventListener('click', () => {
        if (usedPositions.includes(e.id))
            return;
        addToArray(e.id);
        e.innerHTML = currP.icon;
        checkWin(positions);
        switchPlayers();
        console.log(positions)

    })
})

const addToArray = (pos) => {
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
            alert(`${currP.name} wins!!!`);
    })
    if (verticalWin(arr))
        alert(`${currP.name} wins!!!`)
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