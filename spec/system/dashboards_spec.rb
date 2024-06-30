require 'rails_helper'

RSpec.describe "Dashboards", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:month) { build_stubbed(:month) }

  it "sees current month's name" do
    allow(Month).to receive(:get_current_month).and_return month
    visit root_path 
    
    expect(page).to have_text(month.full_name)
  end
end
