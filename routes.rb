require 'sinatra'
require 'json'
require_relative 'lib/game'

use Rack::Session::Pool
#enable :sessions

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']

  game = Game.new
  game.setup
  session['game'] = game
end

get '/current_board' do
  #require 'pry'
  #binding.pry
  session['game'].current_board.to_json
end

post '/player_move' do
  #require 'pry'
  #binding.pry

  feedback = session['game'].get_feedback(params['move'])
  session['game'].update_board(feedback, params['move'])
  #binding.pry

  { moveStatus: feedback, announcement: 'You are warm' }.to_json

  #session['game'].process_player_move(params['move']).to_json
end

post '/board_size' do
  p '================================= BOARD SIZE ====================================='
  p params

  { status: 'received!' }.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end
