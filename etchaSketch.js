const gridDiv = document.querySelector('#gridContainer');
const radioButtons = document.querySelectorAll('input[name="size"]');

radioButtons.forEach(element => {
    element.addEventListener('change', () => {
        deletePreviousGrid();
        resizeGrid(element.value);
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

function deletePreviousGrid() {
    let toDelete = document.querySelectorAll('.blackSquare');
    toDelete.forEach(element => element.remove());
}

function resizeGrid(size) {
    gridDiv.style.cssText = `grid-template-columns:repeat(${size},1fr);grid-template-rows:repeat(${size},1fr);`;
}