Rails.application.routes.draw do
  # #1 called resources method and pass it thry symbol thus create post routes for creating, updating, viewing and deleting
  resources :posts
  # #2 root view declares index, about route lets users vist about
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
