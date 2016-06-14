require "rails_helper"

RSpec.feature "User can search by zipcode" do
  scenario "user sees appropriate results" do
    visit root_path

    fill_in "zip", with: '80202'
    click_on "search"

    expect(current_path).to eq("/search")

    expect(page).to have_content("17 total stores")

    expect(page).to have_css("#15")
    expect(page).not_to have_css("#16")
    within("#1 .name") do
      expect(page).to have_content("Name: Best Buy Mobile - Cherry Creek Shopping Center")
    end
    within("#1 .city") do
      expect(page).to have_content("City: Denver")
    end
    within("#1 .distance") do
      expect(page).to have_content("Distance: 3.25")
    end
    within("#1 .phone") do
      expect(page).to have_content("Phone: 303-270-9189")
    end
    within("#1 .type") do
      expect(page).to have_content("Type: Mobile")
    end
  end

  scenario "user sees appropriate results" do
    visit root_path

    fill_in "zip", with: '80202'
    click_on "search"

    click_on "Best Buy Mobile - Cherry Creek Shopping Center"

    expect(current_path).to eq("/stores/:store_id")

    expect(page).to have_content("Name: Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("Type: Mobile")
    expect(page).to have_content("Address: Mobile")

  end
end

# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
