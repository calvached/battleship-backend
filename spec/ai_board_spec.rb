require 'ai_board'

describe AIBoard do
  let(:board) { AIBoard.new(5) }

  before(:example) do
    board.create
  end

  it 'has a gameboard' do
    expect(board.gameboard).to eq(
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17'=>" ", '18'=>" ", '19'=>" ", '20'=>" ",
        '21'=>" ", '22'=>" ", '23'=>" ", '24'=>" ", '25'=>" "
      }
    )
  end
end
