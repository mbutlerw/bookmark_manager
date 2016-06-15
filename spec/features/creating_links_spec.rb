
feature 'Adds new link' do

  scenario 'User can add links to a page' do
    visit('/links/new')
    fill_in :url, with: 'www.makersacademy.com'
    fill_in :title, with: 'MA'
    click_button 'Add Link'
    expect(current_path).to eq('/links')
    within 'ul#links' do
      expect(page).to have_content('MA')
    end
  end

end