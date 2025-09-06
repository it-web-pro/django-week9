let typingTimer;
const doneTypingInterval = 500;

const searchInput = document.getElementById('search');

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
  window.location.href = url.toString();
}

if (searchInput) {
  searchInput.addEventListener('keyup', () => {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  searchInput.addEventListener('keydown', () => clearTimeout(typingTimer));
}
