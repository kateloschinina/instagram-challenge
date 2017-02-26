require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'Your instagram is empty.'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'picture has been added' do
    before { Picture.create }

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_css("img[src*='lib/images/default.jpg']")
      expect(page).not_to have_content 'Your instagram is empty.'
    end
  end

  context 'adding a new picture' do
    scenario 'shows user a form to add new picture, then displays it' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture[image]', 'lib/images/default.jpg')
      click_button 'Upload picture'
      save_and_open_page
      expect(page).to have_css("img[src*='default.jpg']")
      expect(page).not_to have_content 'Your instagram is empty.'
    end
  end
end
