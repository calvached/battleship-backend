require_relative 'human_board'
require_relative 'ai_board'

class Game
  BOARD_DIMENSIONS = 5
  HIT = 'hit'
  MISS = 'miss'

  def initialize
    @human_board = HumanBoard.new(BOARD_DIMENSIONS)
    @ai_board = AIBoard.new(BOARD_DIMENSIONS)
  end

  def setup
    human_board.create
    ai_board.create
    ai_board.place_ships
  end

  def current_board
    human_board.gameboard
  end

  def get_feedback(position)
    if ai_board.is_hit?(position)
      human_board.record_move_outcome(HIT, position)
      HIT
    else
      human_board.record_move_outcome(MISS, position)
      MISS
    end
  end

  private
  def ai_board
    @ai_board
  end

  def human_board
    @human_board
  end
end

#   announcer
