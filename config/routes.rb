Gertka::Application.routes.draw do
  match "/settings"  => "home#settings"
  resources :stops, :only => [:index]
  root :to => "home#index"
end
