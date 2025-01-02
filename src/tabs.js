import data from './menu.json5';
export function createTabList() {
    const tabDiv = document.createElement('div');
    const cities = { 'Starter dishes': 'starters', 'Soups & Salads': 'sosa', 'Main dishes': 'main', 'Desserts': 'desserts', 'Drinks': 'drinks' };
    tabDiv.classList.add('tab');
    for (let city in cities) {
        let tempBtn = document.createElement('button');
        tempBtn.classList.add('tablinks');
        tempBtn.innerText = city;
        tempBtn.id = cities[city]
        tabDiv.appendChild(tempBtn);
    }
    return tabDiv;
}

export function addTabContent() {
    const tablinks = document.querySelectorAll(".tablinks");
    let date = new Date().getDay().toString();
    let cousineDay = { '1': 'Italy', '2': 'Kenya', '3': 'France', '4': 'Mexico', '5': 'Hawaii', '6': 'Japan', '0': 'Balkans' }
    let tempData = data.hasMenu.hasMenuSection[0][cousineDay[date]];
    return makeCard(tempData);
}

export function openTab(tab) {
    const tablinks = document.getElementsByClassName("tablinks");
    const tabcontent = document.querySelectorAll('.tabcontent');
    for (let e of tablinks)
        e.classList.remove('active');
    tab.srcElement.classList.add('active');
    for (let cont of tabcontent) {
        cont.style.display = 'none';
        if ((tab.srcElement.id) == cont.id)
            cont.style.display = 'flex'
    }
}
function makeCard(data) {
    let allContent = document.createElement('div');
    for (let items of data) {
        let allCards = document.createElement('div');
        allCards.style.display = 'none'
        allCards.classList.add('allCards', 'tabcontent');
        allCards.id = items.id;
        let menuTitle = document.createElement('div');
        menuTitle.classList.add('menuTitle');
        menuTitle.innerText = items.name;
        allCards.appendChild(menuTitle);
        for (let i = 1; i < 11; i++) {
            let item = items.MenuItems[`item${i}`]
            let card = document.createElement('div');
            let title = document.createElement('h3');
            let description = document.createElement('p');
            let priceContainer = document.createElement('div');
            let priceText = document.createElement('span');
            let price = document.createElement('span');
            card.classList.add('card');
            title.classList.add('title');
            description.classList.add('description');
            priceContainer.classList.add('priceContainer');
            priceText.classList.add('priceText');
            price.classList.add('price');
            title.innerText = item.name;
            description.innerText = item.description;
            priceText.innerText = 'Price';
            price.innerText = item.offers.price + "$";
            priceContainer.appendChild(priceText);
            priceContainer.appendChild(price);
            card.appendChild(title);
            card.appendChild(description);
            card.appendChild(priceContainer);
            allCards.appendChild(card);
        }
        allContent.appendChild(allCards);
    }
    return allContent;
}