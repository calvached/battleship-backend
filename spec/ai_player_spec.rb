require 'mock_ship_selector'
require 'ai_player'

describe AiPlayer do
  it 'places a ship randomly on a board' do
    board = double('Board', gameboard:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    rules = double('Rules')

    allow(rules).to receive(:find_all_ship_placements_for).with(board, 5).and_return([
      ['1', '6', '11', '16', '21'],
      ['1', '2', '3', '4', '5'],
      ['11', '12', '13', '14', '15'],
      ['4', '9', '14', '19', '24']
    ])

    player = AiPlayer.new(board, rules, MockShipSelector)
    player.place_ships

    expect(board.gameboard['1']).to eq('aircraft_carrier')
    expect(board.gameboard['6']).to eq('aircraft_carrier')
    expect(board.gameboard['11']).to eq('aircraft_carrier')
    expect(board.gameboard['16']).to eq('aircraft_carrier')
    expect(board.gameboard['21']).to eq('aircraft_carrier')
  end
end
