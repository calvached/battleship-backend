require 'sinatra'
require 'json'
require_relative 'lib/board'

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

get '/' do
  {:greeting => 'hi'}.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end
