# frozen_string_literal: true

require "application_system_test_case"

# Test external pages.
class ExternalTest < ApplicationSystemTestCase
  test "visit demos page" do
    visit demos_url
    assert_active_menu_item "DEMOS"
    screenshot("visit-demos-page")
  end

  test "visit services page" do
    visit services_url
    assert_active_menu_item "SERVICES"
    screenshot("visit-services-page")
  end

  test "visit clients page" do
    visit clients_url
    assert_active_menu_item "CLIENTS"
    screenshot("visit-clients-page")
  end

  test "visit contact page" do
    visit contact_url
    assert_active_menu_item "CONTACT"
    screenshot("visit-contact-page")
  end

  test "visit modern page" do
    visit modern_url
    assert_selector "h1", text: "Lisa Mueller is a professional voiceover artist"
    %w(demos services clients contact).each do |section|
      assert_selector "section##{section}"
    end
    screenshot("visit-modern-page")

    click_link "Services", match: :first
    assert_current_path(/#services\z/, url: true)
    screenshot("visit-modern-page-services")
  end

  test "visit modern page on a phone" do
    page.driver.browser.manage.window.resize_to(390, 844)
    visit modern_url
    assert_selector "nav a", text: /contact/i
    screenshot("visit-modern-page-mobile")
  end

  test "visit version page" do
    visit version_url
    assert_text "Version #{LoudAndLisa::VERSION::STRING}"
    screenshot("visit-version-page")
  end

  private

  # The menu is rendered twice (responsive layouts), so only one copy is visible.
  def assert_active_menu_item(label)
    assert_selector "ul.nav li.active a", text: label, minimum: 1, visible: :all
  end
end
