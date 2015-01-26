require 'json'
require "sinatra"
require_relative 'lib/game_keeper'
require_relative 'lib/game'
require_relative 'lib/ai_player'
require_relative 'lib/rules'
require_relative 'lib/ship_selector'
require_relative 'lib/validator'

set :port, 9393

use Rack::Session::Pool

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => 'http://localhost:9000',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
          'Access-Control-Allow-Credentials' => 'true'
end

post '/new_game' do
  if Validator.validate_board_size(params['board_size'])
    board = Board.new(params['board_size'])
    ai_player = AiPlayer.new(board, Rules, ShipSelector)
    game = Game.new(board, ai_player)
    game.setup
    GameKeeper.current_game = game

    ({ gameboard: GameKeeper.current_board }).to_json
  else

    halt 400, "Invalid input. Please enter a number from #{Validator::MIN_BOARD_SIZE} - #{Validator::MAX_BOARD_SIZE}."
  end
end

not_found do
  halt 404, 'Route not created for this!!!'
end
