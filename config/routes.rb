Gertka::Application.routes.draw do
  match "/settings"  => "home#settings"
  match "/updates" => "home#updates"
  resources :stops, :only => [:index]
  root :to => "home#index"
end
