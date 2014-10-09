require 'sinatra'
require 'json'
require_relative 'lib/human_board'

enable :sessions

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

# need to figure out how to board = Board.new and persist it throughout all the routes

get '/start_game' do
  board = HumanBoard.new(5)
  board.create
  p 'SESSION INSIDE START_GAME!'
  p session
  session['board_obj'] = board
  p session

  session['board_obj'].gameboard.to_json
end

get '/current_board' do
  session['board_obj'].gameboard.to_json
end

post '/player_move' do
  p params
  p 'SESSION INSIDE PLAYER_MOVE!'
  p session
  { status: 'hit' }.to_json
end

get '/hello' do
  { title: 'hi' }.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end
