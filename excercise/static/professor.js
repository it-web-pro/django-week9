let typingTimer;
const doneTypingInterval = 500;

const searchInput = document.getElementById('search');
const filterField = document.getElementsByName('a_filter');

if (searchInput && searchInput.value !== '') {
  const endPosition = searchInput.value.length;
  searchInput.setSelectionRange(endPosition, endPosition);
}

function doneTyping() {
  const url = new URL(window.location.href);
  const q = searchInput ? searchInput.value.trim() : '';
  if (q) {
    url.searchParams.set('search', q);
  } else {
    url.searchParams.delete('search');
  }
  if (filterField && filterField.length) {
    const chosen = Array.from(filterField).find(el => el.checked || el.selected);
    if (chosen && chosen.value) url.searchParams.set('filter', chosen.value);
    else url.searchParams.set('filter', '');
  }
  window.location.href = url.toString();
}

if (searchInput) {
  searchInput.addEventListener('keyup', () => {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  searchInput.addEventListener('keydown', () => clearTimeout(typingTimer));
}
