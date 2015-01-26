class AiPlayer
  def initialize(board, rules, ship_selector)
    @board = board
    @rules = rules
    @ship_selector = ship_selector
    @ship_options = {
                      aircraft_carrier: 5,
                    }
  end

  def place_ships
    @ship_options.each do |ship_name, ship_size|
      mount_to_board(ship_name, ship_size)
    end
  end

  private
  def mount_to_board(ship_name, ship_size)
    select_placement(ship_size).each do |key|
      board.gameboard[key] = ship_name.to_s
    end
  end

  def select_placement(ship_size)
    ship_selector.choose(rules.find_all_ship_placements_for(board, ship_size))
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
