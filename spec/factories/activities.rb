FactoryBot.define do
  factory :activity do
    title { "Pizza Night" }
    recurring { false }
    day_of_month { 15 }
    financial_activity { true }
    amount { "35.99" }
    
    month
  end
end
