require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:month) { build_stubbed(:month) }
  let(:expenses) { build_stubbed_list(:event, 3, month: month, category: "expense", event_date: Date.current) }
  
  before do
    allow(Month).to receive(:find).and_return month
    allow(month).to receive_message_chain(:events, :expense, :order).and_return(expenses)
  end
  
  describe "GET /expenses" do
    it "returns http success" do
      get month_events_expenses_path(month)
      
      expect(response).to have_http_status(:success)
    end
  end
end

