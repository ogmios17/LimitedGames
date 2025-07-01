document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("form[action='./AggiungiGioco']");
    
    form.addEventListener("submit", function(e) {
        e.preventDefault();

        const formData = new FormData(this);
        const urlEncodedData = new URLSearchParams(formData).toString();

        fetch(this.action, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: urlEncodedData
        })
        .then(response => {
            if (!response.ok) throw new Error("Errore durante l'aggiunta");
            return response.text();
        })
        .then(() => {
            window.scrollTo({ top: 0, behavior: "smooth" });

            const cartCount = document.getElementById("cart-count");
            let current = parseInt(cartCount.textContent || "0");
            const aggiunti = parseInt(formData.get("quantita")) || 1;
            const nuovoTotale = current + aggiunti;

            cartCount.textContent = nuovoTotale;
            cartCount.style.display = "inline-block";

            cartCount.style.animation = "none";
            void cartCount.offsetWidth; // forza il reflow
            cartCount.style.animation = "bounce 0.3s ease";
        })
        .catch(err => {
            alert("Errore durante l'aggiunta al carrello.");
            console.error(err);
        });
    });
});


