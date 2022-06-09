Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :tasks, only: [:index, :new, :create, :edit, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch '/categories/:category_id/tasks/:id', to: 'tasks#update', as: 'task'
end
