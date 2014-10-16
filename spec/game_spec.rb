require 'game'

describe Game do
  let(:game) { Game.new }

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
    game.get_feedback('4')

    expect(game.current_board).to eq(
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>"hit", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17'=>" ", '18'=>" ", '19'=>" ", '20'=>" ",
        '21'=>" ", '22'=>" ", '23'=>" ", '24'=>" ", '25'=>" "
      }
    )
  end

  it "records feedback on a 'miss'" do
    game.get_feedback('13')

    expect(game.current_board).to eq(
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>"miss", '14'=>" ", '15'=>" ",
        '16'=>" ", '17'=>" ", '18'=>" ", '19'=>" ", '20'=>" ",
        '21'=>" ", '22'=>" ", '23'=>" ", '24'=>" ", '25'=>" "
      }
    )
  end

  it 'returns feedback on a hit' do
    expect(game.get_feedback('1')).to eq(Game::HIT)
  end

  it 'returns feedback on a miss' do
    expect(game.get_feedback('9')).to eq(Game::MISS)
  end

  it 'returns the row location of each ship' do
    expect(game.ship_row_locations).to eq([1])
  end

  xit "gives a 'hot' announcement" do
    game.get_feedback('9')

    expect(game.get_announcement).to eq(Game::HOT)
  end

  xit "gives a 'warm' announcement" do
    game.get_feedback('12')

    expect(game.get_announcement).to eq(Game::WARM)
  end

  xit "gives a 'cold' announcement" do
    game.get_feedback('25')

    expect(game.get_announcement).to eq(Game::COLD)
  end
end
