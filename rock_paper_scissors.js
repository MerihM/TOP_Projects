const btnSelection = document.querySelectorAll('button');
const scorePlayer = document.querySelector('#scorePlayer');
const scoreComputer = document.querySelector('#scoreComputer');
let resComp = 0, resPla = 0;


// Event for button click, get result of rock-paper-scissors game, announces winner when someone gets to 5 points


btnSelection.forEach(btn => {
    btn.addEventListener('click', (e) => {
        let choicePla = btn.getAttribute('name') * 1;
        playGame(choicePla, getComputer());
        if ((resComp === 5) || (resPla === 5))
            announceWinner();
        scoreComputer.innerText = resComp;
        scorePlayer.innerText = resPla;
    })
})


// Function that plays round of rock-paper-scissors, and adjusts result


function playGame(player, computer) {
    let lower = Math.min(player, computer), higher = Math.max(player, computer);

    if (player === computer) {
        console.log('Draw');
        return;
    }
    if ((higher - lower) !== 2) {
        if (player > computer) {
            resPla++;
            console.log('Player wins');
        }
        else {
            resComp++;
            console.log('Computer wins');
        }
    }
    else {
        if (player === 0) {
            resPla++;
            console.log('Player wins');
        }
        else {
            resComp++;
            console.log('Computer wins');
        }
    }
}


//Function that returns computer choice for rock-paper-scissors game


function getComputer() {
    return Math.floor(Math.random() * 3);
}


// Function that announces winner and resets score to 0


function announceWinner() {
    if (resComp === 5)
        alert('COMPUTER WINS');
    else
        alert('PLAYER WINS');
    resComp = resPla = 0;
}