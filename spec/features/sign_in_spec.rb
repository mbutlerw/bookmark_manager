require 'spec_helper'

feature 'Signing in' do

  let!(:user) do # runs this once rather than using 'before' which would run every time we ran our tests
    User.create(email: 'luke@example.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
  	sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
