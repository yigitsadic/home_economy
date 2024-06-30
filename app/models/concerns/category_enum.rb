module CategoryEnum
  extend ActiveSupport::Concern

  included do
    enum :category,
      income: "income",
      expense: "expense",
      investment: "investment",
      informatic: "informatic"
  end
end
