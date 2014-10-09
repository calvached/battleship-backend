require 'human_board'

describe HumanBoard do
  let(:board) { HumanBoard.new(5) }

  before(:example) do
    board.create
  end

  it 'creates a board' do
    expect(board.gameboard.size).to eq(25)
  end

  it 'returns a gameboard' do
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

  it "places a letter on the board" do
    board.place_move_outcome('h', '5')

    expect(board.gameboard['5']).to eq('h')
  end

  it "doesn't overwrite a letter that has already been placed" do
    board.place_move_outcome('h', '5')
    board.place_move_outcome('m', '5')

    expect(board.gameboard['5']).to eq('h')
  end
end
