Rails.application.routes.draw do
  resources :messages do
    collection do
      post :confirm
    end
  end
  root to: 'messages#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
