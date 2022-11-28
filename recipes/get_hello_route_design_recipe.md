1. Design the Route Signature

the HTTP method : GET
the path : /hello
any query parameters (passed in the URL) : name(string)
or body parameters (passed in the request body)

2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

Hello #{name}

<!-- EXAMPLE -->
<!-- Response when the post is not found: 404 Not Found -->
3. Write Examples
Replace these with your own design.

# Request:
GET /hello?name=Harry

# Expected response:
Response for 200 OK
Hello Harry

# Request:
GET /greet

# Expected response:
Response for 404 Not Found

4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
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
            response = get('/greet')
      
            expect(response.status).to eq(404)
            # expect(response.body).to eq(expected_response)
          end
        end
end
5. Implement the Route
Write the route and web server code to implement the route behaviour.