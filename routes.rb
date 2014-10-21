require 'json'
require "sinatra"
require_relative 'lib/game_keeper'
require_relative 'lib/game'

use Rack::Session::Pool

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => 'http://localhost:9000',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
          'Access-Control-Allow-Credentials' => 'true'
end

get '/current_board' do
  GameKeeper.current_board.to_json
end

post '/player_move' do
  # need to rework the logic
  { moveStatus: 'hit', announcement: 'You are warm' }.to_json
end

post '/board_size' do
  GameKeeper.current_game = Game.new(params['board_size'])

  GameKeeper.current_board.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end
