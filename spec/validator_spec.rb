require 'validator'

describe Validator do
  it 'returns true if input is valid' do
    expect(Validator.validate_board_size('5')).to eq(true)
    expect(Validator.validate_board_size('7')).to eq(true)
    expect(Validator.validate_board_size('10')).to eq(true)
  end

  it 'returns false if input is out of range for a board size' do
    expect(Validator.validate_board_size('3')).to eq(false)
    expect(Validator.validate_board_size('11')).to eq(false)
  end

  it 'returns false if input is not an integer' do
    expect(Validator.validate_board_size('1b')).to eq(false)
    expect(Validator.validate_board_size('b')).to eq(false)
    expect(Validator.validate_board_size('#')).to eq(false)
  end
end
