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

  it 'returns todays date' do
    expect(@enigma.todays_date.length).to eq(6)
    expect(@enigma.todays_date.class).to eq(String)
  end

  it 'can encrypt a message with key and date given' do
    expected = {
                encryption: "keder ohulw!",
                key: "02715",
                date: "040895"
                }
    expect(@enigma.encrypt("HELLO world!", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with key and date given' do
    expected = {
                decryption: "hello! world*",
                key: "02715",
                date: "040895"
                }
    expect(@enigma.decrypt("keder! ohulw*", "02715", "040895")).to eq(expected)
  end

  it 'returns array of original message alphabet index position' do
    message = "hello! world!"

    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expect(@enigma.message_with_alphabet_index(message)).to eq(expected)
  end

  it 'returns orignal index position and char for special characters' do
    message = "hello! world*"

    expected = {5 => "!", 12 => "*"}

    expect(@enigma.original_message_special_characters(message)).to eq(expected)
  end

  it 'returns encrypted message array' do
    message = "hello world"
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)


    expect(@enigma.encrypted_message_array(message, @shift)).to eq(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"])
  end

  it 'returns final encrypted message' do
    message = "hello! world*"
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expect(@enigma.final_encrypted_message(message, @shift)).to eq("keder! ohulw*")
  end

  it 'returns decrypted message array' do
    message = "keder! ohulw*"
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)


    expect(@enigma.decrypted_message_array(message, @shift)).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
  end

  it 'returns final decrypted message' do
    message = "keder! ohulw*"
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expect(@enigma.final_decrypted_message(message, @shift)).to eq("hello! world*")
  end

  it 'creates encrypted alphabet for shift A' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected_2 = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c"]

    expect(@enigma.encrypted_alphabet_a(@shift)).to eq(expected_2)
  end

  it 'creates encrypted alphabet for shift B' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(@enigma.encrypted_alphabet_b(@shift)).to eq(expected)
  end

  it 'creates encrypted alphabet for shift C' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]

    expect(@enigma.encrypted_alphabet_c(@shift)).to eq(expected)
  end

  it 'creates encrypted alphabet for shift D' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"]

    expect(@enigma.encrypted_alphabet_d(@shift)).to eq(expected)
  end

  it 'creates decrypted alphabet for shift A' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected_2 = ["y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x"]

    expect(@enigma.decrypted_alphabet_a(@shift)).to eq(expected_2)
  end

  it 'creates decrypted alphabet for shift B' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(@enigma.decrypted_alphabet_b(@shift)).to eq(expected)
  end

  it 'creates decrypted alphabet for shift C' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h"]

    expect(@enigma.decrypted_alphabet_c(@shift)).to eq(expected)
  end

  it 'creates decrypted alphabet for shift D' do
    @shift = Shifts.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(@shift).to receive(:final_shifts).and_return(expected_1)

    expected = ["h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g"]

    expect(@enigma.decrypted_alphabet_d(@shift)).to eq(expected)
  end
end
