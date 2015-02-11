require 'game'
require 'mock_board'

describe Game do
  it "returns a 'hit' status when given a cell number" do
    ai_player = double('AiPlayer')
    counter = double('Counter')

    allow(ai_player).to receive(:place_ships)
    allow(ai_player).to receive(:is_hit?) { true }
    allow(ai_player).to receive(:make_move)

    game = Game.new(MockBoard.new('5'), ai_player, counter)
    game.setup

    expect(game.move_status('5')).to eq('hit')
  end

  it "returns a 'miss' status when given a cell number" do
    ai_player = double('AiPlayer')
    counter = double('Counter')

    allow(ai_player).to receive(:place_ships)
    allow(ai_player).to receive(:is_hit?) { false }
    allow(ai_player).to receive(:make_move)

    game = Game.new(MockBoard.new('5'), ai_player, counter)
    game.setup

    expect(game.move_status('6')).to eq('miss')
  end

  it 'returns an empty outcome if the game is not over' do
    ai_player = double('AiPlayer')
    counter = double('Counter')

    allow(ai_player).to receive(:place_ships)
    allow(counter).to receive(:out_of_moves?).and_return(false)
    allow(ai_player).to receive(:all_ships_sunk?).and_return(false)

    game = Game.new(MockBoard.new('5'), ai_player, counter)
    game.setup

    expect(game.outcome).to eq({})
  end

  it "returns an outcome with a 'You lose' if out of turns" do
    ai_player = double('AiPlayer')
    counter = double('Counter')

    allow(ai_player).to receive(:place_ships)
    allow(counter).to receive(:out_of_moves?).and_return(true)
    allow(ai_player).to receive(:all_ships_sunk?).and_return(false)

    game = Game.new(MockBoard.new('5'), ai_player, counter)
    game.setup

    expect(game.outcome).to eq({ gameOutcome: 'You lose' })
  end

  it "returns an outcome with a 'You win' if game over and turns remain" do
    ai_player = double('AiPlayer')
    counter = double('Counter')

    allow(ai_player).to receive(:place_ships)
    allow(counter).to receive(:out_of_moves?).and_return(false)
    allow(ai_player).to receive(:all_ships_sunk?).and_return(true)

    game = Game.new(MockBoard.new('5'), ai_player, counter)
    game.setup

    expect(game.outcome).to eq({ gameOutcome: 'You win' })
  end
end
