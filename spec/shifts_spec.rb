require 'spec_helper'
require './lib/keys'
require './lib/shifts'

RSpec.describe Shifts do
  before :each do
    @shifts = Shifts.new
    allow(@shifts).to receive(:key).and_return("02715")
    allow(@shifts).to receive(:date).and_return("040895")
  end

  it 'exists' do
    expect(@shifts).to be_a(Shifts)
  end

  it 'assigns key to shift' do
    expected = {"A" => 02, "B" => 27, "C" => 71, "D" => 15}

    expect(@shifts.key_shift_assignment).to eq(expected)
  end

  it '.offsets_shift_assignment' do
    expected = {"A" => 1, "B" => 0, "C" => 2, "D" => 5}

    expect(@shifts.offsets_shift_assignment).to eq(expected)
  end

  it 'combines key and offset shift assignments' do
    expected_1 = {"A" => 02, "B" => 27, "C" => 71, "D" => 15}
    expected_2 = {"A" => 1, "B" => 0, "C" => 2, "D" => 5}

    allow(@shifts).to receive(:key_shift_assignment).and_return(expected_1)
    allow(@shifts).to receive(:offsets_shift_assignment).and_return(expected_2)

    expected_3 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}

    expect(@shifts.final_shifts).to eq(expected_3)
  end

end
