function getComputerChoice() {
    let compChoice = Math.floor(Math.random() * 3) + 1;
    switch (compChoice) {
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