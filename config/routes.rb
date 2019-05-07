# frozen_string_literal: true

Rails.application.routes.draw do
  root "external#demos"

  scope module: :external do
    get :demos
    get :services
    get :clients
    get :contact
    post :submit_contact, path: "contact"
    get :version
    get :thanks
  end

  get "voiceovers", to: redirect("")
end
