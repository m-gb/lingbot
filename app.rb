require_relative 'game_data'
require_relative 'score'
require_relative 'colorable'
require_relative 'article'
require_relative 'plural'
require_relative 'word'

class Game
  include Colorable
  
  def initialize
    @score = Score.new
    @game_data = GameData.new
  end

  def start!
    greeting
    loop do
      game = choose_game
      play_game(game)
      if(@stop_the_game == true)
        @score.final_score
        puts (colorize(str: 'Quitting the game...', color_code: 31))                                        
        exit(0)
      end
    end
  end

  def choose_game
    puts (colorize(str: 'Which game do you want to play? (please choose: article, plural, word, score to show your score, or stop to quit)',
          color_code: 33))
    game = gets.chomp.downcase
  end

  def play_game(game)
    case game
    when 'article'
      picked_game(game)
      @a_questions ||= @game_data.article_questions
      if out_of_questions(@a_questions)
        return
      else
        Article.new.play(@a_questions)
        @score.increase_score
      end
    when 'plural'
      picked_game(game)
      @p_questions ||=  @game_data.plural_questions   
      if out_of_questions(@p_questions)
        return
      else
        Plural.new.play(@p_questions)
        @score.increase_score
      end
    when 'word'
      picked_game(game)
      @w_questions ||= @game_data.word_questions 
      if out_of_questions(@w_questions)
        return
      else
        Word.new.play(@w_questions)
        @score.increase_score
      end
    when 'score'
      @score.show_score
    when 'stop'
      @stop_the_game = true
    else
      puts (colorize(str: "That game doesn't exist.", color_code: 31))              
    end
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
end
