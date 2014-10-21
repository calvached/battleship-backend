class HumanBoard
  attr_reader :gameboard

  def initialize(dimensions)
    @gameboard = create(dimensions.to_i)
  end

  def create(dimensions)
    @gameboard = create_grid_cells(dimensions).reduce({}) do |board, cell|
      board[cell] = ' '
      board
    end
  end

  def record_move_outcome(status, position)
    @gameboard[position] = status if @gameboard[position] == ' '
  end

  private
  def create_grid_cells(dimensions)
    ('1'.."#{dimensions**2}").to_a
  end
end
