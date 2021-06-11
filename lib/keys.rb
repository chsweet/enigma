class Keys

 def random_key
   rand(5 ** 5).to_s.rjust(5, '0')
 end

 def key_shift_assignment(key)
   shift_hash = {
                "A" => key[0..1].to_i,
                "B" => key[1..2].to_i,
                "C" => key[2..3].to_i,
                "D" => key[3..4].to_i
                }
 end

end
