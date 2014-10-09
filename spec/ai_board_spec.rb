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

  it 'places a ship on the board' do
    board.place_ships

    expect(board.gameboard).to eq(
      {"1"=>"s", "2"=>"s", "3"=>"s", "4"=>"s", "5"=>" ",
       "6"=>" ", "7"=>" ", "8"=>" ", "9"=>" ", "10"=>" ",
       "11"=>" ", "12"=>" ", "13"=>" ", "14"=>" ", "15"=>" ",
       "16"=>" ", "17"=>" ", "18"=>" ", "19"=>" ", "20"=>" ",
       "21"=>" ", "22"=>" ", "23"=>" ", "24"=>" ", "25"=>" "}
    )
  end

  it 'returns true if a cell contains part of a ship' do
    board.place_ships

    expect(board.is_hit?('1')).to eq(true)
  end

  it 'returns false if a cell does not contain part of a ship' do
    board.place_ships

    expect(board.is_hit?('9')).to eq(false)
  end
end
