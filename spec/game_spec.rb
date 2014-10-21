require 'game'

describe Game do
  let(:game) { Game.new('5') }

  before(:example) do
    game.setup
  end

  it 'returns the current human player board' do
    expect(game.current_board).to eq(
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17'=>" ", '18'=>" ", '19'=>" ", '20'=>" ",
        '21'=>" ", '22'=>" ", '23'=>" ", '24'=>" ", '25'=>" "
      }
    )
  end

  it "records feedback on a 'hit'" do
    expect(game.get_feedback('4')).to eq({
      hitOrMiss: Game::HIT,
      shipName: Game::BATTLESHIP,
    })
  end

  it "returns 'cold' feedback on a 'miss'" do
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
