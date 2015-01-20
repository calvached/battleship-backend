require 'json'
require "sinatra"
require_relative 'lib/game_keeper'
require_relative 'lib/game'
require_relative 'lib/validator'

set :port, 9393

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
  GameKeeper.get_feedback(params['move']).to_json
end

post '/board_size' do
  if Validator.validate_board_size(params['board_size'])
    GameKeeper.current_game = Game.new(params['board_size'])

    { gameboard: GameKeeper.current_board }.to_json
  else

    { errorMsg: "Invalid input. Please enter a number from 4 - 10." }.to_json
  end
end

not_found do
  halt 404, 'Route not created for this!!!'
end
