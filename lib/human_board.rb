class HumanBoard
  attr_reader :gameboard

  def initialize(dimensions)
    @dimensions = dimensions
  end

  def create
    @gameboard = create_grid_cells.reduce({}) do |board, cell|
      board[cell] = ' '
      board
    end
  end

  def place_move_outcome(status, position)
    @gameboard[position] = status if @gameboard[position] == ' '
  end

  private
  def create_grid_cells
    ('1'.."#{@dimensions**2}").to_a
  end
end
