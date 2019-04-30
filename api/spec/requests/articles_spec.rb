require 'rails_helper'

RSpec.describe 'Articles resources', type: :request do
    
    let!(:user) { create(:user) }
    let!(:articles) { create_list(:article, 10, user_id: user.id) }
    let(:article_id) { articles.first.id }

    # authorize request
    let(:headers) { valid_headers }

    # Test suite for getting article list
    describe 'GET /articles' do

        before { get '/articles', params: {}, headers: headers } 

        it 'returns articles' do
            # `json` parse JSON responses
            expect(response_as_hash).not_to be_empty
            expect(response_as_hash.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end

    end

    # Test suite for getting a single article resource
    describe 'GET /articles/:id' do

        before { get "/articles/#{article_id}", params: {}, headers: headers }

        context 'when record exists' do
            
            it 'returns article resource' do
                expect(response_as_hash).not_to be_empty
                expect(response_as_hash['id']).to eq(article_id)
            end
        
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

        end

        context 'when the record does not exist' do
            
            let(:article_id) { 100 }
      
            it 'returns status code 404' do
              expect(response).to have_http_status(404)
            end
      
            it 'returns a not found message' do
              expect(response.body).to match(/Couldn't find Article/)
            end

        end

    end

    # Test suite for creating an article resource
    describe 'POST /articles' do

        let(:valid_input) do 
            { 
                title: 'this the most amazing title ever written by white walkers', 
                content: 'when an unknown printer took a galley of when an unknown printer took a galley of when an unknown printer took a galley of',
                user_id: user.id
            }.to_json
        end

        context 'when the request is valid' do
            before { post '/articles', params: valid_input, headers: headers }
      
            it 'creates a article' do
              expect(response_as_hash['title']).to eq('this the most amazing title ever written by white walkers')
            end
      
            it 'returns status code 201' do
              expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            
            let(:invalid_attributes) { { title: nil, content: 'whatever', user_id: user.id }.to_json }
            before { post '/articles', params: invalid_attributes, headers: headers }
      
            it 'returns status code 422' do
              expect(response).to have_http_status(422)
            end
      
            it 'returns a validation failure message' do
              expect(response.body)
                .to match(/Validation failed: Title can't be blank/)
            end
        end
    
    end

end