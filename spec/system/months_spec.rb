require 'rails_helper'

RSpec.describe "Months", type: :system do
  let!(:april) { create(:month, :april) }
  let!(:may) { create(:month, :may) }
  
  before do
    driven_by(:rack_test)
    visit root_path

    click_link "Months"
  end

  describe "list" do
    it "can see list of months with overview" do
      expect(page).to have_text("Overview of Months")
      expect(page).to have_text("Total Income")
      expect(page).to have_text("Total Expense")
      expect(page).to have_text("Total Investment")
    end
  end

  describe "details" do
    before do
      click_link "#{april.full_name} Details"
    end
    
    it "can see details of selected month" do
      expect(page).to have_text(april.full_name)
      expect(page).to have_text("Total Income")
      expect(page).to have_text("Total Expense")
      expect(page).to have_text("Total Investment")
    end
  end
end
