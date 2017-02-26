def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
  # @user = User.find_by_email('test@example.com')
end

def sign_up_with_another_user
  click_link 'Sign out'
  click_link 'Sign up'
  fill_in 'Email', with: 'test2@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def sign_up_and_add_a_picture
  visit pictures_path
  sign_up
  click_link 'Add a picture'
  attach_file('picture[image]', 'lib/images/default.jpg')
  click_button 'Upload picture'
end
