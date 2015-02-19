require 'game_keeper'

describe GameKeeper do

  after(:example) do
    GameKeeper.current_game = nil
  end

  it 'does not return a game if none is assigned' do
    expect(GameKeeper.current_game).to eq({})
  end

  it 'assigns a game' do
    game = double('Game')
    GameKeeper.current_game = game

    expect(GameKeeper.current_game).to eq(game)
  end

  it 'returns the current board' do
    game = double('Game', :current_board => [
      {id: 1}, {id: 2}, {id: 3}, {id: 4},
      {id: 5}, {id: 6}, {id: 7}, {id: 8},
      {id: 9}, {id: 10}, {id: 11}, {id: 12},
      {id: 13}, {id: 14}, {id: 15}, {id: 16}
    ])

    GameKeeper.current_game = game

    expect(GameKeeper.current_board).to eq([
      {id: 1}, {id: 2}, {id: 3}, {id: 4},
      {id: 5}, {id: 6}, {id: 7}, {id: 8},
      {id: 9}, {id: 10}, {id: 11}, {id: 12},
      {id: 13}, {id: 14}, {id: 15}, {id: 16}
    ])
  end

  it 'processes a move' do
    game = double('Game')
    allow(game).to receive(:process_move).with('3').and_return({ gameOutcome: 'hit' })

    GameKeeper.current_game = game

    expect(GameKeeper.process_move('3')).to eq({ gameOutcome: 'hit' })
  end

  it 'uses a move' do
    game = double('Game')
    allow(game).to receive(:use_move!)

    GameKeeper.current_game = game
    GameKeeper.use_move!

    expect(game).to have_received(:use_move!)
  end

  it 'returns a game outcome' do
    game = double('Game')
    allow(game).to receive(:outcome)

    GameKeeper.current_game = game
    GameKeeper.game_outcome

    expect(game).to have_received(:outcome)
  end

  it 'finds a move status' do
    game = double('Game')
    allow(game).to receive(:find_move_status).with('2').and_return('hit')

    GameKeeper.current_game = game
    GameKeeper.find_move_status('2')

    expect(game).to have_received(:find_move_status)
  end

  it 'checks if a move is available' do
    game = double('Game')
    allow(game).to receive(:available_move?).with('2').and_return(true)

    GameKeeper.current_game = game
    GameKeeper.available_move?('2')

    expect(game).to have_received(:available_move?)
  end
end
