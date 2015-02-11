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

    player = AiPlayer.new(board, MockShipSelector)
    player.place_ships

    expect(player.ship_placements).to eq([['1', '6', '11', '16', '21']])
  end

  it 'returns true if cell number is a hit' do
    board = double('Board', gameboard:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    player = AiPlayer.new(board, MockShipSelector)
    player.place_ships

    expect(player.is_hit?('6')).to eq(true)
  end

  it 'returns false if cell number is a miss' do
    board = double('Board', gameboard:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    player = AiPlayer.new(board, MockShipSelector)
    player.place_ships

    expect(player.is_hit?('5')).to eq(false)
  end

  it 'removes a ship placement once a move has been made' do
    board = double('Board', gameboard:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    player = AiPlayer.new(board, MockShipSelector)
    player.place_ships
    player.make_move('6')

    expect(player.ship_placements.first).to eq(['1', '11', '16', '21'])
  end

  it 'returns false if all ships are NOT sunk' do
    board = double('Board', gameboard:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    player = AiPlayer.new(board, MockShipSelector)
    player.place_ships

    player.make_move('1')
    player.make_move('6')
    player.make_move('11')
    player.make_move('16')

    expect(player.all_ships_sunk?).to eq(false)
  end

  it 'returns true if all ships are sunk' do
    board = double('Board', gameboard:
      {
        '1'=>" ", '2'=>" ", '3'=>" ", '4'=>" ", '5'=>" ",
        '6'=>" ", '7'=>" ", '8'=>" ", '9'=>" ", '10'=>" ",
        '11'=>" ", '12'=>" ", '13'=>" ", '14'=>" ", '15'=>" ",
        '16'=>" ", '17' => " ", '18' => " ", '19' => " ", '20' => " ",
        '21' => " ", '22' => " ", '23' => " ", '24' => " ", '25' => " "
      })

    player = AiPlayer.new(board, MockShipSelector)
    player.place_ships

    player.make_move('1')
    player.make_move('6')
    player.make_move('11')
    player.make_move('16')
    player.make_move('21')

    expect(player.all_ships_sunk?).to eq(true)
  end
end
