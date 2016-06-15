
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

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in(:email, with: 'Riya')
  fill_in(:password, with: 'password')
  click_button('Submit')
end
