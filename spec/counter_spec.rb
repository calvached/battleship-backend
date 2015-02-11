require 'counter'

describe Counter do
  it 'keeps a numerical counter' do
    counter = Counter.new(10)

    expect(counter.tally_counter).to eq(10)
  end

  it 'subtracts 1 from the counter' do
    counter = Counter.new(10)

    counter.use_move!

    expect(counter.tally_counter).to eq(9)
  end

  it 'does not subtract once the counter has reached 0' do
    counter = Counter.new(10)

    15.times do
      counter.use_move!
    end

    expect(counter.tally_counter).to eq(0)
  end

  it 'returns false if the counter has not reached 0' do
    counter = Counter.new(10)

    expect(counter.out_of_moves?).to eq(false)
  end

  it 'returns true if the counter has reached 0' do
    counter = Counter.new(10)

    10.times do
      counter.use_move!
    end

    expect(counter.out_of_moves?).to eq(true)
  end
end
