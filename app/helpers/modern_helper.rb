# frozen_string_literal: true

# Inline SVG icons and small helpers for the modern landing page.
module ModernHelper
  ICONS = {
    arrow: '<path d="M5 12h14M13 6l6 6-6 6"/>',
    mic: '<rect x="9" y="3" width="6" height="11" rx="3"/><path d="M5 11a7 7 0 0 0 14 0M12 18v3M9 21h6"/>',
    tag: '<path d="M3 3h8.2a1 1 0 0 1 .7.3l9 9a1 1 0 0 1 0 1.4l-7.2 7.2a1 1 0 0 1-1.4 0l-9-9a1 1 0 0 1-.3-.7V3z"/><circle cx="7.5" cy="7.5" r="1.25"/>',
    wave: '<path d="M3 12h1M7 8v8M11 4v16M15 7v10M19 10v4M22 12h-1"/>',
    pen: '<path d="M4 20l1-4L16.5 4.5a2.1 2.1 0 0 1 3 3L8 19l-4 1z"/><path d="M14 7l3 3"/>',
    download: '<path d="M12 4v11M7 11l5 5 5-5M5 20h14"/>',
    clock: '<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>',
    phone: '<path d="M5 4h4l2 5-2.5 1.5a11 11 0 0 0 5 5L15 13l5 2v4a2 2 0 0 1-2 2A16 16 0 0 1 3 6a2 2 0 0 1 2-2z"/>'
  }.freeze

  # Decorative inline SVG icon drawn with the current text color.
  def modern_icon(name, size: 24)
    tag.svg(
      ICONS.fetch(name).html_safe,
      xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24", width: size, height: size,
      fill: "none", stroke: "currentColor", "stroke-width": 1.75,
      "stroke-linecap": "round", "stroke-linejoin": "round", "aria-hidden": "true", focusable: "false"
    )
  end

  # "johnson-and-johnson-logo.jpg" => "Johnson And Johnson"
  def client_logo_name(file)
    file.sub(/-logo\.\w+\z/, "").tr("-", " ").split.map(&:capitalize).join(" ")
  end
end
