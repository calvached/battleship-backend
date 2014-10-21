require_relative 'human_board'
require_relative 'ai_board'

class Game
  HIT = 'hit'
  MISS = 'miss'
  HINT_WARM = 'You are warm'
  HINT_HOT = 'You are hot'
  HINT_COLD = 'You are cold'
  BATTLESHIP = 'battleship'
  CRUISER = 'cruiser'

  def initialize(board_dimensions)
    @mounted_ships = {
                        'battleship' => ['1', '2', '3', '4'],
                        'cruiser' => ['5', '6', '7', '8'],
                     }
    @human_board = HumanBoard.new(board_dimensions)
  end

  #def setup
  #  human_board.create
  #end

  def current_board
    human_board.gameboard
  end

  def get_feedback(position)
    if ship_name = get_ship_name(position)
      { hitOrMiss: HIT, shipName: ship_name }
    else
      { hitOrMiss: MISS, hint: HINT_COLD }
    end
  end

  def get_ship_name(position)
    @mounted_ships.each do |ship_name, locations|
      return ship_name if locations.include?(position)
    end

    false
  end

  #session['game'].process_player_move(params['move']).to_json

  def update_board(feedback, position)
    human_board.record_move_outcome(feedback, position)
  end

  def get_announcement
    p get_rows(ai_board.gameboard)
    p get_rows(human_board.gameboard)

    Game::HOT
  end

  # if the index of the human_board 'miss' is greater than the index + 1 but less
  # than index + 3 of the ai_board then it is warm

  private
  def ai_board
    @ai_board
  end

  def human_board
    @human_board
  end
end
#   announcer
