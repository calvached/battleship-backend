require 'rack/test'
require_relative '../routes'

describe 'Battleship' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'returns a board when a valid board size is posted' do
    data = '{"board_size": "5"}'
    post '/new', JSON.parse(data)

    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq(
      [
        {"id"=>"1"}, {"id"=>"2"}, {"id"=>"3"}, {"id"=>"4"}, {"id"=>"5"},
        {"id"=>"6"}, {"id"=>"7"}, {"id"=>"8"}, {"id"=>"9"}, {"id"=>"10"},
        {"id"=>"11"}, {"id"=>"12"}, {"id"=>"13"}, {"id"=>"14"}, {"id"=>"15"},
        {"id"=>"16"}, {"id"=>"17"}, {"id"=>"18"}, {"id"=>"19"}, {"id"=>"20"},
        {"id"=>"21"}, {"id"=>"22"}, {"id"=>"23"}, {"id"=>"24"}, {"id"=>"25"}
      ])
  end

  it 'returns a 400 error when an invalid board size is posted' do
    data = '{"board_size": "4"}'
    post '/new', JSON.parse(data)

    expect(last_response.status).to eq(400)
    expect(last_response.body).to eq("Invalid input. Please enter a number from #{Validator::MIN_BOARD_SIZE} - #{Validator::MAX_BOARD_SIZE}.")
  end

  it 'processes a move when an available move is posted' do
    allow(GameKeeper).to receive(:available_move?).with('1').and_return(true)
    allow(GameKeeper).to receive(:use_move!)
    allow(GameKeeper).to receive(:process_move).with('1').and_return('hit')

    post '/board/1'

    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq(
      {
        "id"=>"1",
        "status"=>"hit"
      })
  end

  it "returns a 'used move' message if a move is already posted" do
    allow(GameKeeper).to receive(:available_move?).with('2').and_return(false)
    allow(GameKeeper).to receive(:find_move_status).with('2').and_return('hit')

    post '/board/2'

    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq(
      {
        "id"=> "2",
        "status"=>"hit",
        "message"=>USED_MOVE_MESSAGE
      })
  end

  it "gets a game outcome" do
    allow(GameKeeper).to receive(:game_outcome).and_return({ gameOutcome: 'win' })

    get '/game_outcome'

    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq({"gameOutcome"=>"win"})
  end

  it 'throws a 404 if a route does not exist' do
    get '/nonexistant_route'

    expect(last_response.status).to eq(404)
    expect(last_response.body).to eq(NOT_FOUND_MESSAGE)
  end
end
