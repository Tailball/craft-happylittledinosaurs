window.addEventListener('load', onLoaded);

function onLoaded() {
    console.log('loaded!');

    const img = document.querySelector('.cta-preorder--image img');
    img.classList.add('active');
}