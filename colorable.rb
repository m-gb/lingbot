module Colorable
  
  def colorize(str:, color_code:)
    "\e[#{color_code}m#{str}\e[0m"  
  end
end