document.addEventListener('DOMContentLoaded', function() {
  initMobileMenu();
  initSearchModal();
  initCartDrawer();
  initCartFunctionality();
});

function initMobileMenu() {
  const menuToggle = document.querySelector('.mobile-menu-toggle');
  const mobileMenu = document.querySelector('.mobile-menu');
  const mobileMenuOverlay = document.querySelector('.mobile-menu-overlay');
  const menuClose = document.querySelector('.mobile-menu-close');

  if (menuToggle) {
    menuToggle.addEventListener('click', () => {
      mobileMenu.classList.add('active');
      mobileMenuOverlay.classList.add('active');
      document.body.style.overflow = 'hidden';
    });
  }

  function closeMobileMenu() {
    mobileMenu.classList.remove('active');
    mobileMenuOverlay.classList.remove('active');
    document.body.style.overflow = '';
  }

  if (menuClose) {
    menuClose.addEventListener('click', closeMobileMenu);
  }

  if (mobileMenuOverlay) {
    mobileMenuOverlay.addEventListener('click', closeMobileMenu);
  }

  const mobileMenuLinks = document.querySelectorAll('.mobile-menu a');
  mobileMenuLinks.forEach(link => {
    link.addEventListener('click', () => {
      setTimeout(closeMobileMenu, 300);
    });
  });
}

function initSearchModal() {
  const searchTrigger = document.querySelector('.search-trigger');
  const searchModal = document.querySelector('.search-modal');
  const searchClose = document.querySelector('.search-close');

  if (searchTrigger) {
    searchTrigger.addEventListener('click', () => {
      searchModal.classList.add('active');
      const searchInput = searchModal.querySelector('input[type="search"]');
      if (searchInput) {
        setTimeout(() => searchInput.focus(), 100);
      }
    });
  }

  function closeSearchModal() {
    searchModal.classList.remove('active');
  }

  if (searchClose) {
    searchClose.addEventListener('click', closeSearchModal);
  }

  if (searchModal) {
    searchModal.addEventListener('click', (e) => {
      if (e.target === searchModal) {
        closeSearchModal();
      }
    });
  }

  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && searchModal.classList.contains('active')) {
      closeSearchModal();
    }
  });
}

function initCartDrawer() {
  const cartTriggers = document.querySelectorAll('.cart-trigger');
  const cartDrawer = document.querySelector('.cart-drawer');
  const cartOverlay = document.querySelector('.cart-overlay');
  const cartClose = document.querySelectorAll('.cart-close');

  cartTriggers.forEach(trigger => {
    trigger.addEventListener('click', (e) => {
      e.preventDefault();
      openCart();
    });
  });

  function openCart() {
    cartDrawer.classList.add('active');
    cartOverlay.classList.add('active');
    document.body.style.overflow = 'hidden';
  }

  function closeCart() {
    cartDrawer.classList.remove('active');
    cartOverlay.classList.remove('active');
    document.body.style.overflow = '';
  }

  cartClose.forEach(btn => {
    btn.addEventListener('click', closeCart);
  });

  if (cartOverlay) {
    cartOverlay.addEventListener('click', closeCart);
  }

  window.openCart = openCart;
  window.closeCart = closeCart;
}

function initCartFunctionality() {
  document.addEventListener('click', async (e) => {
    if (e.target.classList.contains('cart-qty-btn')) {
      e.preventDefault();
      const line = e.target.dataset.line;
      const qty = parseInt(e.target.dataset.qty);

      if (qty === 0) {
        await removeFromCart(line);
      } else {
        await updateCartQuantity(line, qty);
      }
    }

    if (e.target.classList.contains('cart-remove-btn')) {
      e.preventDefault();
      const line = e.target.dataset.line;
      await removeFromCart(line);
    }
  });

  document.addEventListener('submit', async (e) => {
    if (e.target.matches('form[action*="/cart/add"]')) {
      e.preventDefault();
      const formData = new FormData(e.target);

      try {
        const response = await fetch('/cart/add.js', {
          method: 'POST',
          body: formData
        });

        if (response.ok) {
          await refreshCart();
          window.openCart();
        }
      } catch (error) {
        console.error('Error adding to cart:', error);
      }
    }
  });
}

async function updateCartQuantity(line, quantity) {
  try {
    const response = await fetch('/cart/change.js', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ line, quantity })
    });

    if (response.ok) {
      await refreshCart();
    }
  } catch (error) {
    console.error('Error updating cart:', error);
  }
}

async function removeFromCart(line) {
  await updateCartQuantity(line, 0);
}

async function refreshCart() {
  try {
    const response = await fetch('/cart?view=drawer');
    const html = await response.text();

    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');
    const newCartItems = doc.querySelector('#cart-items');
    const newCartSubtotal = doc.querySelector('#cart-subtotal');

    if (newCartItems) {
      document.querySelector('#cart-items').innerHTML = newCartItems.innerHTML;
    }

    if (newCartSubtotal) {
      document.querySelector('#cart-subtotal').textContent = newCartSubtotal.textContent;
    }

    const cartResponse = await fetch('/cart.js');
    const cart = await cartResponse.json();

    const cartCount = document.querySelector('[data-cart-count]');
    if (cartCount) {
      cartCount.textContent = cart.item_count;
    }

    const cartTitle = document.querySelector('.cart-drawer h2');
    if (cartTitle) {
      cartTitle.textContent = `Your Cart (${cart.item_count})`;
    }

    if (cart.item_count === 0) {
      const cartDrawerFooter = document.querySelector('.cart-drawer > div > div:last-child');
      if (cartDrawerFooter && cartDrawerFooter.querySelector('a[href="/checkout"]')) {
        cartDrawerFooter.style.display = 'none';
      }
    }

  } catch (error) {
    console.error('Error refreshing cart:', error);
  }
}

window.addEventListener('scroll', () => {
  const header = document.querySelector('.header');
  if (window.scrollY > 50) {
    header.style.backgroundColor = 'rgba(26, 26, 26, 0.98)';
  } else {
    header.style.backgroundColor = 'rgba(26, 26, 26, 0.95)';
  }
});
