require_relative 'board'

class Game
  HIT_MESSAGE = 'hit'
  MISS_MESSAGE = 'miss'

  WIN_MESSAGE = 'You win'
  LOSE_MESSAGE = 'You lose'

  def initialize(board, ai_player, counter)
    @board = board
    @ai_player = ai_player
    @counter = counter
  end

  def setup
    board.create
    ai_player.place_ships
  end

  def current_board
    board.formatted_board
  end

  def move_status(cell_number)
    if ai_player.is_hit?(cell_number)
      ai_player.make_move(cell_number)

      HIT_MESSAGE
    else
      ai_player.make_move(cell_number)

      MISS_MESSAGE
    end
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
