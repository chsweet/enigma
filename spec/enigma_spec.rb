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

  it 'creates todays date DDMMYY' do
    expect(@enigma.todays_date).to eq("110621")
  end

  it '.offsets_shift_assignment' do
    expected = {"A" => 1, "B" => 0, "C" => 2, "D" => 5}

    expect(@enigma.offsets_shift_assignment("040895")).to eq(expected)
  end

  it 'combines key and offset shift assignments' do
    expected_1 = {"A" => 02, "B" => 27, "C" => 71, "D" => 15}
    expected_2 = {"A" => 1, "B" => 0, "C" => 2, "D" => 5}

    allow(@enigma).to receive(:key_shift_assignment).and_return(expected_1)
    allow(@enigma).to receive(:offsets_shift_assignment).and_return(expected_2)

    expected_3 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}

    expect(@enigma.final_shifts).to eq(expected_3)
  end

  it 'assigns index to each character' do
    message = "hello world"

    expected = {0 => "h", 1 => "e", 2 => "l", 3 => "l", 4 => "o", 5 => " ", 6 => "w", 7 => "o", 8 => "r", 9 => "l", 10 => "d"}

    expect(@enigma.message_with_index(message)).to eq(expected)
  end

end
