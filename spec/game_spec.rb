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

  it "returns a board with a 'hit'" do
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

  it "returns a board with a 'miss'" do
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
    expect(game.get_feedback('1')).to eq('hit')
  end

  it 'returns feedback on a miss' do
    expect(game.get_feedback('9')).to eq('miss')
  end
end
