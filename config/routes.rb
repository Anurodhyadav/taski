Rails.application.routes.draw do
  devise_for :users
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  get 'about', to: "pages#about"
  get 'contact', to: 'pages#contact' #This basically means when we go to /contact routes, it will map to contact method of pages controller.
  get 'blog', to: redirect("https://www.sql-practice.com/") #This redirects to external site when we hit the blog route


  resources :projects do 
    #we are creating a nesting routes in here. so the route to get task 1 of project 2 would be
    #project/2/task/1 

    resources :tasks, except: [:index], controller:'projects/tasks'    
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"   # This is the "/" route, it replaces the default rails welcome page
  get 'pagenotfound', to: "pages#pagenotfound"

  get "*path", to: redirect("/pagenotfound")
end
