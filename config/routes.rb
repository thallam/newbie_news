Rails.application.routes.draw do


  devise_for :users
resources :topics do
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy, :index]
  end

end

  get 'about' => 'welcome#about'

root to: 'welcome#index'
end
