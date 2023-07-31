const Player = function (name, icon) {
    return { name, icon };
}

const squares = document.querySelectorAll(".square")
const positions = [];

squares.forEach(e => {
    e.addEventListener('click', () => {
        positions.push(e.innerHTML);
        console.log(e.id);
        console.log(positions);
    })
})