#$: << File.expand_path(File.dirname(__FILE__)) + '/lib'
#Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'sinatra'
require 'yaml'
require 'json'
require_relative 'lib/game'

use Rack::Session::Pool

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => 'http://localhost:9000',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
          'Access-Control-Allow-Credentials' => 'true'
end

get '/current_board' do
  current_board.to_json
end

post '/player_move' do
  #parse/read the YAML file then write new info onto file
  feedback = session['game'].get_feedback(params['move'])
  session['game'].update_board(feedback, params['move'])

  { moveStatus: feedback, announcement: 'You are warm' }.to_json

  #session['game'].process_player_move(params['move']).to_json
end

post '/board_size' do
  game = Game.new(params['board_size'])
  game.setup

  write(game)
  current_board.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end

def current_board
  read_game.first.current_board
end

def write(game)
  File.open(file, "w") do |file|
    file.write(YAML::dump(game))
  end
end

def read_game
  $/="\n\n"
  File.open(file, "r").reduce([]) do |array, game|
    array << YAML::load(game)
  end
end

def file
  "game.yaml"
end
