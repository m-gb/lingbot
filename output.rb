module Output

  def choose_game
    puts (colorize(str: 'Which game do you want to play? (please choose: article, plural, word, score to show your score, or stop to quit)',
          color_code: 33))
    game = gets.chomp.downcase
  end

  def picked_game(game)
    puts(colorize(str: '*',color_code: 33))    
    puts(colorize(str: "You've picked the #{game} game", color_code: 33))        
    puts(colorize(str: '*',color_code: 33))
  end

  def out_of_questions(questions)
    if questions.empty?
      puts (colorize(str: "You've answered all questions correctly.", color_code: 33))
      return true
    else
      return false
    end
  end

  def greeting
    puts(colorize(str: '*************************************',color_code: 32))
    puts(colorize(str: '*',color_code: 32))    
    puts(colorize(str: 'Hello! Welcome to the German challenge game!', color_code: 32))
    puts(colorize(str: '*',color_code: 32))
    puts(colorize(str: '*************************************',color_code: 32))
  end

  def quit_game 
    puts (colorize(str: 'Quitting the game...', color_code: 31))                                        
  end
end