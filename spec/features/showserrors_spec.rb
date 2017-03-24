require 'rails_helper'
feature "catch invalid information being added" do
  scenario "displays an error message if forms are not filled properly" do
      visit "/"
      fill_in "fnL", with: "Nishant"
      fill_in "lnL", with: "Aggarwal"
      fill_in "lE", with: "nish"
      click_button "lR"
    expect(page).to have_content "Password can't be blank Password is too short (minimum is 8 characters) Password is invalid Email is invalid"
  end
end
