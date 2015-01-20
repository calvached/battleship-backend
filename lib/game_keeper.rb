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

  def self.get_feedback(position)
    @game.get_feedback(position)
  end
end
