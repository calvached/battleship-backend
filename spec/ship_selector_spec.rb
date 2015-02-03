require 'ship_selector'

describe ShipSelector do
  it 'finds all the possible placements available in a row/column for a destroyer' do
    row = ['1', '2', '3', '4', '5']
    column = ['1', '6', '11', '16', '21']

    expect(ShipSelector.find_ship_placements_for(row, 2)).to eq([
      ['1', '2'],
      ['2', '3'],
      ['3', '4'],
      ['4', '5']
    ])

    expect(ShipSelector.find_ship_placements_for(column, 2)).to eq([
      ['1', '6'],
      ['6', '11'],
      ['11', '16'],
      ['16', '21']
    ])
  end

  it 'finds all the possible placements available in a row for an aircraft carrier' do
    row = ['1', '2', '3', '4', '5']
    column = ['1', '6', '11', '16', '21']

    expect(ShipSelector.find_ship_placements_for(row, 5)).to eq([
      ['1', '2', '3', '4', '5']
    ])

    expect(ShipSelector.find_ship_placements_for(column, 5)).to eq([
      ['1', '6', '11', '16', '21']
    ])
  end

  it 'finds all possible placements for a destroyer on a given board' do
    board = double('Board', gameboard: {})
    allow(board).to receive(:all_rows).and_return([
      ['1', '2', '3', '4'],
      ['5', '6', '7', '8'],
      ['9', '10', '11', '12'],
      ['13', '14', '15', '16']
    ])

    allow(board).to receive(:all_columns).and_return([
      ['1', '5', '9', '13'],
      ['2', '6', '10', '14'],
      ['3', '7', '11', '15'],
      ['4', '8', '12', '16']
    ])

    expect(ShipSelector.find_all_ship_placements_for(board, 2)).to eq([
      ['1', '2'],['2', '3'],['3', '4'],
      ['5', '6'],['6', '7'],['7', '8'],
      ['9', '10'],['10', '11'],['11', '12'],
      ['13', '14'],['14', '15'],['15', '16'],
      ['1', '5'],['5', '9'],['9', '13'],
      ['2', '6'],['6', '10'],['10', '14'],
      ['3', '7'],['7', '11'],['11', '15'],
      ['4', '8'],['8', '12'],['12', '16']
    ])
  end
end
