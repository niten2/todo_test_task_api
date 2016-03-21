Rails.application.routes.draw do

  devise_for :users
  root "homes#index"

  namespace :api do
    namespace :v1 do
      resources :posts, defaults: { format: :json }
    end
  end

end
