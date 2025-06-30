function Validate(email) {
    const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    console.log("Forms.js caricato correttamente");
    return mailformat.test(email);
}

function setupCartaForm() {
    const numeroInput = document.getElementById("numero");
    const numeroWarning = document.getElementById("numero-warning");
    const cvvInput = document.getElementById("cvv");

    let typingTimer;

    if (numeroInput) {
        numeroInput.addEventListener("input", function (e) {
            clearTimeout(typingTimer);

            let value = e.target.value.replace(/\D/g, "");
            if (value.length > 16) value = value.slice(0, 16);

            let formatted = "";
            for (let i = 0; i < value.length; i++) {
                if (i > 0 && i % 4 === 0) formatted += " ";
                formatted += value[i];
            }

            e.target.value = formatted;

            numeroWarning.textContent = "";

            typingTimer = setTimeout(() => {
                if (value.length > 0 && value.length < 16) {
                    numeroWarning.textContent = "⚠️ Il numero della carta deve contenere 16 cifre.";
                }
            }, 1500);
        });

        numeroInput.addEventListener("blur", function () {
            const value = numeroInput.value.replace(/\D/g, "");
            if (value.length > 0 && value.length < 16) {
                numeroWarning.textContent = "⚠️ Il numero della carta deve contenere 16 cifre.";
            }
        });

        numeroInput.addEventListener("keydown", function (e) {
            const isControlKey = ['Backspace', 'ArrowLeft', 'ArrowRight', 'Delete', 'Tab'].includes(e.key);
            const rawValue = numeroInput.value.replace(/\D/g, "");
            const selection = window.getSelection().toString();

            if (!isControlKey && rawValue.length >= 16 && selection.length === 0) {
                e.preventDefault();
            }
        });
    }

    if (cvvInput) {
        cvvInput.addEventListener("input", function (e) {
            e.target.value = e.target.value.replace(/\D/g, "").slice(0, 3);
        });
    }
    
    const cvvWarning = document.getElementById("cvv-warning");

	if (cvvInput) {
	    cvvInput.addEventListener("input", function (e) {
	        e.target.value = e.target.value.replace(/\D/g, "").slice(0, 3);
	        if (cvvWarning) cvvWarning.textContent = "";
	
	        clearTimeout(typingTimer);
	        typingTimer = setTimeout(() => {
	            if (e.target.value.length > 0 && e.target.value.length < 3) {
	                cvvWarning.textContent = "⚠️ Il CVV deve contenere 3 cifre.";
	            }
	        }, 1500);
	    });
	
	    cvvInput.addEventListener("blur", function (e) {
	        const value = e.target.value;
	        if (value.length > 0 && value.length < 3) {
	            cvvWarning.textContent = "⚠️ Il CVV deve contenere 3 cifre.";
	        }
	    });
	}
	
	}

document.addEventListener("DOMContentLoaded", setupCartaForm);

function setupFormValidation() {
    const form = document.getElementById("form-aggiungi-carta");
    if (!form) return;

    const submitError = document.getElementById("submit-error");

    form.addEventListener("submit", function (e) {
        const warnings = form.querySelectorAll(".warning");
        let hasActiveWarnings = false;

        warnings.forEach((warning) => {
            if (warning.textContent.trim() !== "") {
                hasActiveWarnings = true;
            }
        });

        if (hasActiveWarnings) {
            e.preventDefault();

            // Mostra il messaggio d'errore
            submitError.textContent = "Errore nella sottomissione dei dati. Correggi gli input contrassegnati in giallo e riprova";
            submitError.style.display = "block";

            // opzionale: fai scroll in cima al messaggio d'errore
            submitError.scrollIntoView({ behavior: "smooth", block: "center" });
        } else {
        	const numeroInput = document.getElementById("numero");
	        if (numeroInput) {
	            numeroInput.value = numeroInput.value.replace(/\s+/g, '');
	        }
	        submitError.textContent = "";
	        submitError.style.display = "none";
    }
    });
}

