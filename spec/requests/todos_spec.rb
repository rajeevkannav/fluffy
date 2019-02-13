require 'rails_helper'

RSpec.describe 'Todo API', type: :request do

  let!(:todos) {create_list(:todo, 10)}
  let(:todo_id) {todos.first.id}

  # Test suite for GET /api/todos

  describe 'GET /api/todos' do

    before {get '/api/todos'} # make HTTP get request before each example

    it 'returns todos' do
      expect(json).not_to be_empty
      expect(json["todos"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  # Test suite for GET /api/todos/:id

  describe 'GET /api/todos/:id' do
    before {get "/api/todos/#{todo_id}"}

    context 'when the todo exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json["todo"]["title"]).to eq(todos.first.title) # TODO: response should not come up with object root
        # TODO: id must be matched expect(json["todo"]["id"]).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the todo does not exists' do
      let(:todo_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      # it 'returns a not found method' do
      # end
    end
  end

  # Test suite for POST /api/todos

  describe 'POST /api/todos' do
    let(:valid_attributes) {{todo: {title: 'Learn react'}}}

    context 'when the request is valid' do
      before {post '/api/todos', valid_attributes}

      it 'creates a todo' do
        expect(json['todo']['title']).to eq('Learn react')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is not valid' do
      before {post '/api/todos', {todo: {title: ''}}}

      it 'returns a status code 422' do
        expect(response).to have_http_status(422)
      end

      # it 'returns a validation failure message' do
      # expect(response.body).to match(/Validation failed: title can't be blank/)
      # end
    end
  end

  # Test suite for PUT /api/todos/:todo_id

  describe 'PUT /api/todos/:todo_id' do
    let(:valid_attributes) {{todo: {title: 'Learn react and angular'}}}

    context 'when the record exists' do
      before {put "/api/todos/#{todo_id}", valid_attributes}

      it 'update the todo' do
        expect(response.body).to be_empty
      end

      it 'returns the status code 204' do
        expect(response).to have_http_status(204)
      end
    end


  end

  # Test suite for DELETE /api/todos/:todo_id

  describe 'DELETE /api/todos/;todo_id' do
    before {delete "/api/todos/#{todo_id}"}

    it 'return the status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end