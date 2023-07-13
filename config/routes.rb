Rails.application.routes.draw do
  root "articles#index"

  resources :articles, param: :slug do
    resources :comments
  end
end

