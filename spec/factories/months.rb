FactoryBot.define do
  factory :month do
    name { I18n.t("date.month_names")[Date.current.month] }
    year { Date.current.year.to_s }
    full_name { "#{name}/#{year}" }

    trait :february do
      name { "February" }
      year { "2024" }
      full_name { "February/2024" }
    end

    trait :april do
      name { "April" }
      year { "2024" }
      full_name { "April/2024" }
    end
    
    trait :may do
      name { "May" }
      year { "2024" }
      full_name { "May/2024" }
    end
  end
end
