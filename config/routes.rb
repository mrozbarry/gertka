Gertka::Application.routes.draw do
  resources :stops, :only => [:index]

  root :to => "home#index"
end
