require 'board'

describe Board do
  let(:board) { Board.new(4) }

  before(:example) do
    board.create
  end

  it 'has a gameboard' do
    expect(board.gameboard).to eq(
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ",
        '5'=>" ", '6'=>" ", '7'=>" ", '8'=>" ",
        '9'=>" ", '10'=>" ", '11'=>" ", '12'=>" ",
        '13'=>" ", '14'=>" ", '15'=>" ",'16'=>" "
      }
    )
  end

  it 'returns a formatted board' do
    expect(board.formatted_board).to eq(
      [
        {'1'=>" "}, {'2'=>" "}, {'3'=>" "}, {'4'=>" "},
        {'5'=>" "}, {'6'=>" "}, {'7'=>" "}, {'8'=>" "},
        {'9'=>" "}, {'10'=>" "}, {'11'=>" "}, {'12'=>" "},
        {'13'=>" "}, { '14'=>" "}, {'15'=>" "}, {'16'=>" "}
      ]
    )
  end

  it 'finds all rows' do
    expect(board.all_rows).to eq([
      ['1', '2', '3', '4'],
      ['5', '6', '7', '8'],
      ['9', '10', '11', '12'],
      ['13', '14', '15', '16']
    ])
  end

  it 'finds all columns' do
    expect(board.all_columns).to eq([
      ['1', '5', '9', '13'],
      ['2', '6', '10', '14'],
      ['3', '7', '11', '15'],
      ['4', '8', '12', '16']
    ])
  end
end
