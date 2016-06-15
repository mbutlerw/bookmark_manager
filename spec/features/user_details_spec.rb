feature 'User details' do

	scenario 'when user signs up, user count increases by 1' do
		expect{sign_up}.to change(User, :count).by(1)
	end

	scenario 'page displays welcome message to new user'

	scenario 'email address for user is correct'


end