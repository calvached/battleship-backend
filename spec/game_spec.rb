require 'game'

describe Game do
  it "returns a 'hit' status when given a cell number" do
    ai_player = double('AiPlayer')
    counter = double('Counter')
    board = double('Board', marker_board:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>"x",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    allow(board).to receive(:create)
    allow(board).to receive(:create_marker_board)
    allow(board).to receive(:place_marker).with('5', 'hit')
    allow(ai_player).to receive(:place_ships)
    allow(ai_player).to receive(:is_hit?) { true }
    allow(ai_player).to receive(:make_move)

    game = Game.new(board, ai_player, counter)
    game.setup

    expect(game.process_move('5')).to eq('hit')
  end

  it "returns a 'miss' status when given a cell number" do
    ai_player = double('AiPlayer')
    counter = double('Counter')
    board = double('Board', marker_board:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>"x",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    allow(board).to receive(:create)
    allow(board).to receive(:create_marker_board)
    allow(board).to receive(:place_marker).with('6', 'miss')
    allow(ai_player).to receive(:place_ships)
    allow(ai_player).to receive(:is_hit?) { false }
    allow(ai_player).to receive(:make_move)

    game = Game.new(board, ai_player, counter)
    game.setup

    expect(game.process_move('6')).to eq('miss')
  end

  it 'returns an empty outcome if the game is not over' do
    ai_player = double('AiPlayer')
    counter = double('Counter')
    board = double('Board', marker_board:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>"x",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    allow(board).to receive(:create)
    allow(board).to receive(:create_marker_board)
    allow(ai_player).to receive(:place_ships)
    allow(counter).to receive(:out_of_moves?).and_return(false)
    allow(ai_player).to receive(:all_ships_sunk?).and_return(false)

    game = Game.new(board, ai_player, counter)
    game.setup

    expect(game.outcome).to eq({})
  end

  it "returns an outcome with a 'lose' if out of turns" do
    ai_player = double('AiPlayer')
    counter = double('Counter')
    board = double('Board', marker_board:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>"x",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    allow(board).to receive(:create)
    allow(board).to receive(:create_marker_board)
    allow(ai_player).to receive(:place_ships)
    allow(counter).to receive(:out_of_moves?).and_return(true)
    allow(ai_player).to receive(:all_ships_sunk?).and_return(false)

    game = Game.new(board, ai_player, counter)
    game.setup

    expect(game.outcome).to eq({ gameOutcome: 'lose' })
  end

  it "returns an outcome with a 'win' if game over and turns remain" do
    ai_player = double('AiPlayer')
    counter = double('Counter')
    board = double('Board', marker_board:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>"x",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    allow(board).to receive(:create)
    allow(board).to receive(:create_marker_board)
    allow(ai_player).to receive(:place_ships)
    allow(counter).to receive(:out_of_moves?).and_return(false)
    allow(ai_player).to receive(:all_ships_sunk?).and_return(true)

    game = Game.new(board, ai_player, counter)
    game.setup

    expect(game.outcome).to eq({ gameOutcome: 'win' })
  end
end
