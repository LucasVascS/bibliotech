require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  let(:user) { create(:user) }
  before do
    sign_in_mock_user(user)
  end

  context 'Testing instance variables' do
    let (:book) {create(:book)}
    it 'teste vlaue of @book variable ' do
      get :show, params: {id: book.id}
      expect(assigns(:book)).to eq(book)  
    end

  end

  context 'Testing 200 status code and render view' do
    it '200 status and render view for index' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')    
    end

    it '200 status and render view for new' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template('new')
    end

    it '200 status and not render view for show' do
      get :show
      expect(response).to_not render_template('show')
    end

    it '200 status for show_table' do
      get :show_table
      expect(response).to have_http_status(200)
    end
  end
end
