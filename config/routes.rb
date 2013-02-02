Gertka::Application.routes.draw do
  match "/settings"  => "home#settings"
  root :to => "home#index"
end
