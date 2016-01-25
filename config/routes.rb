Rails.application.routes.draw do
  scope module: :external do
    get :demos
    get :services
    get :contact
    post :submit_contact
    get :version
    get :thanks
  end

  get 'voiceovers', to: redirect('')

  root 'external#home'
end
