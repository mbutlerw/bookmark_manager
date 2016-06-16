feature 'User details' do


	scenario 'page displays welcome message to new user' do
		sign_up
		expect(page).to have_content("Welcome, alice@example.com!")
	end

	scenario 'email address for user is correct' do
		sign_up
		expect(User.first.email).to eq('alice@example.com')
	end

end
