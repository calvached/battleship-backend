require 'game'
require 'mock_board'

describe Game do
  it "returns a 'hit' status when given a cell number" do
    ai_player = double('AiPlayer')

    allow(ai_player).to receive(:place_ships)
    allow(ai_player).to receive(:is_hit?) { true }

    game = Game.new(MockBoard.new('5'), ai_player)
    game.setup


    expect(game.get_status('5')).to eq('hit')
  end

  it "returns a 'miss' status when given a cell number" do
    ai_player = double('AiPlayer')

    allow(ai_player).to receive(:place_ships)
    allow(ai_player).to receive(:is_hit?) { false }

    game = Game.new(MockBoard.new('5'), ai_player)
    game.setup


    expect(game.get_status('6')).to eq('miss')
  end
end
