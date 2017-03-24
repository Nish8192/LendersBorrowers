require 'rails_helper'
feature "create a new user and show the new users home page" do
  scenario "displays the user informatin properly" do
      visit "/"
      fill_in "fnL", with: "Nishant"
      fill_in "lnL", with: "Aggarwal"
      fill_in "lE", with: "nish@email.com"
      fill_in "lP", with: "Test1234"
      click_button "lR"
    expect(page).to have_content "Name: Nishant Aggarwal"
  end
end
