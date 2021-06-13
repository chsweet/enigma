require 'spec_helper'
require 'date'
require './lib/key_generator'
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

  it 'can assign new character' do
    message = "hello world"

    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expect(@enigma.message_with_alphabet_index(message)).to eq(expected)
  end

  it 'creates alphabet for shift A' do
    expected = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c"]

    expect(@enigma.alphabet_a).to eq(expected)
  end

  it 'creates alphabet for shift B' do
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(@enigma.alphabet_b).to eq(expected)
  end

  it 'creates alphabet for shift C' do
    expected = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]

    expect(@enigma.alphabet_c).to eq(expected)

  end

  it 'creates alphabet for shift D' do
    expected = ["u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"]

    expect(@enigma.alphabet_d).to eq(expected)
  end

  it 'encrypts message sklfjlsfk ' do
    expected_1 = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    allow(@enigma).to receive(:message_with_alphabet_index).and_return(expected_1)

    expect(@enigma.encryped_string).to eq("keder ohulw")
  end

end
