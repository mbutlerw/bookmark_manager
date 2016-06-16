require 'spec_helper'

feature 'Adding tags to links' do
  scenario 'I can add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'butdoesitfloat.com'
    fill_in 'title', with: 'but does it float'
    fill_in 'tags', with: 'art'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('art')
  end

  scenario 'I can add multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: 'butdoesitfloat.com'
    fill_in 'title', with: 'but does it float'
    fill_in 'tags', with: 'art photography'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('art', 'photography')
  end
end