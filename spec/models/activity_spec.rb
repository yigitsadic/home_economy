require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "validations" do
    subject { build(:activity) }
    
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:day_of_month) }
    it { should validate_inclusion_of(:day_of_month).in_array((1..31).to_a) }

    describe "day_of_month respects year" do
      let(:activity) { build(:activity) }
      
      context "february" do
        before { activity.month = build(:month, :february) }
        
        it "does not accept 29 for 2025" do
          a = build(:activity, month: build(:month, :february, year: "2025"))
          a.day_of_month = 29

          expect(a).not_to be_valid
        end
        
        it "accepts 29 for 2024" do
          activity.day_of_month = 29
          expect(activity).to be_valid
        end
        
        it "never accepts 30" do
          activity.day_of_month = 30
          expect(activity).not_to be_valid
        end
      end

      context "april" do
        before { activity.month = build(:month, :april) }

        it "accepts 30" do
          activity.day_of_month = 30
          expect(activity).to be_valid
        end

        it "does not accept 31" do
          activity.day_of_month = 31
          expect(activity).not_to be_valid
        end
      end

      context "may" do
        before { activity.month = build(:month, :may) }

        it "accepts 30" do
          activity.day_of_month = 30
          expect(activity).to be_valid
        end

        it "accepts 31" do
          activity.day_of_month = 31
          expect(activity).to be_valid
        end
      end
    end
  end
end

