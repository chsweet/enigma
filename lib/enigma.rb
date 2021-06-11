require 'date'

class Enigma

  def encrypt(message, key = random_key, date = today_date)

  end

  def decrypt(message, key, date = today_date)
  end
  
  def random_key
    rand(5 ** 5).to_s.rjust(5, '0')
  end

  #the key will either be the key given or the random key
  def key_shift_assignment(key)
    shift_hash = {
                 "A" => key[0..1].to_i,
                 "B" => key[1..2].to_i,
                 "C" => key[2..3].to_i,
                 "D" => key[3..4].to_i
                 }
  end

  def todays_date
    Time.now.strftime("%d%m%y")
  end

##date will be date given or todays_date
  def offsets_shift_assignment(date)
    sqr_date = date.to_i ** 2
    last_four = sqr_date.to_s[-4..-1]
    shift_hash = {
                 "A" => last_four[0].to_i,
                 "B" => last_four[1].to_i,
                 "C" => last_four[2].to_i,
                 "D" => last_four[3].to_i
                 }
  end

  def final_shifts(key, date)
    key_shift_assignment(key).merge(offsets_shift_assignment(date)) do |key, oldval, newval|
     oldval + newval
    end
  end

end
