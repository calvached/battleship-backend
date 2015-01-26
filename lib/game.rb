require_relative 'board'

class Game

  def initialize(board, ai_player)
    @board = board
    @ai_player = ai_player
  end

  def setup
    board.create
    ai_player.place_ships
  end

  def current_board
    board.gameboard
  end

  private
  def ai_player
    @ai_player
  end
  def board
    @board
  end
end
