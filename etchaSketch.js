const gridDiv = document.querySelector('#gridContainer');
const radioButtons = document.querySelectorAll('input[name="size"]');

radioButtons.forEach(element => {
    element.addEventListener('change', () => {
        //makeDivGrid(element.value);
    })
});


function makeDivGrid(size) {
    for (let i = 0; i < size; i++) {
        let gridSquare = document.createElement('div');
        gridSquare.classList.add('blackSquare');
        gridDiv.append(gridSquare);
    }
}

