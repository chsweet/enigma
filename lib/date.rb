require 'date'

class Date

  def self.todays_date
    Time.now.strftime("%d%m%y")
  end

end
