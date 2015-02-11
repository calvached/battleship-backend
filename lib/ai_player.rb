class AiPlayer
  attr_reader :ship_placements

  def initialize(board, ship_selector)
    @board = board
    @ship_selector = ship_selector
    @ship_options = {
                      aircraft_carrier: 5,
                    }
    @ship_placements = []
  end

  def place_ships
    @ship_options.each do |ship_name, ship_size|
      mount_to_board(ship_name, ship_size)
    end
  end

  def is_hit?(cell_number)
    @ship_placements.each do |ship_location|
      return true if ship_location.include?(cell_number)
    end

    false
  end

  def make_move(cell_number)
    @ship_placements.each do |ship_location|
      ship_location.delete(cell_number)
    end
  end

  def all_ships_sunk?
    @ship_placements.all? { |ship_location| ship_location.empty? }
  end

  private
  def mount_to_board(ship_name, ship_size)
    @ship_placements << select_placement(ship_size)
  end

  def select_placement(ship_size)
    ship_selector.select(board, ship_size)
  end

  def ship_selector
    @ship_selector
  end

  def rules
    @rules
  end

  def board
    @board
  end
end

# Find all rows and columns (These are all valid ship placements, they are the keys)
# Randomly choose a row or column ([1,2,3,4])
# THEN based on the size of the ship, slice each row and column by that size
#   possible ship placements? ([1,2,3,4]) -> ([1,2], [2,3], [3,4])
#   possible row placements
#   possible column placements
# Then check each space if empty

  # if the index of the human_board 'miss' is greater than the index + 1 but less
  # than index + 3 of the ai_board then it is warm
