
def create_link_makers
  visit('/links/new')
  fill_in(:url, with: 'www.makersacademy.com')
  fill_in(:title, with: 'Makers Academy')
  fill_in(:tags, with: 'coding, education')
  click_button('Create Link')
end

def create_link_bubbles
  visit('/links/new')
  fill_in(:url, with: 'www.effervescent.com')
  fill_in(:title, with: 'Effervescent champagne')
  fill_in(:tags, with: 'bubbles')
  click_button('Create Link')
end

def sign_up(email: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end
