require 'rails_helper'

feature 'commenting' do
  scenario 'allows user to leave a comment to picture' do
    sign_up_and_add_a_picture
    fill_in 'comment[thoughts]', with: 'Great!'
    click_button 'Add a comment'
    expect(page).to have_content 'Great!'
    expect(current_path).to eq pictures_path
  end
end
