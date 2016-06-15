def sign_up

  visit('/users/new')
  fill_in :email, with: 'alice@example.com'
  fill_in :password, with: 'abc123'
  click_button 'Sign up'

end