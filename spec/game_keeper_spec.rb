require 'game_keeper'

describe GameKeeper do
  it 'does not return a game if none is assigned' do
    expect(GameKeeper.current_game).to eq({})
  end

  it 'assigns a game' do
    game = double('Game')
    GameKeeper.current_game = game

    expect(GameKeeper.current_game).to eq(game)
  end
end
