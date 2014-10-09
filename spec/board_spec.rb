require 'board'

describe Board do
  let(:board) { Board.new(5) }

  it 'creates a board' do
    board.create

    expect(board.gameboard.size).to eq(25)
  end

  it 'returns a gameboard' do
    board.create

    expect(board.gameboard).to eq(
      {
        1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ",
        6=>" ", 7=>" ", 8=>" ", 9=>" ", 10=>" ",
        11=>" ", 12=>" ", 13=>" ", 14=>" ", 15=>" ",
        16=>" ", 17=>" ", 18=>" ", 19=>" ", 20=>" ",
        21=>" ", 22=>" ", 23=>" ", 24=>" ", 25=>" "
      }
    )
  end
end
