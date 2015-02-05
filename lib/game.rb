require_relative 'board'

class Game
  HIT_MESSAGE = 'hit'
  MISS_MESSAGE = 'miss'

  def initialize(board, ai_player)
    @board = board
    @ai_player = ai_player
  end

  def setup
    board.create
    ai_player.place_ships
  end

  def current_board
    board.formatted_board
  end

  def get_status(cell_number)
    if ai_player.is_hit?(cell_number)
      HIT_MESSAGE
    else
      MISS_MESSAGE
    end
  end

  private
  def ai_player
    @ai_player
  end
  def board
    @board
  end
end
