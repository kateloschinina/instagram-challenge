require 'rails_helper'

feature 'commenting' do
  scenario 'allows user to leave a comment to picture' do
    visit pictures_path
    sign_up
    click_link 'Add a picture'
    attach_file('picture[image]', 'lib/images/default.jpg')
    click_button 'Upload picture'
    save_and_open_page
    fill_in 'comment[thoughts]', with: 'Great!'
    click_button 'Add a comment'
    expect(page).to have_content 'Great!'
    expect(current_path).to eq pictures_path
  end
end
