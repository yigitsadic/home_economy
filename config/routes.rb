Rails.application.routes.draw do
  root to: "dashboard#index"
  
  get "up" => "rails/health#show", as: :rails_health_check

  scope "events/months/:month_id", as: :month do
    get 'expenses', to: "events#expenses", as: "expense_list"
    get 'invesments', to: "events#investments", as: "investment_list"
  end

  resources :recurring_events
  resources :months, only: %i[index show]
end

