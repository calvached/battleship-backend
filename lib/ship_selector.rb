class ShipSelector
  def self.select(board, ship_size)
    find_all_ship_placements_for(board, ship_size).sample
  end

  private
  def self.find_all_ship_placements_for(board, ship_size)
    (board.all_rows + board.all_columns).reduce([]) do |placements, subspace|
      placements +  find_ship_placements_for(subspace, ship_size)
    end
  end

  def self.find_ship_placements_for(row_or_column, ship_size)
    all_sequences = []

    row_or_column.each_index do |i|
      if within_boundries(ship_size, row_or_column, i)
        all_sequences << build_ship_sequence(ship_size, row_or_column, i)
      end
    end

    all_sequences
  end

  def self.build_ship_sequence(ship_size, row_or_column, i)
    sequence = []

    0.upto(ship_size - 1) do |num|
      next_space = i + num
      sequence << row_or_column[next_space]
    end

    sequence
  end

  def self.within_boundries(ship_size, row_or_column, i)
    row_or_column[i + ship_size - 1]
  end
end
