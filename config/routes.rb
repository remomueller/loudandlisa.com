Rails.application.routes.draw do

  scope module: 'application' do
    get :demos
    get :services
    get :contact
    post :submit_contact
  end

  root 'application#home'

end
