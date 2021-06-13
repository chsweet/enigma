require 'spec_helper'
require './lib/key_generator'

RSpec.describe KeyGenerator do

  it 'exists' do
    new_key = KeyGenerator.new

    expect(new_key).to be_a(KeyGenerator)
  end

  it 'generates random key' do
    expect(KeyGenerator.random_key.length).to eq(5)
    expect(KeyGenerator.random_key.class).to eq(String)
  end

end
