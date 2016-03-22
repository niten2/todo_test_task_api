# require_relative '../acceptance_helper'

# feature 'Siging out' do

#   given(:user) { create(:user) }

#   scenario "existing user exits the account" do
#     sign_in(user)
#     visit root_path
#     click_on 'Log out'

#     expect(page).to have_content 'You need to sign in or sign up before continuing.'
#     expect(page).to have_content 'Log in'
#   end

# end
