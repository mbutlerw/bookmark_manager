feature 'Password confirmation' do

	scenario 'no new user created when pw is mismatched' do
		expect{ sign_up(password_confirmation: 'fish') }.not_to change(User, :count)
		expect(current_path).to eq ('/users')
		expect(page).to have_content 'Password and confirmation password do not match'
	end

	scenario 'new user created when pw and confirm matches' do
		expect{ sign_up }.to change(User, :count).by(1)
	end

	scenario "user can't sign up without email" do
		expect{ sign_up(email: nil) }.not_to change(User, :count)
	end

	scenario "user can't sign up with invalid email" do
			expect{ sign_up(email: 'email@emailing') }.not_to change(User, :count)
	end


end