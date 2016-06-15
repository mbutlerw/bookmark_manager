feature 'filtering tags' do

  scenario 'only links tagged "bubble" are present' do
  	create_link_makers
  	create_link_bubbles
  	visit('/tags/bubbles')
  	expect(page).to have_content('Effervescent champagne')
  	expect(page).not_to have_content('Makers Academy')
  end

  scenario 'only links tagged "coding" are present' do
  	create_link_makers
  	create_link_bubbles
  	visit('/tags/coding')
  	expect(page).not_to have_content('Effervescent champagne')
  	expect(page).to have_content('Makers Academy')
  end


end
