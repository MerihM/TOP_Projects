const Player = function (name, icon) {
    return { name, icon };
}

const squares = document.querySelectorAll(".square")
const positions = [];

squares.forEach(e => {
    e.addEventListener('click', () => {
        positions.push(e.value);
        console.log(positions);
    })
})