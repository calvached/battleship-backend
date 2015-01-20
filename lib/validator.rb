class Validator
  MIN_BOARD_SIZE = 4
  MAX_BOARD_SIZE = 10

  def self.validate_board_size(input)
    is_numeric?(input) && input.to_i >= MIN_BOARD_SIZE && input.to_i <= MAX_BOARD_SIZE
  end

  private
  def self.is_numeric?(input)
    input.to_i.class == Fixnum
  end
end
