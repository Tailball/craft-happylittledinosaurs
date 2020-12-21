window.addEventListener('load', onLoaded);

function onLoaded() {
    try {
        const img = document.querySelector('.cta-preorder--image img');
        img.classList.add('active');
    }
    catch {}
}