require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  let(:user) { create(:user) }
  before do
    sign_in_mock_user(user)
  end
  
  it 'render the index view'  do
    get :index 
    expect(response).to render_template('index')  
  end
end
