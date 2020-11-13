require 'rails_helper.rb'

describe 'testing relationship features', type: :feature do
  before :each do
    @test_user1 = User.create!({ fullname: 'Happi',
                                 username: 'guruman',
                                 email: 'hguruman@gmail.com',
                                 password: '123456',
                                 password_confirmation: '123456' })
    @test_user2 = User.create!({ fullname: 'Max',
                                 username: 'afanga',
                                 email: 'max@gmail.com',
                                 password: '123456',
                                 password_confirmation: '123456',
                                 id: 20 })
    @test_user1_follow = User.create!({ fullname: 'Lari',
                                        username: 'rissa',
                                        email: 'whomgodsent@gmail.com',
                                        password: '123456',
                                        password_confirmation: '123456' })
    @relationship = Relationship.create!({ follower_id: @test_user1_follow.id,
                                           followed_id: @test_user1.id })

    @post = Quote.create!({ author_id: @test_user1_follow.id,
                            content: 'Test post from Lari' })
    visit 'users/sign_in'
    fill_in 'Login', with: 'hguruman@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit 'users'
  end

  it 'Able to see other users in index page' do
    visit 'users'
    expect(page).to have_content 'Max'
  end
  it 'Able to see other users in show page' do
    visit 'users/20'
    expect(page).to have_content 'Max'
  end

  it 'able to follow' do
    visit 'users/20'
    find('#follow').click
    expect(page).to have_css('#unfollow')
  end

  it 'able to unfollow' do
    visit 'users/20'
    find('#follow').click
    find('#unfollow').click
    expect(page).to have_css('#follow')
  end
end