Rails.application.routes.draw do
  scope module: :external do
    get :demos
    get :services
    get :contact
    post :submit_contact
    get :version
  end

  root 'external#home'
end
