require 'sinatra'
require 'json'
require_relative 'lib/board'

enable :sessions

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

# need to figure out how to board = Board.new and persist it throughout all the routes

get '/start_game' do
  board = Board.new(5)
  board.create
  session['board_obj'] = board

  #redirect "/current_board"
  session['board_obj'].gameboard.to_json
end

get '/current_board' do
  session['board_obj'].gameboard.to_json
end

post '/player_move' do
  p params
end

get '/hello' do
  { title: 'hi' }.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end
