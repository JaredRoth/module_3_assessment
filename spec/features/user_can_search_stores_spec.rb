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

    expect(current_path).to eq("/stores/2740")

    within ".name" do
      expect(page).to have_content("Name: Cherry Creek Shopping Center")
    end
    within ".type" do
      expect(page).to have_content("Type: Mobile")
    end
    within ".address" do
      expect(page).to have_content("Address: 3000 East First Ave, Denver, CO 80206")
    end
    within ".hours" do
      expect(page).to have_content("Mon: 10am-9pm Tue: 10am-9pm Wed: 10am-9pm Thurs: 10am-9pm Fri: 10am-9pm Sat: 10am-9pm Sun: 11am-6pm")
    end
  end
end
