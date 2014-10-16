class AIBoard
  attr_reader :gameboard

  def initialize(dimensions)
    @dimensions = dimensions.to_i
  end

  def create
    @gameboard = create_grid_cells.reduce({}) do |board, cell|
      board[cell] = ' '
      board
    end
  end

  def place_ships
    @gameboard['1'] = 's'
    @gameboard['2'] = 's'
    @gameboard['3'] = 's'
    @gameboard['4'] = 's'
  end

  def is_hit?(position)
    @gameboard[position] == 's' ? true : false
  end

  private
  def create_grid_cells
    ('1'.."#{@dimensions**2}").to_a
  end
end
