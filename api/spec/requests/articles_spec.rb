require 'rails_helper'

RSpec.describe 'Articles resources', type: :request do
    
    let!(:articles) { create_list(:article, 10) }
    let(:article_id) { articles.first.id }

    # Test suite for getting article list
    describe 'GET /articles' do

        before { get '/articles' } 

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

        before { get "/articles/#{article_id}" }

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
                title: 'Learn a new tool', 
                content: 'when an unknown printer took a galley of',
                created_by: '234' 
            } 
        end

        context 'when the request is valid' do
            before { post '/articles', params: valid_input }
      
            it 'creates a article' do
              expect(response_as_hash['title']).to eq('Learn a new tool')
            end
      
            it 'returns status code 201' do
              expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/articles', params: { title: 'whatever', content: 'whatever' } }
      
            it 'returns status code 422' do
              expect(response).to have_http_status(422)
            end
      
            it 'returns a validation failure message' do
              expect(response.body)
                .to match(/Validation failed: Created by can't be blank/)
            end
        end
    
    end

end