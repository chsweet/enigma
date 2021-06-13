require 'date'

class Enigma

  def encrypt(message, key = random_key, date = today_date)

  end

  def decrypt(encrypted_message, key, date = today_date)
  end

  # def message_with_index(message)
  #   message_hash = {}
  #   message.each_char.with_index do |char, index|
  #    message_hash[index] = char.downcase
  #   end
  #   message_hash
  # end
  #
  # def message_with_shift
  #
  # end

  # def character_set_with_index
  #   char_set = ("a".."z").to_a << " "
  #   char_hash = {}
  #   char_set.each.with_index do |char, index|
  #     char_hash[index] = char
  #   end
  #   require "pry"; binding.pry
  #   char_hash
  # end

  def message_char_index(message)
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
    message.each_char.with_index do |char, index|
     @a_array << char if index == 0
     @b_array << char if index == 1
     @c_array << char if index == 2
     @d_array << char if index == 3
    end
  end

  def character_rotate(message, shift_num)
    char_set = ("a".."z").to_a << " "
    key = Hash[char_set.zip(char_set.rotate(number))]
    message.each_char.reduce("") do |new_char, char|
      new_char + key[char]
    end
  end

# A = [0, 4, 8, 12, 16]
# [0, 4, 8, 12, 16]
# B = [1, 5, 9, 13, 17]
# [1, 5, 9, 13, 17]
# C = [2, 6, 10, 14, 18]
# [2, 6, 10, 14, 18]
# D = [3, 7, 11, 15, 19]
# [3, 7, 11, 15, 19]
# new_array.values_at(*A)
# ["h", "o", "r", nil, nil]
# new_array.values_at(*B)
# ["e", " ", "l", nil, nil]
# new_array.values_at(*C)
# ["l", "w", "d", nil, nil]
# new_array.values_at(*D)
# ["l", "o", nil, nil, nil]


end
