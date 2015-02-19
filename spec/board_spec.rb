require 'board'

describe Board do
  let(:board) { Board.new('5') }

  before(:example) do
    board.create
    board.create_marker_board
  end

  it 'has a gameboard' do
    expect(board.gameboard).to eq(
      {
        "1"=>:id, "2"=>:id, "3"=>:id, "4"=>:id, "5"=>:id,
        "6"=>:id, "7"=>:id, "8"=>:id, "9"=>:id, "10"=>:id,
        "11"=>:id, "12"=>:id, "13"=>:id, "14"=>:id, "15"=>:id,
        "16"=>:id, "17"=>:id, "18"=>:id, "19"=>:id, "20"=>:id,
        "21"=>:id, "22"=>:id, "23"=>:id, "24"=>:id, "25"=>:id
      }
    )
  end

  it 'returns a formatted board' do
    expect(board.formatted_board).to eq(
      [
        {:id=>"1"}, {:id=>"2"}, {:id=>"3"}, {:id=>"4"}, {:id=>"5"},
        {:id=>"6"}, {:id=>"7"}, {:id=>"8"}, {:id=>"9"}, {:id=>"10"},
        {:id=>"11"}, {:id=>"12"}, {:id=>"13"}, {:id=>"14"}, {:id=>"15"},
        {:id=>"16"}, {:id=>"17"}, {:id=>"18"}, {:id=>"19"}, {:id=>"20"},
        {:id=>"21"}, {:id=>"22"}, {:id=>"23"}, {:id=>"24"}, {:id=>"25"}
      ]
    )
  end

  it 'finds all rows' do
    expect(board.all_rows).to eq([
      ["1", "2", "3", "4", "5"],
      ["6", "7", "8", "9", "10"],
      ["11", "12", "13", "14", "15"],
      ["16", "17", "18", "19", "20"],
      ["21", "22", "23", "24", "25"]
    ])
  end

  it 'finds all columns' do
    expect(board.all_columns).to eq([
      ["1", "6", "11", "16", "21"],
      ["2", "7", "12", "17", "22"],
      ["3", "8", "13", "18", "23"],
      ["4", "9", "14", "19", "24"],
      ["5", "10", "15", "20", "25"]
    ])
  end

  it 'places a marker on a cell' do
    board.place_marker('6', 'hit')

    expect(board.marker_board['6']).to eq('hit')
  end

  it "returns true if a cell is available" do
    expect(board.available_cell?('5')).to eq(true)
  end

  it "returns false if a cell is unavailable" do
    board.place_marker('6', 'hit')

    expect(board.available_cell?('6')).to eq(false)
  end
end
