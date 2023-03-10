require 'rails_helper'

RSpec.describe 'User index test', type: :feature do
  before :each do
    @first_user = User.create(name: 'Yousef', bio: 'Front end Engineer', posts_counter: 4, email: 'yousef@yahoo.com',
                              password: '02222222222222222')
    @second_user = User.create(name: 'Amanuel', bio: 'Student', posts_counter: 5, email: 'amanuel@yahoo.com',
                               password: '02222222222222222')
    visit users_path
  end

  it 'Should diplay all usernames of the users' do
    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@second_user.name)
  end

  it 'Should display the photo of each user' do
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
      and @alt = 'user photo']")
  end

  it 'should have the number of posts of each user' do
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Number of posts: 5')
  end

  it 'should redirect the user to show page if its clicked' do
    click_link(@first_user.name)
    expect(page).to have_current_path user_path(@first_user.id)
  end
end
