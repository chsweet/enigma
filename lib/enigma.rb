require 'date'
require './lib/key_generator'
require './lib/shifts'

class Enigma

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key=nil, date=nil)
    @message = message.downcase
    @key = key || KeyGenerator.random_key
    @date = date || todays_date
    @shift = Shifts.new(@key, @date)
    message_with_alphabet_index(@message)
    encrypted = {
                  encryption: encrypted_string(@message, @shift),
                  key: @key,
                  date: @date
                }
  end

  def decrypt(message, key, date=nil)
    @message = message.downcase
    @key = key || KeyGenerator.random_key
    @date = date || todays_date
    @shift = Shifts.new(@key, @date)
    message_with_alphabet_index(@message)
    decrypted = {
                  decryption: decrypted_string(@message, @shift),
                  key: @key,
                  date: @date
                }
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def message_with_alphabet_index(message)
    message_alphabet_index = []
    message.each_char do |char|
      message_alphabet_index << @alphabet.index(char)
    end
    message_alphabet_index
  end

  def encrypted_alphabet_a(shift)
    number = shift.final_shifts["A"]
    @alphabet.rotate(number)
  end

  def encrypted_alphabet_b(shift)
    number = shift.final_shifts["B"]
    @alphabet.rotate(number)
  end

  def encrypted_alphabet_c(shift)
    number = shift.final_shifts["C"]
    @alphabet.rotate(number)
  end

  def encrypted_alphabet_d(shift)
    number = shift.final_shifts["D"]
    @alphabet.rotate(number)
  end

  def decrypted_alphabet_a(shift)
    number = shift.final_shifts["A"]
    @alphabet.rotate(-number)
  end

  def decrypted_alphabet_b(shift)
    number = shift.final_shifts["B"]
    @alphabet.rotate(-number)
  end

  def decrypted_alphabet_c(shift)
    number = shift.final_shifts["C"]
    @alphabet.rotate(-number)
  end

  def decrypted_alphabet_d(shift)
    number = shift.final_shifts["D"]
    @alphabet.rotate(-number)
  end

  def encrypted_string(message, shift)
    message_with_alphabet_index(message).map.with_index do |number, index|
      if (index + 1) % 4 == 1
        encrypted_alphabet_a(shift)[number]
      elsif (index +1) % 4 == 2
        encrypted_alphabet_b(shift)[number]
      elsif (index + 1) % 4 == 3
        encrypted_alphabet_c(shift)[number]
      elsif (index + 1) % 4 == 0
        encrypted_alphabet_d(shift)[number]
      end
    end.join
  end

  def decrypted_string(message, shift)
    message_with_alphabet_index(message).map.with_index do |number, index|
      if (index + 1) % 4 == 1
        decrypted_alphabet_a(shift)[number]
      elsif (index +1) % 4 == 2
        decrypted_alphabet_b(shift)[number]
      elsif (index + 1) % 4 == 3
        decrypted_alphabet_c(shift)[number]
      elsif (index + 1) % 4 == 0
        decrypted_alphabet_d(shift)[number]
      end
    end.join
  end

end
