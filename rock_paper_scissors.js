
// Function that returns computer choice

function getComputerChoice() {
    let compChoice = Math.floor(Math.random() * 3) + 1;
    return choiceName(compChoice);
}

// Function that returns name of choice as a string

function choiceName(num) {
    switch (num) {
        case 1:
            return 'Rock';
        case 2:
            return 'Paper';
        case 3:
            return 'Scissors';
        default:
            return 'Error';
    }
}

// Function that plays one round of Rock-Paper-Scissors

function playOneRound(playerSelection, computerSelection) {

    let player, playerLower = playerSelection.toLowerCase();
    if (playerLower === 'rock')
        player = choiceName(1);
    else if (playerLower === 'paper')
        player = choiceName(2);
    else
        player = choiceName(3);

    const outcomeOne = 'Rock beats Scissors', outcomeTwo = 'Paper beats Rock', outcomeThree = 'Scissors beat Paper';

    // TODO optimize logic, conditions too long
    // IDEA: Compare numbers, that will be easier
    if (player === computerSelection)
        return 'Draw!!!';
    else {
        if ((player === 'Scissors' && computerSelection === 'Rock') || (player === 'Rock' && computerSelection === 'Scissors')) {
            if (player === 'Scissors') {
                console.log('Lose!!! ' + outcomeOne);
                return 1;
            }

            else {
                console.log('Win!!! ' + outcomeOne);
                return -1;
            }

        }
        else if ((player === 'Paper' && computerSelection === 'Rock') || (player === 'Rock' && computerSelection === 'Paper')) {
            if (player === 'Rock') {
                console.log('Lose!!! ' + outcomeTwo);
                return 1;
            }

            else {
                console.log('Win!!! ' + outcomeTwo);
                return -1;
            }

        }
        else {
            if (player === 'Paper') {
                console.log('Lose!!! ' + outcomeThree);
                return 1;
            }

            else {
                console.log('Win!!! ' + outcomeThree);
                return -1;
            }

        }
    }
}


function game(playerChoice) {

    let result = 0;
    for (let i = 0; i < 5; i++)
        result += playOneRound(playerChoice, getComputerChoice());

    let resultPlayer, resultComputer;
    if (result > 0)
        console.log(`Player wins with score ${resultPlayer} - ${resultComputer}`);
    else
        console.log(`Computer wins with score ${resultComputer} - ${resultPlayer}`);
}