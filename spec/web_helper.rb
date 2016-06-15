
def create_link_makers
  visit('/links/new')
  fill_in('url', with: 'www.makersacademy.com')
  fill_in('title', with: 'Makers Acadmey')
  fill_in('tags', with: 'coding')
  click_button('Create Link')
end

def create_link_bubbles
  visit('/links/new')
  fill_in('url', with: 'www.effervescent.com')
  fill_in('title', with: 'Effervescent champagne')
  fill_in('tags', with: 'bubbles')
end
