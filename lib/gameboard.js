const Player = function (name, icon) {
    return { name, icon };
}

const squares = document.querySelectorAll(".square")
const positions = [];

squares.forEach(e => {
    e.addEventListener('click', () => {
        if (positions.includes(e.id))
            return;
        positions.push(e.id);
        console.log(positions)

    })
})