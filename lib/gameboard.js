const Player = function (name, icon, id) {
    return { name, icon, id };
}
const p1 = Player('Jeff', 'X', 1);
const p2 = Player('Jorge', 'O', 2);
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