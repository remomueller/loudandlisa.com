# frozen_string_literal: true

require "application_system_test_case"

# Test external pages.
class ExternalTest < ApplicationSystemTestCase
  test "visit demos page" do
    visit demos_url
    screenshot("visit-demos-page")
  end

  test "visit services page" do
    visit services_url
    screenshot("visit-services-page")
  end

  test "visit clients page" do
    visit clients_url
    screenshot("visit-clients-page")
  end

  test "visit contact page" do
    visit contact_url
    screenshot("visit-contact-page")
  end

  test "visit version page" do
    visit version_url
    screenshot("visit-version-page")
  end
end
