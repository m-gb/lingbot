#make an api in roda and sequel
#make new classes (data, organize order of methods)
require './data.rb'

module Colorized
  def colorize(str:, color_code:)
    "\e[#{color_code}m#{str}\e[0m"  
  end
end

class Game
  include Colorized

  def initialize
    Data.new
  end

  def greeting
    puts(colorize(str: '*************************************',color_code: 32))
    puts(colorize(str: '*',color_code: 32))    
    puts(colorize(str: 'Hello! Welcome to the German challenge game!', color_code: 32))
    puts(colorize(str: '*',color_code: 32))
    puts(colorize(str: '*************************************',color_code: 32))
  end

  def choose_game
    puts (colorize(str: 'Which game do you want to play? (please type: article, plurals, words, or stop to quit)', color_code: 33))
    game = gets.chomp.downcase
  end

  def play_game(game)
    case game
    when 'article'
      puts(colorize(str: '*',color_code: 33))    
      puts (colorize(str: "You've picked the article game", color_code: 33))        
      puts(colorize(str: '*',color_code: 33))
      article_game
    when 'plurals'
      puts(colorize(str: '*',color_code: 33))    
      puts (colorize(str: "You've picked the plurals game", color_code: 33))        
      puts(colorize(str: '*',color_code: 33))
      plurals_game
    when 'words'
      puts(colorize(str: '*',color_code: 33))    
      puts (colorize(str: "You've picked the words game", color_code: 33))        
      puts(colorize(str: '*',color_code: 33))
      words_game
    when 'stop'
      @stop_the_game = true
    else
      puts (colorize(str: "That game doesn't exist.", color_code: 31))              
    end
  end

  def out_of_questions
    puts (colorize(str: "You've answered all questions correctly.", color_code: 33))                    
  end

  def get_answer(randon_question)
    loop do
      answer = gets.chomp
      if answer == randon_question[:answer]
        correct = true
        @score += 1
      else
        puts (colorize(str: 'wrong, try again', color_code: 31))                            
      end
      break if(correct == true)
    end
    puts(colorize(str: '*',color_code: 32))    
    puts (colorize(str: 'correct!', color_code: 32))
    puts (colorize(str: "Your score is now #{@score}.", color_code: 32))
    puts(colorize(str: '*',color_code: 32)) 
  end

  def article_game
    if @article_questions.empty?
      out_of_questions
      return
    end
    random_article_question = @article_questions.sample    
    puts random_article_question[:question]
    get_answer(random_article_question)
    @article_questions.delete(random_article_question)
  end

  def plurals_game
    if @plurals_questions.empty?
      out_of_questions
      return
    end
    random_plurals_question = @plurals_questions.sample
    puts random_plurals_question[:question]
    get_answer(random_plurals_question)                            
    @plurals_questions.delete(random_plurals_question)
  end

  def words_game
    if @words_questions.empty?
      out_of_questions
      return
    end
    random_words_question = @words_questions.sample
    puts random_words_question[:question]
    get_answer(random_words_question)
    @words_questions.delete(random_words_question)
  end

  def start!
    greeting
    loop do
      game = choose_game
      play_game(game)
      if(@stop_the_game == true)
        puts (colorize(str: "Your final score is: #{@score}", color_code: 33))
        puts (colorize(str: 'Quitting the game...', color_code: 31))                                        
        exit(0)
      end
    end
  end
end