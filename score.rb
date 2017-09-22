require_relative 'colorable'
class Score
  include Colorable
  
  def initialize
    @score = 0
  end

  def increase_score
    @score += 1
    puts (colorize(str: '*',color_code: 32))    
    puts (colorize(str: 'correct!', color_code: 32))
    puts (colorize(str: "Your score is now: #{@score}.", color_code: 32))
    puts (colorize(str: '*',color_code: 32)) 
  end

  def show_score
    puts (colorize(str: "Your score is: #{@score}.", color_code: 33))
  end

  def final_score
    puts (colorize(str: "Your final score is: #{@score}", color_code: 33))    
  end
end