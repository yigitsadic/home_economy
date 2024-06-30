require 'rails_helper'

RSpec.describe Month, type: :model do
  describe "validations" do
    subject { create(:month) }
    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:name).scoped_to(:year) }
  end

  describe "#get_current_month" do
    let(:month_data) { attributes_for(:month) }

    before(:each) { @got = nil } 

    it "returns the month if exists" do
      created = create(:month)
      expect(described_class.find_by(**month_data)).not_to be_nil

      expect { @got = described_class.get_current_month }.not_to change { Month.count }
      expect(created).to eq(@got)
    end

    it "creates and returns the month if not exists" do
      expect { @got = described_class.get_current_month }.to change { Month.count }.by(1)
      expect(@got.name).to eq(month_data[:name])
      expect(@got.year).to eq(month_data[:year])
      expect(@got.full_name).to eq(month_data[:full_name])
    end
  end

  it "creates events from recurring events after create commit" do
    allow(RecurringEvent).to receive(:create_recurring_events)
    
    month = create(:month)

    expect(RecurringEvent).to have_received(:create_recurring_events).with(month)
  end
end

