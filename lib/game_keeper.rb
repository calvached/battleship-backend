class GameKeeper
  def self.current_game
    @game ||= {}
  end

  def self.current_game=(new_game)
    @game = new_game
  end

  def self.current_board
    @game.current_board
  end

  def self.move_status(cell_number)
    @game.move_status(cell_number)
  end

  def self.use_move!
    @game.use_move!
  end

  def self.game_outcome
    @game.outcome
  end
end
