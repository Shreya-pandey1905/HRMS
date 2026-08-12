(function () {
    function initTableSearch(input, table) {
        if (!input || !table) {
            return;
        }

        var tbody = table.tBodies[0];
        if (!tbody) {
            return;
        }

        var emptyRow = null;
        var noMatchRow = document.createElement('tr');
        noMatchRow.className = 'glass-no-match';
        noMatchRow.style.display = 'none';

        var colCount = table.tHead && table.tHead.rows[0]
            ? table.tHead.rows[0].cells.length
            : 1;

        var emptyCell = document.createElement('td');
        emptyCell.colSpan = colCount;
        emptyCell.className = 'glass-empty';
        emptyCell.textContent = 'No matching results found.';
        noMatchRow.appendChild(emptyCell);
        tbody.appendChild(noMatchRow);

        function isPlaceholderRow(row) {
            return row === noMatchRow
                || row.classList.contains('glass-no-match')
                || !!row.querySelector('.glass-empty');
        }

        function filterRows() {
            var query = (input.value || '').trim().toLowerCase();
            var visibleCount = 0;
            var dataRowCount = 0;

            Array.prototype.forEach.call(tbody.rows, function (row) {
                if (isPlaceholderRow(row)) {
                    if (row.querySelector('.glass-empty') && row !== noMatchRow) {
                        emptyRow = row;
                    }
                    return;
                }

                dataRowCount += 1;
                var text = (row.textContent || '').toLowerCase();
                var match = !query || text.indexOf(query) !== -1;
                row.style.display = match ? '' : 'none';
                if (match) {
                    visibleCount += 1;
                }
            });

            if (emptyRow) {
                emptyRow.style.display = dataRowCount === 0 && !query ? '' : 'none';
            }

            noMatchRow.style.display =
                dataRowCount > 0 && visibleCount === 0 ? '' : 'none';
        }

        input.addEventListener('input', filterRows);
        input.addEventListener('search', filterRows);
    }

    document.addEventListener('DOMContentLoaded', function () {
        var inputs = document.querySelectorAll('[data-table-search]');
        Array.prototype.forEach.call(inputs, function (input) {
            var selector = input.getAttribute('data-table-search');
            var table = selector ? document.querySelector(selector) : null;
            initTableSearch(input, table);
        });
    });
})();
