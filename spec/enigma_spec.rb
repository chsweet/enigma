require 'spec_helper'
require 'date'
require './lib/key_generator'
require './lib/date'
require './lib/shifts'
require './lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  xit 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq("keder ohulw")
  end

  xit 'can decrypt a message' do
    expect(@enigma.encrypt("keder ohulw")).to eq("hello world")
  end
end
