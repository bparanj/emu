Rails.application.routes.draw do
  root to: 'products#index'
  # FUCK : XML FILES ARE BETTER!
  resources :products do
    collection do
      put :discontinue
    end
  end
end
