require 'rails_helper'

RSpec.describe RecurringEvent, type: :model do
  subject { build(:recurring_event) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:day_of_month) }
    it { should validate_inclusion_of(:day_of_month).in_array((1..31).to_a) }
  end
end

