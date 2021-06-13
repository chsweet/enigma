class Keys

 def self.random_key
   rand(5 ** 5).to_s.rjust(5, '0')
 end

end
