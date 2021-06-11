class Keys

 def random_key
   rand(5 ** 5).to_s.rjust(5, '0')
 end

 def key_shift_assignment
   shift_hash = {
                "A" => random_key[0..1].to_i,
                "B" => random_key[1..2].to_i,
                "C" => random_key[2..3].to_i,
                "D" => random_key[3..4].to_i
                }
 end

end
