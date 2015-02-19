class Board
  attr_reader :gameboard, :dimensions, :marker_board

  def initialize(dimensions)
    @dimensions = dimensions.to_i
  end

  def create_marker_board
    @marker_board = create_grid_cells.reduce({}) do |board, cell|
      board[cell] = ' '
      board
    end
  end

  def create
    @gameboard = create_grid_cells.reduce({}) do |board, cell|
      board[cell] = :id
      board
    end
  end

  def formatted_board
    @gameboard.reduce([]) {|cells, (k, v)| cells << {v => k} }
  end

  def place_marker(cell_number, status)
    @marker_board[cell_number] = status
  end

  def available_cell?(cell_number)
    @marker_board[cell_number] == ' '
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
