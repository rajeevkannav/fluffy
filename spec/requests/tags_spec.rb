require 'rails_helper'

RSpec.describe 'Tag API', type: :request do

  let!(:todos) {create_list(:todo, 10)}
  let!(:tags) {create_list(:tag, 2)}

  let(:todo_id) {todos.first.id}
  let(:tag_name) {tags.first.name}


  # Test suite for GET api/tags/:tag_name/todos

  describe 'GET api/tags/:tag_name/todos' do

    context 'when requested with single tag' do
      before {todos.first.tags << tags.first}
      before {get "/api/tags/#{tag_name}/todos"}

      it 'find the todo(s) with requested tag' do
        expect(json).not_to be_empty
        expect(json['todos'].count).to eq(1)
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end

  end

end