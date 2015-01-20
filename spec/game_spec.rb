require 'game'

describe Game do
  let(:game) { Game.new('5') }

  before(:example) do
    game.setup
  end

  xit "records feedback on a 'hit'" do
    expect(game.get_feedback('4')).to eq({
      hitOrMiss: Game::HIT,
      shipName: Game::BATTLESHIP,
    })
  end

  xit "returns 'cold' feedback on a 'miss'" do
    expect(game.get_feedback('25')).to eq({
      hitOrMiss: Game::MISS,
      hint: Game::HINT_COLD
    })
  end

  xit "returns 'hot' feedback on a 'miss'" do
    expect(game.get_feedback('9')).to eq({
      hitOrMiss: Game::MISS,
      hint: Game::HINT_HOT
    })
  end
end
