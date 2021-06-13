require 'date'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = KeyGenerator.random_key, date = Date::today)
    hash = Hash.new
  end

  def decrypt(encrypted_message, key, date = Date::today)
    hash = Hash.new
  end

  def message_with_alphabet_index(message)
    message_with_alphabet_index = []
    message.each_char do |char|
      message_with_alphabet_index << @alphabet.index(char)
    end
    message_with_alphabet_index
  end

  def alphabet_a
    @alphabet.rotate(3)
  end

  def alphabet_b
    @alphabet.rotate(27)
  end

  def alphabet_c
    @alphabet.rotate(73)
  end

  def alphabet_d
    @alphabet.rotate(20)
  end

  def encryped_string
    message_with_alphabet_index.map.with_index do |number, index|
      if (index + 1) % 4 == 1
        alphabet_a[number]
      elsif (index +1) % 4 == 2
        alphabet_b[number]
      elsif (index + 1) % 4 == 3
        alphabet_c[number]
      elsif (index + 1) % 4 == 0
        alphabet_d[number]
      end
    end.join
  end

end
