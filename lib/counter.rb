class Counter
  attr_reader :tally_counter

  def initialize(initial_count)
    @tally_counter = initial_count
  end

  def use_move!
    @tally_counter -= 1 if @tally_counter > 0
  end

  def out_of_moves?
    @tally_counter == 0
  end
end
