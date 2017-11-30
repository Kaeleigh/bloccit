Rails.application.routes.draw do
  resources :topics do
  # # called resources method and pass it thru symbol thus create post routes for creating, updating, viewing and deleting
  # does not get index view
    resources :posts, except: [:index]
  end

  # only used for specific routes
  resources :posts, only: [] do
      # route for comments with create and destroy actoon
      resources :comments, only: [:create, :destroy]
      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  # routes for new and create actions, only hash prevents unnecessary routes created
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
  # # root view declares index, about route lets users vist about
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
