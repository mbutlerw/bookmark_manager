feature 'User details' do

	scenario 'when user signs up, user count increases by 1' do
		expect{sign_up}.to change(User, :count).by(1)
	end

	scenario 'page displays welcome message to new user' do
		sign_up
		expect(page).to have_content("Welcome, riya.pabari@gmail.com!")
	end

	scenario 'email address for user is correct' do
		sign_up
		expect(User.first.email).to eq('riya.pabari@gmail.com')
	end

end