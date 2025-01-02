const gridDiv = document.querySelector('#gridContainer');
const radioButtons = document.querySelectorAll('input[name="size"]');


gridDiv.addEventListener('click', () => addHoverEffect());


function selectColor() {

}

function addHoverEffect() {
    let divSquare = document.querySelectorAll('.divSquare');
    divSquare.forEach(element => {
        element.addEventListener('mouseenter', () => element.style.cssText = 'background-color:red')
    })
}

radioButtons.forEach(element => {
    element.addEventListener('change', () => {
        deletePreviousGrid();
        resizeGrid(element.value);
        makeDivGrid(element.value);
    })
});

function makeDivGrid(size) {
    for (let i = 0; i < size * size; i++) {
        let gridSquare = document.createElement('div');
        gridSquare.classList.add('divSquare');
        gridDiv.append(gridSquare);
    }
}

function deletePreviousGrid() {
    let toDelete = document.querySelectorAll('.divSquare');
    toDelete.forEach(element => {
        element.remove();
    });
}

function resizeGrid(size) {
    gridDiv.style.cssText = `grid-template-columns:repeat(${size},1fr);grid-template-rows:repeat(${size},1fr);`;
}