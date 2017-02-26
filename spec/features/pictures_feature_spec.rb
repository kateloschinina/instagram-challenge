require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit pictures_path
      expect(page).to have_content 'Your instagram is empty'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'picture has been added' do
    scenario 'display pictures' do
      sign_up
      @user = User.find_by_email('test@example.com')
      @user.pictures.create!
      visit pictures_path
      expect(page).to have_css("img[src*='lib/images/default.jpg']")
      expect(page).not_to have_content 'Your instagram is empty'
    end
  end

  context 'adding a new picture' do
    scenario 'shows user a form to add new picture, then displays it' do
      sign_up_and_add_a_picture
      expect(page).to have_css("img[src*='default.jpg']")
      expect(page).not_to have_content 'Your instagram is empty'
    end
    scenario 'only signed in user can add a new picture' do
      visit pictures_path
      click_link 'Add a picture'
      expect(page).to have_content 'Your have to sign up to be able to post pictures'
      expect(current_path).to eq pictures_path
    end
  end

  context 'deleting pictures' do
    scenario 'user can delete his own picture' do
      sign_up_and_add_a_picture
      click_link 'Delete'
      expect(page).not_to have_css("img[src*='default.jpg']")
      expect(page).to have_content 'Your instagram is empty'
    end

    scenario 'user can not delete someone else picture' do
      sign_up_and_add_a_picture
      sign_up_with_another_user
      click_link 'Delete'
      save_and_open_page
      expect(page).to have_css("img[src*='default.jpg']")
      expect(page).to have_content 'You can not delete someone elses pictures'
    end
  end
end
