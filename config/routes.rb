Rails.application.routes.draw do
  root to: "dashboard#index"
  
  get "up" => "rails/health#show", as: :rails_health_check

  scope "months/:month_id", as: :month do
    get 'events/expenses'
    get 'events/invesments'
  end

  resources :recurring_events
end

