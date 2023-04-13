document.addEventListener('DOMContentLoaded', function() {


        // get the links and divs
        const unLink = document.getElementById('un-link');
        const deLink = document.getElementById('de-link');
        const tsLink = document.getElementById('ts-link');
        const arLink = document.getElementById('ar-link');
        const unDiv = document.getElementById('un');
        const deDiv = document.getElementById('de');
        const tsDiv = document.getElementById('ts');
        const arDiv = document.getElementById('ar');

        // show "الجامعات" div by default
        unDiv.style.display = 'grid';

        // add click event listeners to the links
        unLink.addEventListener('click', function (event) {
            event.preventDefault(); // prevent default link behavior
            unDiv.style.display = 'grid';
            deDiv.style.display = 'none';
            tsDiv.style.display = 'none';
            arDiv.style.display = 'none';
        });

        deLink.addEventListener('click', function (event) {
            event.preventDefault(); // prevent default link behavior
            deDiv.style.display = 'grid';
            unDiv.style.display = 'none';
            tsDiv.style.display = 'none';
            arDiv.style.display = 'none';
        });
        tsLink.addEventListener('click', function (event) {
            event.preventDefault(); // prevent default link behavior
            tsDiv.style.display = 'grid';
            unDiv.style.display = 'none';
            deDiv.style.display = 'none';
            arDiv.style.display = 'none';
        });
        arLink.addEventListener('click', function (event) {
            event.preventDefault(); // prevent default link behavior
            arDiv.style.display = 'grid';
            unDiv.style.display = 'none';
            deDiv.style.display = 'none';
            tsDiv.style.display = 'none';
        });

});
