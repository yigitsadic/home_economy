FactoryBot.define do
  factory :event do
    name { "Rent" }
    description { "Monthly rent" }
    category { "expense" }
    event_date { "2024-06-29" }
    event_type { "recurring" }
    financial_value { "9.99" }
    
    month
  end
end
