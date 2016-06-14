feature 'Viewing links' do

  scenario 'to view saved links' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'

    # this is a *temporary* sanity check - to make sure we
    # can load the page :)
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end

feature 'Adding links' do

  scenario 'to add new link to list' do
    visit '/links/new'

    fill_in :url, with: 'http://www.google.com' 
    fill_in :title, with: 'Google Search'
    click_button 'Add Bookmark'

    within 'ul#links' do
      expect(page).to have_content('Google Search')
    end
  end
end