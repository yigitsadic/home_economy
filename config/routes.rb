Rails.application.routes.draw do
  root to: "dashboard#index"
  
  get "up" => "rails/health#show", as: :rails_health_check
end

