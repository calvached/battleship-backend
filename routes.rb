$: << File.expand_path(File.dirname(__FILE__)) + '/lib'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'sinatra'
require 'json'
require_relative 'lib/game'

configure do
  use Rack::Session::Pool
  #enable :sessions
  #set :session_secret, "My session secret"
end

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']

  create_game
end

class App < Sinatra::Application
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
    create_game

    session['game'].current_board.to_json
  end

  not_found do
    halt 404, 'Route not created for this!!!'
  end

  def create_game
  #params['board_size']
    game = Game.new('6')
    game.setup
    session['game'] = game
  end
end
