Rails.application.routes.draw do

  resources :categories do
    resources :posts
  end

  resources :comments

  root "categories#index"
end
