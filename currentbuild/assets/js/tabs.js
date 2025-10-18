/**
 * Bootstrap 5 compatible tab functionality for FHIR IG
 * Handles tab switching and URL hash navigation
 */

(function() {
  'use strict';

  // Initialize tabs when DOM is ready
  document.addEventListener('DOMContentLoaded', function() {
    initializeTabs();
    handleHashNavigation();
  });

  // Handle hash changes for deep linking
  window.addEventListener('hashchange', function() {
    handleHashNavigation();
  });

  /**
   * Initialize all tab navigation
   */
  function initializeTabs() {
    // Find all tab navigation links
    const tabLinks = document.querySelectorAll('[role="tablist"] a[data-toggle="tab"], [role="tablist"] a[data-bs-toggle="tab"], .nav-tabs a');

    tabLinks.forEach(function(tabLink) {
      tabLink.addEventListener('click', function(e) {
        e.preventDefault();
        activateTab(this);
      });
    });
  }

  /**
   * Activate a specific tab
   */
  function activateTab(tabLink) {
    // Get the target panel ID
    const targetId = tabLink.getAttribute('href');
    if (!targetId || targetId === '#') return;

    const targetPanel = document.querySelector(targetId);
    if (!targetPanel) return;

    // Find the tab list container
    const tabList = tabLink.closest('[role="tablist"], .nav-tabs');
    if (!tabList) return;

    // Deactivate all tabs in this group
    const allTabs = tabList.querySelectorAll('a');
    allTabs.forEach(function(tab) {
      tab.classList.remove('active');
      tab.setAttribute('aria-selected', 'false');
      tab.removeAttribute('aria-current');
    });

    // Activate the clicked tab
    tabLink.classList.add('active');
    tabLink.setAttribute('aria-selected', 'true');
    tabLink.setAttribute('aria-current', 'page');

    // Hide all tab panels in this group
    const firstPanel = document.querySelector(allTabs[0].getAttribute('href'));
    if (firstPanel && firstPanel.parentElement) {
      const panelContainer = firstPanel.parentElement;
      const allPanels = panelContainer.querySelectorAll('.tab-pane');
      allPanels.forEach(function(panel) {
        panel.classList.remove('active', 'show');
        panel.style.display = 'none';
      });
    }

    // Show the target panel
    targetPanel.classList.add('active', 'show');
    targetPanel.style.display = 'block';

    // Update URL hash without scrolling
    if (window.history && window.history.replaceState) {
      window.history.replaceState(null, null, targetId);
    } else {
      window.location.hash = targetId;
    }
  }

  /**
   * Handle hash navigation (e.g., when page loads with #tab-id)
   */
  function handleHashNavigation() {
    const hash = window.location.hash;
    if (!hash) return;

    // Find the tab link that corresponds to this hash
    const tabLink = document.querySelector('[role="tablist"] a[href="' + hash + '"], .nav-tabs a[href="' + hash + '"]');
    if (tabLink) {
      activateTab(tabLink);
    }
  }

  /**
   * Fallback: Auto-activate first tab if none are active
   */
  window.addEventListener('load', function() {
    const tabLists = document.querySelectorAll('[role="tablist"], .nav-tabs');

    tabLists.forEach(function(tabList) {
      const activeTabs = tabList.querySelectorAll('a.active');

      if (activeTabs.length === 0) {
        const firstTab = tabList.querySelector('a');
        if (firstTab) {
          activateTab(firstTab);
        }
      }
    });
  });

})();
