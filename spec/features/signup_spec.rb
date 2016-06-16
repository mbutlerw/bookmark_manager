feature 'Password confirmation' do

  scenario 'no new user created when pw is mismatched' do
    expect{ sign_up(password_confirmation: 'fish') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'new user created when pw and confirm matches' do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario "user can't sign up without email" do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario "user can't sign up with invalid email" do
    expect{ sign_up(email: 'email@emailing') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "can't sign_up with an email that exists in db" do
  	sign_up
  	expect{ sign_up }.not_to change(User, :count)
  	expect(page).to have_content('Email is already taken')
  end


end
