require 'rails_helper'

RSpec.describe "events/expenses.html.haml", type: :view do
  it "renders expense events as table" do
    events = build_stubbed_list(:event, 3)
    assign(:events, events)

    render

    expect(rendered).to include("turbo-frame")
    expect(rendered).to include("table")

    events.each do |event|
      expect(rendered).to include(event.name)
    end
  end
end
