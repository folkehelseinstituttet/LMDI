// Språkvelger for LMDI IG.
// All tilgjengelighet/disabled-state er allerede beregnet server-side via Liquid.
// Denne handleren navigerer kun til data-href på valgt option.
(function () {
    function init() {
        var sel = document.getElementById("lang-switcher");
        if (!sel) return;
        sel.addEventListener("change", function (e) {
            var opt = e.target.selectedOptions && e.target.selectedOptions[0];
            var href = opt && opt.getAttribute("data-href");
            if (href) {
                window.location.href = href;
            } else {
                // Ingen target -> revert til opprinnelig valg
                var preselected = sel.querySelector("option[selected]");
                if (preselected) sel.value = preselected.value;
            }
        });
    }
    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", init);
    } else {
        init();
    }
})();
