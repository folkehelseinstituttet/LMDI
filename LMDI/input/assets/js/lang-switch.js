(function () {
    'use strict';

    var KNOWN_PAGES = [
        'index.html',
        'informasjonsmodell.html',
        'integrasjon.html',
        'protokoll.html',
        'SignertKryptertBundle.html',
        'nedlastinger.html',
        'profiler.html',
        'eksempelkode_cs.html',
        'eksempelkode_ps1.html'
    ];

    var STORAGE_KEY = 'lmdi-lang';

    function isEnglish() {
        return currentFilename().indexOf('en-') === 0;
    }

    function currentLang() {
        return isEnglish() ? 'en' : 'no';
    }

    function currentFilename() {
        var parts = window.location.pathname.split('/');
        return parts[parts.length - 1] || 'index.html';
    }

    function rootPrefix() {
        var parts = window.location.pathname.split('/');
        parts.pop(); // remove filename
        return parts.join('/') + '/';
    }

    function switchToLang(lang) {
        var file = currentFilename();
        var root = rootPrefix();

        if (lang === 'en') {
            if (!isEnglish()) {
                var target = KNOWN_PAGES.indexOf(file) !== -1 ? file : 'index.html';
                window.location.href = root + 'en-' + target;
            }
        } else {
            if (isEnglish()) {
                var noFile = file.replace(/^en-/, '');
                var target2 = KNOWN_PAGES.indexOf(noFile) !== -1 ? noFile : 'index.html';
                window.location.href = root + target2;
            }
        }
    }

    function updateUI() {
        var lang = currentLang();

        document.documentElement.lang = lang === 'en' ? 'en' : 'nb';

        var select = document.getElementById('fhi-lang-select');
        if (select) {
            select.value = lang;
        }

        var menuNo = document.getElementById('menu-no');
        var menuEn = document.getElementById('menu-en');
        if (menuNo && menuEn) {
            if (lang === 'en') {
                menuNo.style.display = 'none';
                menuEn.style.display = '';
            } else {
                menuNo.style.display = '';
                menuEn.style.display = 'none';
            }
        }

        try { localStorage.setItem(STORAGE_KEY, lang); } catch (e) { /* ignore */ }
    }

    function initSelect() {
        var select = document.getElementById('fhi-lang-select');
        if (!select) return;

        select.addEventListener('change', function () {
            switchToLang(this.value);
        });
    }

    // Script loads at bottom of <body> – DOM is already ready, no need to wait
    updateUI();
    initSelect();
})();
