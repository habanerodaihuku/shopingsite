Rails.application.routes.draw do
  root to: 'fortunes#index'
  resources :fortunes, only: [:index]

  post "fortunes/result" => "fortunes#result"

end
