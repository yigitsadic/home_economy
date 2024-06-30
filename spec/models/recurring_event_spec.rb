require 'rails_helper'

RSpec.describe RecurringEvent, type: :model do
  subject { build(:recurring_event) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:day_of_month) }
    it { should validate_inclusion_of(:day_of_month).in_array((1..31).to_a) }
  end

  describe "#create_recurring_events" do
    let(:month) { build(:month, :february) }
    
    it "should attach to last day of month if day exceeds month's last day" do
      recurring_events = build_list(:recurring_event, 2, day_of_month: 31) 
      allow(described_class).to receive(:all).and_return(recurring_events)
      allow(Event).to receive(:create)
      
      described_class.create_recurring_events(month)

      expect(Event).to have_received(:create).with(hash_including(event_date: Date.current.end_of_month)).exactly(2).times
    end
    
    it "should set values as in recurring event" do
      recurring_event = build(:recurring_event, financial_value: 15, name: "Testing", day_of_month: 12)

      allow(described_class).to receive(:all).and_return([recurring_event])
      allow(Event).to receive(:create)
      
      expected = {
        name: recurring_event.name,
        category: recurring_event.category,
        event_date: Date.new(month.year.to_i, I18n.t("date.month_names").index(month.name), recurring_event.day_of_month),
        is_recurring: true,
        financial_value: recurring_event.financial_value
      }
      
      described_class.create_recurring_events(month)

      expect(Event).to have_received(:create).with(hash_including(**expected))
    end
  end
end

