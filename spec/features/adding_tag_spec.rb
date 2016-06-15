
feature 'adding a tag' do

  scenario 'User can add a tag to a link' do
    visit('/links/new')
    fill_in :url, with: 'www.makersacademy.com'
    fill_in :title, with: 'MA'
    fill_in :tags, with: 'education'
    click_button 'Add Link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end
