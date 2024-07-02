require 'rails_helper'

RSpec.describe "Recurring Events", type: :system do
  let!(:recurring_event) { create(:recurring_event) }
  
  before do
    driven_by(:rack_test)

    visit root_path
    click_link "Recurring Events"
  end

  describe "from the new page" do
    before do
      click_link "Create New"
    end
    
    context "filling valid parameters" do
      it "should create a record and see display message" do
        fill_in "Name", with: "Rent"
        select "expense", from: "Category"
        fill_in "Day of month", with: "15"
        fill_in "Financial value", with: "350.75"

        expect { click_button("Create Recurring event") }.to change { RecurringEvent.count }
        expect(page).to have_text("Recurring event was successfully created.")
      end
    end

    context "filling invalid parameters" do
      it "should not create a record and display validation errors" do
        expect { click_button("Create Recurring event") }.not_to change { RecurringEvent.count }
        expect(page).to have_text("errors prohibited this recurring event from being saved:")
      end
    end

    it "can return to list" do
      click_link "Back to Recurring Events"

      expect(page).to have_text("Recurring Event List")
    end
  end

  describe "editing link page" do
    before do
      click_link "Edit"
      expect(page).to have_text("Edit Recurring Event")
    end

    context "filling valid parameters" do
      it "should update the record and display success message" do
        fill_in "Name", with: "Updated Name"
        click_button("Update Recurring event")
        
        expect(page).to have_text("Recurring event was successfully updated.")
        expect(recurring_event.reload.name).to eq("Updated Name")
      end
    end
    
    context "filling invalid parameters" do
      it "should not update the record and display validation errrors" do
        fill_in "Name", with: ""
        expect { click_button("Update Recurring event") }.not_to change(recurring_event, :name)
        expect(page).to have_text("prohibited this recurring event from being saved:")
      end
    end

    it "can return to list" do
      click_link "Back to Recurring Events"

      expect(page).to have_text("Recurring Event List")
    end
  end

  describe "destroying record from list" do
    it "can click Delete button" do
      expect { find("button.btn.btn-danger", text: "Delete").click }.to(
        change { RecurringEvent.count }.by(-1)
      )
      expect(page).to have_text("Recurring event was successfully destroyed.")
    end
  end

  describe "list page" do
    it "can see list of records" do
      expect(page.all("table tbody tr").count).to eq(1)
      expect(page).to have_text(recurring_event.name)
    end

    describe "can see links" do
      it { expect(page).to have_link("Details") }
      it { expect(page).to have_link("Edit") }
      it { expect(page).to have_button("Delete") }
    end
  end
end

