require 'spec_helper'

describe User do

  let!(:user) do # runs this once rather than using 'before' which would run every time we ran our tests
    User.create(email: 'luke@example.com',
                password: '1234',
                password_confirmation: '1234')
  end

  it 'authenticates when given a valid email address and password' do
  	authenticated_user = User.authenticate(user.email, user.password)
  	expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end
  
end