require "rails_helper"

describe "User see search interface " do
  it "should see and a form" do
    # As a user
    user = create(:user)
    allow_any_instance_of().to receive(:name).and_return("Wibble")
    # When I visit "/"
    visit "/"
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in:  "form-control", with: "80203"

    # And I click "Locate"
    
    # Then I should be on page "/search"
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
