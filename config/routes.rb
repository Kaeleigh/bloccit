Rails.application.routes.draw do
  resources :topics do
  # # called resources method and pass it thru symbol thus create post routes for creating, updating, viewing and deleting
  # does not get index view
    resources :posts, except: [:index]
  end

  # routes for new and create actions, only hash prevents unnecessary routes created
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'
  # # root view declares index, about route lets users vist about
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
