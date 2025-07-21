window.onload = function() {
    const searchbox = document.getElementById("searchbox");
    const catalogo = document.getElementById("suggestions");


    searchbox.addEventListener("input", function () {
        const query = this.value.trim();

        if (query.length < 2) {
            catalogo.innerHTML = "";
            catalogo.style.display = "none"; 
            return;
        }

        fetch("/LimitedGames/search?searchbox=" + encodeURIComponent(query), {
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            }
        })
        .then(response => response.json())
        .then(data => {
            catalogo.innerHTML = "";

            if (data.length === 0) {
                catalogo.innerHTML = "<p><em>Nessun gioco trovato.</em></p>";
                catalogo.style.display = "block"; 
                return;
            }

            data.forEach(gioco => {
                const prezzo = parseFloat(gioco.prezzo) || 0;
                const sconto = parseFloat(gioco.sconto) || 0;
                const prezzoScontato = (prezzo - (prezzo * sconto / 100)).toFixed(2);
                
                const giocoHTML = `
                    	<div class="images">
                        <a href="/LimitedGames/ShowDetails?id=${gioco.id}">
                            <img src="/LimitedGames/images/${gioco.immagine}?v=${Date.now()}" alt="${gioco.titolo}">
                        </a>
                        ${gioco.titolo} ${gioco.edizione} Edition<br/>
                        ${sconto !== 0 ? `<s>${prezzo.toFixed(2)}</s>` : ""}
                        ${prezzoScontato} €<br/>
                    </div>
                `;
                catalogo.innerHTML += giocoHTML;
            });
            catalogo.style.display = "grid"; 
        })
        .catch(err => {
            console.error("Errore nella fetch:", err);
            catalogo.innerHTML = "<p><em>Errore nella ricerca.</em></p>";
            catalogo.style.display = "block";
        });
    });

    document.addEventListener("click", function(event) {
        if (!searchbox.contains(event.target) && !catalogo.contains(event.target)) {
            catalogo.style.display = "none";
        }
    });

};
