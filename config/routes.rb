Rails.application.routes.draw do
  scope module: :application do
    get :demos
    get :services
    get :contact
    post :submit_contact
  end

  scope module: :external do
    get :version
  end

  root 'application#home'
end
