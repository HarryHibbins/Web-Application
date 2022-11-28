require 'spec_helper'
require 'rack/test'
require_relative  '../../app'

RSpec.describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new }

    context "GET /hello" do
        it 'returns 200 OK' do
          response = get('/hello?name=Harry')
    
          expect(response.status).to eq(200)

          expected_response = "Hello Harry"
          expect(response.body).to eq(expected_response)
        end
        
        it 'returns 404 Not Found' do
            response = get('/hi')
      
            expect(response.status).to eq(404)
            # expect(response.body).to eq(expected_response)
          end
        end

    context 'POST /submit' do
        it 'returns 200 OK' do
            response = post('/submit', name: 'Harry', message: 'Test message')
            expect(response.status).to eq 200
            expect(response.body).to eq 'Thanks Harry you sent this message: Test message'
        end

        it 'returns 404 not found' do
            response = post('/no_method')
            expect(response.status).to eq 404
        end
    end

    context "GET /names" do
        it 'returns 200 OK' do
          response = get('/names')
    
          expect(response.status).to eq(200)

          expected_response = "Julia, Mary, Karim"
          expect(response.body).to eq(expected_response)
        end
        
        it 'returns 404 Not Found' do
            response = get('/name')
      
            expect(response.status).to eq(404)
            # expect(response.body).to eq(expected_response)
          end
        end

        context "POST / sort_names" do
            it 'returns 200 OK' do
              response = post('sort_names?names=Joe,Alice,Zoe,Julia,Kieran')
        
              expect(response.status).to eq(200)
    
              expected_response = "Alice,Joe,Julia,Kieran,Zoe"
              expect(response.body).to eq(expected_response)
            end
            it 'returns 200 OK' do
                response = post('sort_names?names=Harry,Alife')
          
                expect(response.status).to eq(200)
      
                expected_response = "Alife,Harry"
                expect(response.body).to eq(expected_response)
              end
            
            it 'returns 404 Not Found' do
                response = post('/sort_name')
          
                expect(response.status).to eq(404)
                # expect(response.body).to eq(expected_response)
              end
            end


end