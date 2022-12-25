
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
    console.log(playerLower);
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
            if (player === 'Scissors')
                return ('Lose!!! ' + outcomeOne);
            else
                return ('Win!!! ' + outcomeOne);
        }
        else if ((player === 'Paper' && computerSelection === 'Rock') || (player === 'Rock' && computerSelection === 'Paper')) {
            if (player === 'Rock')
                return ('Lose!!! ' + outcomeTwo);
            else
                return ('Win!!! ' + outcomeTwo);
        }
        else {
            if (player === 'Paper')
                return ('Lose!!! ' + outcomeThree);
            else
                return ('Win!!! ' + outcomeThree);
        }
    }
}