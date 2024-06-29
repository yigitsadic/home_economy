class Month < ApplicationRecord
  validates :name, :year, presence: true
  validates :name, uniqueness: { scope: :year }
end

