require 'sinatra'
require 'json'
require_relative 'lib/game'

enable :sessions

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']

  game = Game.new
  game.setup
  session['game'] = game
end

get '/current_board' do
  session['game'].current_board.to_json
end

post '/player_move' do
  feedback = session['game'].get_feedback(params['move'])

  { status: feedback }.to_json
end

not_found do
  halt 404, 'Route not created for this!!!'
end
