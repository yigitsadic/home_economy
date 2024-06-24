require 'rails_helper'

RSpec.describe Month, type: :model do
  describe "validations" do
    subject { create(:month) }
    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:name).scoped_to(:year) }
  end
end

