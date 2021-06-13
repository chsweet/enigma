require 'date'

class Enigma
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = KeyGenerator.random_key, date = Date.todays_date)
    hash = Hash.new
  end

  def decrypt(encrypted_message, key, date = Date.todays_date)
    hash = Hash.new
  end

end
