# frozen_string_literal: true

Rails.application.routes.draw do
  root 'external#home'

  scope module: :external do
    get :demos
    get :services
    get :contact
    post :submit_contact
    get :version
    get :thanks
  end

  get 'voiceovers', to: redirect('')
end
