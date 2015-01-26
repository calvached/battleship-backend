require 'game'

describe Game do
  let(:game) { Game.new('5') }

  before(:example) do
    game.setup
  end

  # expect Game to have Board and board dimensions
end
