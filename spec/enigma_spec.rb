require 'spec_helper'
require 'date'
require './lib/keys'
require './lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  xit 'assigns index to each character' do
    message = "hello world"

    expected = {0 => "h", 1 => "e", 2 => "l", 3 => "l", 4 => "o", 5 => " ", 6 => "w", 7 => "o", 8 => "r", 9 => "l", 10 => "d"}

    expect(@enigma.message_with_index(message)).to eq(expected)
  end

  xit 'it assigns each index to a shift letter' do
    expected_1 = {0 => "h", 1 => "e", 2 => "l", 3 => "l", 4 => "o", 5 => " ", 6 => "w", 7 => "o", 8 => "r", 9 => "l", 10 => "d"}
    expected_2 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}

    allow(@enigma).to receive(:message_with_index).and_return(expected_1)
    allow(@enigma).to receive(:final_shifts).and_return(expected_2)


    expect(@enigma.message_with_shift).to eq(expected_2)
  end

  xit 'assigns each character to index' do
    expect(@enigma.character_set_with_index.length).to eq(27)
  end

  it 'assigns message to char index' do
    message = "hello world"

  end

end
