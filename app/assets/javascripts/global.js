// These functions get called on initial page visit and on turbolinks page changes
window.turbolinksReady = function () {
  return false;
};

// Runs once on the initial page visit when Turbolinks is not supported
window.initialLoadReady = function () {
  if (!Turbolinks.supported) { window.turbolinksReady(); }
};

$(document).ready(window.initialLoadReady);
$(document).on('turbolinks:load', window.turbolinksReady);
