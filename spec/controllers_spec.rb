require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe 'Controllers', type: :request do
  describe 'GET index' do
    it 'returns a 200 OK status code and renders the correct template' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of user')
    end
  end

  describe 'GET show' do
    let(:user) { User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher', posts_counter: 1) }

    it 'returns a 200 OK status code and renders the correct template' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end

    it 'includes the correct text in the response body' do
      get user_path(user)
      expect(response.body).to include('Here are posts for a given user')
    end
  end

  describe 'GET index' do
    let(:user) { User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher', posts_counter: 1) }
    it 'returns a 200 OK status code and renders the correct template' do
      get user_posts_path(user)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET show' do
    let(:user) { User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher', posts_counter: 1) }
    let(:post) do
      Post.create(title: 'AI', text: 'Great post', comments_counter: 1, likes_counter: 1,
                  author: user)
    end

    it 'returns a 200 OK status code and renders the correct template' do
      get user_post_path(post.author, post)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end

    it 'includes the correct text in the response body' do
      get user_post_path(post.author, post)
      expect(response.body).to include('Here is a single post for a given user')
    end
  end
end
