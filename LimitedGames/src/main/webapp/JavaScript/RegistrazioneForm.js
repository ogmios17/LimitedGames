
    function Validate(email) {
        const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        return mailformat.test(email);
    }

    document.addEventListener("DOMContentLoaded", function () {
        const capInput = document.getElementById("cap");
        const capWarning = document.getElementById("cap-warning");
        const emailInput = document.getElementById("email");
        const emailWarning = document.getElementById("email-warning");
        const submitError = document.getElementById("submit-error");

        let capTimer;

        if (capInput) {
            capInput.addEventListener("input", function (e) {
                capWarning.textContent = "";
                e.target.value = e.target.value.replace(/\D/g, "").slice(0, 5);

                clearTimeout(capTimer);
                capTimer = setTimeout(() => {
                    if (e.target.value.length > 0 && e.target.value.length < 5) {
                        capWarning.textContent = "⚠️ Il CAP deve contenere esattamente 5 cifre.";
                        capInput.style.borderColor = "red";
                    } else {
                        capInput.style.borderColor = "";
                    }
                }, 800);
            });

            capInput.addEventListener("blur", function () {
                const value = capInput.value;
                if (value.length > 0 && value.length < 5) {
                    capWarning.textContent = "⚠️ Il CAP deve contenere esattamente 5 cifre.";
                    capInput.style.borderColor = "red";
                } else {
                    capInput.style.borderColor = "";
                }
            });
        }

        document.getElementById('registerForm').addEventListener('submit', function (event) {
            const emailValue = emailInput.value;
            const capValue = capInput.value;

            emailWarning.textContent = "";
            capWarning.textContent = "";
            submitError.textContent = "";
            submitError.style.display = "none";

            let hasError = false;

            if (!Validate(emailValue)) {
                emailWarning.textContent = "⚠️ L'indirizzo email non è valido. Inserisci un'email formattata correttamente.";
                emailInput.style.borderColor = "red";
                hasError = true;
            }

            if (capValue.length !== 5) {
                capWarning.textContent = "⚠️ Il CAP deve contenere esattamente 5 cifre.";
                capInput.style.borderColor = "red";
                hasError = true;
            }

            if (hasError) {
                event.preventDefault();
                submitError.textContent = "⚠️ Ci sono errori nei campi del modulo. Correggili prima di procedere.";
                submitError.style.display = "block";
                submitError.scrollIntoView({ behavior: "smooth", block: "center" });
            }
        });
    });

