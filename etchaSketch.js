const gridDiv = document.querySelector('#gridContainer');


function makeDivGrid(size) {
    for (let i = 0; i < size; i++) {
        let gridSquare = document.createElement('div');
        gridSquare.classList.add('blackSquare');
        gridDiv.append(gridSquare);
    }
}

