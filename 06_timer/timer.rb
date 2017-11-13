class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end 
  
  # print time 
  def time_string
    # seconds 
    if @seconds < 60
      return "00:00:" + padder(@seconds)

    # minutes 
    elsif @seconds < 3600
      minutes = @seconds / 60
      seconds = @seconds % 60
      
      return "00:" + padder(minutes) + ":" + padder(seconds)

    # hours
    else
      hours = @seconds / 3600
      remaining =  @seconds % 3600 # remaining seconds 
      minutes = remaining / 60
      seconds = remaining % 60
      
      return padder(hours) + ":" + padder(minutes) + ":" + padder(seconds)
    end
  end

  private
  # helper function to pad time with zero 
  # if it's count is less than 10
  # i.e, "3" => "03"
  # if it's greater than 10
  # "34" => "34" no change 
  def padder number
    if number < 10
      return "0" + number.to_s
    
    else
      return number.to_s
    end
  end
end
