require_relative '../acceptance_helper'

feature 'User registration' do

  scenario 'non-existent user logs' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'wrong@user.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content 'You have signed up successfully.'
  end

  scenario 'user tries to create a non-existent' do
    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content 'Please review the problems below'
  end

end
