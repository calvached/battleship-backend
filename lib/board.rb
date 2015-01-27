class Board
  attr_accessor :ship_placements
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

  def formatted_board
    @gameboard.reduce([]) {|cells, (k, v)| cells << {k => v} }
  end

  def all_rows
    gameboard.keys.each_slice(@dimensions).to_a
  end

  def all_columns
    all_rows.transpose
  end

  private
  def create_grid_cells
    ('1'.."#{@dimensions**2}").to_a
  end
end
