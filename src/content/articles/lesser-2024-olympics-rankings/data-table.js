(() => {
    const PARENT_ID = 'data-table';
    const DATA_URL = 'data.json';

    const FORMATTERS = {
        plain: (val) => val.toString(),
        digitsep: (val) => val.toLocaleString(),
        inverse: (val) => (val > 0) ? `1/${Math.round(1 / val).toLocaleString()}` : '\u2014'
    };

    const COL_DEFS = [
        // data obj key   heading text     class  number formatter
        ['country',       'Country',       'l',   FORMATTERS.plain],
        ['population',    'Population',    'r',   FORMATTERS.digitsep],
        ['competitors',   'Competitors',   'r',   FORMATTERS.plain],
        ['participation', 'Participation', 'r',   FORMATTERS.inverse],
        ['gold',          'Gold',          'r',   FORMATTERS.plain],
        ['g_population',  'Gold/Pop',      'r',   FORMATTERS.inverse],
        ['g_competitors', 'Gold/Comp',     'r',   FORMATTERS.inverse],
        ['silver',        'Silver',        'r',   FORMATTERS.plain],
        ['bronze',        'Bronze',        'r',   FORMATTERS.plain],
        ['total',         'Total',         'r',   FORMATTERS.plain],
        ['t_population',  'Tot/Pop',       'r',   FORMATTERS.inverse],
        ['t_competitors', 'Tot/Comp',      'r',   FORMATTERS.inverse]
    ];

    const sourceData = [];
    let sortCol = 0;
    let sortAscending = true;

    addEventListener('load', () => {
        const parent = document.getElementById(PARENT_ID);
        const xhr = new XMLHttpRequest();

        xhr.open('GET', DATA_URL, true);
        xhr.responseType = 'json';
        xhr.onload = () => {
            if (xhr.status !== 200) {
                parent.innerHTML = "[the table would've gone here, if the data had loaded]";
                return;
            }

            for (const obj of xhr.response) {
                const totalMedals = obj.gold + obj.silver + obj.bronze;

                sourceData.push({
                    ...obj,
                    total: totalMedals,
                    participation: obj.competitors / obj.population,
                    g_population: obj.gold / obj.population,
                    g_competitors: obj.gold / obj.competitors,
                    t_population: totalMedals / obj.population,
                    t_competitors: totalMedals / obj.competitors
                });
            }

            updateTable(parent);

            parent.addEventListener('click', (e) => {
                if (e.target.nodeName.toUpperCase() !== 'TH') return;

                if (sortCol === e.target.cellIndex) {
                    sortAscending = !sortAscending;
                } else {
                    sortCol = e.target.cellIndex;
                    sortAscending = true;
                }

                updateTable(parent);
            });
        };

        xhr.send();
    });

    function sortedSourceData(key, ascending) {
        return sourceData.toSorted((a, b) => {
            let res = 0;

            if (a[key] < b[key]) {
                res = -1;
            } else if (a[key] > b[key]) {
                res = 1;
            }

            return ascending ? res : -res;
        });
    }

    function updateTable(parent) {
        const data = sortedSourceData(COL_DEFS[sortCol][0], sortAscending);
        const table = document.createElement('table');

        let tr = table.insertRow();
        for (const [i, [ , text, className, ]] of COL_DEFS.entries()) {
            let indicator = '';
            if (i === sortCol) {
                indicator = ' ' + (sortAscending ? '\u2193' : '\u2191');
            }

            const th = tr.insertCell();
            th.outerHTML = `<th class="${className}">${text}${indicator}</th>`;
        }

        for (const obj of data) {
            tr = table.insertRow();
            for (const [key, , className, formatter] of COL_DEFS) {
                const td = tr.insertCell();
                td.innerText = formatter(obj[key]);
                td.className = className;
            }
        }

        parent.innerHTML = '';
        parent.appendChild(table);
    }
})();
