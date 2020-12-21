import Axios from 'axios';


const container = document.querySelector('.shopping-container');
const button = document.querySelector('#load-more');
const loadItemsPerBatch = 3;
let itemBatchesLoaded = 0;
let itemsLoaded = 0;

window.addEventListener('load', onLoaded);

function onLoaded() {
    initControls();
    getItems();
}

function initControls() {
    button.addEventListener('click', getItems);
}

function getItems() {
    const itemsToSkip = itemBatchesLoaded * loadItemsPerBatch;

    Axios.get(`http://localhost:8888/api/shopitems?skip=${itemsToSkip}&limit=${loadItemsPerBatch}`)
        .then(fillResult)
        .catch(err => console.log(err));
}

function fillResult(result) {
    const data = document.createElement('div');
    data.innerHTML = result.data;

    const totalItems = data.querySelector('#total-items').innerHTML;
    const shoppingItems = data.querySelectorAll('.shopping-item');

    shoppingItems.forEach(node => container.appendChild(node));
    
    itemBatchesLoaded++;
    itemsLoaded += loadItemsPerBatch;

    if(itemsLoaded >= totalItems) button.remove();
}