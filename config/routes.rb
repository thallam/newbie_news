Rails.application.routes.draw do


  devise_for :users
resources :topics do
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy, :index]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

end

  get 'about' => 'welcome#about'

root to: 'welcome#index'
end
