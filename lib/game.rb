require_relative 'human_board'
require_relative 'ai_board'

class Game
  BOARD_DIMENSIONS = 5
  HIT = 'hit'
  MISS = 'miss'
  WARM = 'You are warm'
  HOT = 'You are hot'

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
      HIT
    else
      MISS
    end
  end

  #session['game'].process_player_move(params['move']).to_json

  def update_board(feedback, position)
    human_board.record_move_outcome(feedback, position)
  end

  def get_announcement
    p get_rows(ai_board.gameboard)
    p get_rows(human_board.gameboard)

    Game::HOT
  end

  def ship_row_locations
    get_rows(ai_board.gameboard).reduce([]) do |ship_rows, row|
      p 'ROW'
      p row
    end
  end

  def get_rows(gameboard)
    gameboard.values.each_slice(BOARD_DIMENSIONS).to_a
  end

  # if the index of the human_board 'miss' is greater than the index + 1 but less
  # than index + 3 of the ai_board then it is warm

  private
  def ai_board
    @ai_board
  end

  def human_board
    @human_board
  end
end

#   announcer
