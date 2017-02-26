require 'rails_helper'

feature 'linking pictures' do
  scenario 'a user can like a picture' do
    sign_up_and_add_a_picture
    click_button 'Like'
    expect(page).to have_content '1 like'
  end
  scenario 'only signed up user can like a picture' do
    sign_up_and_add_a_picture
    click_link 'Sign out'
    expect(page).not_to have_content 'Like'
  end
end
