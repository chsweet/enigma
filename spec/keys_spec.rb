require 'spec_helper'
require './lib/keys'

RSpec.describe Keys do

  it 'exists' do
    new_key = Keys.new

    expect(new_key).to be_a(Keys)
  end

  it 'generates random key' do
    new_key = Keys.new

    expect(new_key.random_key.length).to eq(5)
    expect(new_key.random_key.class).to eq(String)
  end

  it 'assigns key to shift' do
    new_key = Keys.new
    allow(new_key).to receive(:random_key).and_return("02715")

    expected = {"A" => 02, "B" => 27, "C" => 71, "D" => 15}

    expect(new_key.key_shift_assignment).to eq(expected)
  end
end
