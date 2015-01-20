require_relative 'ai_board'

class Game

  def initialize(board_dimensions)
    @ai_board = AIBoard.new(board_dimensions)
    @board_dimensions = board_dimensions
  end

  def setup
    ai_board.create
  end

  def current_board
    ai_board.gameboard
  end

  # if the index of the human_board 'miss' is greater than the index + 1 but less
  # than index + 3 of the ai_board then it is warm

  private
  def ai_board
    @ai_board
  end
end
