require 'rails_helper'

RSpec.describe "Dashboards", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:month) { build(:month) }

  it "sees current month's name" do
    visit root_path
    
    expect(page).to have_text(month.full_name)
  end
end
