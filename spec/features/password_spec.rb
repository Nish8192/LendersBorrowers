require 'rails_helper'
feature "require a number and a capital letter in the user password" do
  scenario "user tries to create an account without a capital letter" do
      visit "/"
      fill_in "fnL", with: "Nishant"
      fill_in "lnL", with: "Aggarwal"
      fill_in "lE", with: "nish@email.com"
      fill_in "lP", with: "test1234"
      click_button "lR"
    expect(page).to have_content "Password is invalid"
  end
end
