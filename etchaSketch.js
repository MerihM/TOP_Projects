const gridDiv = document.querySelector('#gridContainer');
const radioButtons = document.querySelectorAll('input[name="size"]');

radioButtons.forEach(element => {
    element.addEventListener('change', () => {
        deletePreviousGrid(element.value);
        makeDivGrid(element.value);
    })
});


function makeDivGrid(size) {
    for (let i = 0; i < size; i++) {
        let gridSquare = document.createElement('div');
        gridSquare.classList.add('blackSquare');
        gridDiv.append(gridSquare);
    }
}

function deletePreviousGrid(size) {
    let toDelete = document.querySelectorAll('.blackSquare');
    toDelete.forEach(element => element.remove());
}