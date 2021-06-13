class Shifts
  attr_reader :key, :date

  def initialize
    @key = key
    @date = date
  end

  # def todays_date
  #   Time.now.strftime("%d%m%y")
  # end

  def key_shift_assignment
    shift_hash = {
                 "A" => key[0..1].to_i,
                 "B" => key[1..2].to_i,
                 "C" => key[2..3].to_i,
                 "D" => key[3..4].to_i
                 }
  end

  def offsets_shift_assignment
    sqr_date = date.to_i ** 2
    last_four = sqr_date.to_s[-4..-1]
    shift_hash = {
                 "A" => last_four[0].to_i,
                 "B" => last_four[1].to_i,
                 "C" => last_four[2].to_i,
                 "D" => last_four[3].to_i
                 }
  end

  def final_shifts
    key_shift_assignment.merge(offsets_shift_assignment) do |key, oldval, newval|
     oldval + newval
    end
  end

end
