FactoryBot.define do
  factory :recurring_event do
    name { "Lorem" }
    category { "expense" }
    day_of_month { 1 }
    financial_value { "1" }
  end
end

