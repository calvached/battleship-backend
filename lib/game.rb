require_relative 'board'

class Game
  HIT_MESSAGE = 'hit'
  MISS_MESSAGE = 'miss'

  WIN_MESSAGE = 'win'
  LOSE_MESSAGE = 'lose'

  def initialize(board, ai_player, counter)
    @board = board
    @ai_player = ai_player
    @counter = counter
  end

  def setup
    board.create
    board.create_marker_board
    ai_player.place_ships
  end

  def current_board
    board.formatted_board
  end

  def available_move?(cell_number)
    board.available_cell?(cell_number)
  end

  def process_move(cell_number)
    status = get_move_status(cell_number)
    ai_player.make_move(cell_number)
    board.place_marker(cell_number, status)

    status
  end

  def get_move_status(cell_number)
    ai_player.is_hit?(cell_number) ? HIT_MESSAGE : MISS_MESSAGE
  end

  def find_move_status(cell_number)
    board.marker_board[cell_number]
  end

  def use_move!
    @counter.use_move!
  end

  def outcome
    if is_win?
      { gameOutcome: WIN_MESSAGE }
    elsif is_lose?
      { gameOutcome: LOSE_MESSAGE }
    else
      {}
    end
  end

  private
  def ai_player
    @ai_player
  end

  def board
    @board
  end

  def is_win?
    @ai_player.all_ships_sunk?
  end

  def is_lose?
    @counter.out_of_moves?
  end
end
