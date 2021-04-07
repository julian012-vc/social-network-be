Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reactions
      resources :posts
    end
  end
end
