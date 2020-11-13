require 'rails_helper'
require 'spec_helper'

describe 'the signin process', type: :feature do
  before :each do
    @test_user1 = User.create!({ fullname: 'Kelyn',
                                 username: 'kells',
                                 email: 'kelyn@gmail.com',
                                 password: '123123',
                                 password_confirmation: '123123' })
    @test_user2 = User.create!({ fullname: 'Alex',
                                 username: 'abouhid',
                                 email: 'alex@gmail.com',
                                 password: '123123',
                                 password_confirmation: '123123' })
    @test_user1_follow = User.create!({ fullname: 'Chuck',
                                        username: 'chucky',
                                        email: 'chuckster@gmail.com',
                                        password: '123123',
                                        password_confirmation: '123123' })
    @relationship = Relationship.create!({ follower_id: @test_user1_follow.id,
                                           followed_id: @test_user1.id })

    @post = Quote.create!({ author_id: @test_user1_follow.id,
                            content: 'Test post from Chuck' })
  end

  it 'Display message when creating a new user' do
    visit '/users/sign_up'
    fill_in 'user_fullname', with: '123123a'
    fill_in 'user_username', with: '123123a'
    fill_in 'user_email', with: '123123a@gmail.com'
    fill_in 'user_password', with: '123123a'
    fill_in 'user_password_confirmation', with: '123123a'

    click_button('Sign up')

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
  it 'Display message when logged in with username' do
    visit '/users/sign_in'

    fill_in 'Login', with: @test_user1.username
    fill_in 'user_password', with: @test_user1.password

    click_button('Log in')

    expect(page).to have_content 'Signed in successfully.'
  end
  it 'Display message when logged in with email' do
    visit '/users/sign_in'

    fill_in 'Login', with: @test_user1.email
    fill_in 'user_password', with: @test_user1.password

    click_button('Log in')

    expect(page).to have_content 'Signed in successfully.'
  end
  it 'Display message when sign out' do
    visit '/users/sign_in'

    fill_in 'Login', with: @test_user1.email
    fill_in 'user_password', with: @test_user1.password
    click_button('Log in')
    click_link 'Logout'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
