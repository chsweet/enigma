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

  it 'can encrypt a message with key and date given' do
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }
    expect(@enigma.encrypt("HELLO world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with key and date given' do
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'returns todays date' do
    expect(@enigma.todays_date.length).to eq(6)
    expect(@enigma.todays_date.class).to eq(String)
  end

  it 'can assign new character' do
    message = "hello world"

    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expect(@enigma.message_with_alphabet_index(message)).to eq(expected)
  end

  it 'creates alphabet for shift A' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected_2 = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c"]

    expect(@enigma.encrypted_alphabet_a(@shift)).to eq(expected_2)
  end

  it 'creates alphabet for shift B' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(@enigma.encrypted_alphabet_b(@shift)).to eq(expected)
  end

  it 'creates alphabet for shift C' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]

    expect(@enigma.encrypted_alphabet_c(@shift)).to eq(expected)
  end

  it 'creates alphabet for shift D' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"]

    expect(@enigma.encrypted_alphabet_d(@shift)).to eq(expected)
  end

  it 'returns encrypted message' do
    message = "hello world"
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)


    expect(@enigma.encrypted_string(message, @shift)).to eq("keder ohulw")
  end

  it 'returns decrypted message' do
    message = "keder ohulw"
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)


    expect(@enigma.decrypted_string(message, @shift)).to eq("hello world")
  end

end
