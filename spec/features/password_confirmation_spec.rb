feature 'Password confirmation' do

	scenario 'no new user created when pw is mismatched' do
		expect{ sign_up(password_confirmation: 'fish') }.not_to change(User, :count)
	end

	scenario 'new user created when pw and confirm matches' do
		expect{ sign_up }.to change(User, :count).by(1)
	end

end
