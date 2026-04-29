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
        return window.location.pathname.indexOf('/en/') !== -1;
    }

    function currentLang() {
        return isEnglish() ? 'en' : 'no';
    }

    function currentFilename() {
        var parts = window.location.pathname.split('/');
        return parts[parts.length - 1] || 'index.html';
    }

    function rootPrefix() {
        // From en/ pages, assets prefix is '../'; from root it is '' or './'
        // We derive the root by walking up from the current path
        if (isEnglish()) {
            var path = window.location.pathname;
            var enIndex = path.indexOf('/en/');
            return path.substring(0, enIndex + 1); // absolute path to root, e.g. /fhir/ig/lmdi/
        }
        var parts = window.location.pathname.split('/');
        parts.pop(); // remove filename
        return parts.join('/') + '/';
    }

    function switchToLang(lang) {
        var file = currentFilename();
        var root = rootPrefix();

        if (lang === 'en') {
            var target = KNOWN_PAGES.indexOf(file) !== -1 ? file : 'index.html';
            window.location.href = root + 'en/' + target;
        } else {
            if (isEnglish()) {
                var target2 = KNOWN_PAGES.indexOf(file) !== -1 ? file : 'index.html';
                window.location.href = root + target2;
            }
        }
    }

    function updateUI() {
        var lang = currentLang();

        // Update lang attribute for accessibility
        document.documentElement.lang = lang === 'en' ? 'en' : 'nb';

        // Update current label in dropdown button
        var label = document.getElementById('fhi-lang-current');
        if (label) {
            label.textContent = lang === 'en' ? 'EN' : 'NO';
        }

        // Show correct menu
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

        // Persist selection
        try { localStorage.setItem(STORAGE_KEY, lang); } catch (e) { /* ignore */ }
    }

    function initDropdown() {
        var btn = document.getElementById('fhi-lang-btn');
        var menu = document.getElementById('fhi-lang-menu');

        if (!btn || !menu) return;

        btn.addEventListener('click', function (e) {
            e.stopPropagation();
            var open = menu.classList.contains('open');
            menu.classList.toggle('open', !open);
            btn.setAttribute('aria-expanded', String(!open));
        });

        document.addEventListener('click', function () {
            menu.classList.remove('open');
            btn.setAttribute('aria-expanded', 'false');
        });

        var items = menu.querySelectorAll('a[data-lang]');
        items.forEach(function (item) {
            item.addEventListener('click', function (e) {
                e.preventDefault();
                var lang = item.getAttribute('data-lang');
                switchToLang(lang);
            });
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        updateUI();
        initDropdown();
    });
})();
