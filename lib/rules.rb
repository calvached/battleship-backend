class Rules
  def self.find_all_ship_placements_for(board, ship_size)
    (board.all_rows + board.all_columns).reduce([]) do |placements, subspace|
      placements +  find_ship_placements_for(subspace, ship_size)
    end
  end

  def self.find_ship_placements_for(row_or_column, ship_size)
    all_sequences = []

    row_or_column.each_index do |i|
      if within_boundries(ship_size, row_or_column, i)
        sequence = []

        # break out to another method
        0.upto(ship_size - 1) do |num|
          next_space = i + num
          sequence << row_or_column[next_space]
        end

        all_sequences << sequence
      end
    end

    all_sequences
  end

  private
  def self.within_boundries(ship_size, row_or_column, i)
    row_or_column[i + ship_size - 1]
  end
end
