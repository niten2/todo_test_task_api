# require_relative '../acceptance_helper'

# feature 'User siging in' do

#   given(:user) { create(:user) }

#   scenario "existing User Account Login" do
#     sign_in(user)
#     expect(page).to have_content 'Signed in successfully'
#   end

#   scenario 'non-existent user tries to log in to your account' do
#     visit new_user_session_path

#     fill_in 'user_email', with: 'wrong@user.com'
#     fill_in 'user_password', with: '12345'
#     click_on 'Log in'

#     expect(page).to have_content 'Invalid email or password'
#   end

# end
