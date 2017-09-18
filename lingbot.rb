post '/gateway' do
  return if params[:token] != ENV['9XPhGp3iHr83vTIABx2Ifipp']
  message = params[:text].gsub(params[:lingbot], '').strip

  action, repo = message.split('_').map {|c| c.strip.downcase }
  repo_url = "https://api.github.com/repos/#{repo}"

  case action
    when 'issues'
      resp = HTTParty.get(repo_url)
      resp = JSON.parse resp.body
      respond_message "There are #{resp['open_issues_count']} open issues on #{repo}"
  end
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end

module Colorized
  def colorize(str:, color_code:)
    "\e[#{color_code}m#{str}\e[0m"  
  end
end

class Game
  include Colorized

  def initialize
    @article_questions = [{question: colorize(str: "What's the article of Bier?", color_code: 36), answer: 'Das Bier'},
      {question: colorize(str: "What's the article of Buch?", color_code: 36), answer: 'Das Buch'}]
      # {question: colorize(str: "What's the article of Frau?", color_code: 36), answer: 'Die Frau'},
      # {question: colorize(str: "What's the article of Wasser?", color_code: 36), answer: 'Das Wasser'}]
    @plurals_questions = [{question: colorize(str: "What's the plural of Der Man?", color_code: 34), answer: 'Die Männer'},
      {question: colorize(str: "What's the plural of Das Buch?", color_code: 34), answer: 'Die Bücher'},
      {question: colorize(str: "What's the plural of Die Frau?", color_code: 34), answer: 'Die Frauen'},
      {question:  colorize(str: "What's the plural of Der Computer?", color_code: 34), answer: 'Die Computer'}]
    @words_questions = [{question: colorize(str: "How do you say man?", color_code: 35), answer: 'Der Man'},
      {question: colorize(str: "How do you say woman?", color_code: 35), answer: 'Die Frau'},
      {question: colorize(str: "How do you say water?", color_code: 35), answer: 'Das Wasser'},
      {question: colorize(str: "How do you say computer?", color_code: 35), answer: 'Der Computer'}]
  end

  def greeting
    puts(colorize(str: '*************************************',color_code: 32))
    puts(colorize(str: '*',color_code: 32))    
    puts (colorize(str: 'Hello! Welcome to the German challenge game!', color_code: 32))
    puts(colorize(str: '*',color_code: 32))
    puts(colorize(str: '*************************************',color_code: 32))
  end

  def choose_game
    puts (colorize(str: 'Which game do you want to play?(please type: article, plurals, words, or stop to quit)', color_code: 33))
    game = gets.chomp.downcase
  end

  def play_game(game)
    case game
    when 'article'
      puts(colorize(str: '*',color_code: 33))    
      puts (colorize(str: "You've picked the article game", color_code: 33))        
      puts(colorize(str: '*',color_code: 33))
      article
    when 'plurals'
      puts(colorize(str: '*',color_code: 33))    
      puts (colorize(str: "You've picked the plurals game", color_code: 33))        
      puts(colorize(str: '*',color_code: 33))
      plurals
    when 'words'
      puts(colorize(str: '*',color_code: 33))    
      puts (colorize(str: "You've picked the words game", color_code: 33))        
      puts(colorize(str: '*',color_code: 33))
      words
    when 'stop'
      @stop_the_game = true
    else
      puts (colorize(str: "That game doesn't exist.", color_code: 31))              
    end
  end

  def article
    if @article_questions.empty?
      puts (colorize(str: "You've answered all questions correctly.", color_code: 33))                    
      return
    end
    random_article_question = @article_questions.sample
    puts random_article_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_article_question[:answer]
        correct = true
      else
        puts (colorize(str: "wrong, try again", color_code: 31))                            
      end
      break if(correct == true)
    end
    puts(colorize(str: '*',color_code: 32))    
    puts (colorize(str: "correct!", color_code: 32))
    puts(colorize(str: '*',color_code: 32))    
    @article_questions.delete(random_article_question)
  end

  def plurals
    if @plurals_questions.empty?
      puts (colorize(str: "You've answered all questions correctly.", color_code: 33))                    
      return
    end
    random_plurals_question = @plurals_questions.sample
    puts random_plurals_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_plurals_question[:answer]
        correct = true
      else
        puts (colorize(str: "wrong, try again", color_code: 31))                            
      end
      break if(correct == true)
    end
    puts(colorize(str: '*',color_code: 32))    
    puts (colorize(str: "correct!", color_code: 32))
    puts(colorize(str: '*',color_code: 32))                                
    @plurals_questions.delete(random_plurals_question)
  end

  def words
    if @words_questions.empty?
      puts (colorize(str: "You've answered all questions correctly.", color_code: 33))                    
      return
    end
    random_words_question = @words_questions.sample
    puts random_words_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_words_question[:answer]
        correct = true
      else
        puts (colorize(str: "wrong, try again", color_code: 31))                            
      end
      break if(correct == true)
    end
    puts(colorize(str: '*',color_code: 32))    
    puts (colorize(str: "correct!", color_code: 32))
    puts(colorize(str: '*',color_code: 32)) 
    @words_questions.delete(random_words_question)
  end

  def start!
    greeting
    loop do
      game = choose_game
      play_game(game)
      if(@stop_the_game == true)
        puts (colorize(str: "Quitting the game...", color_code: 31))                                        
        break
      end
    end
  end
end

Game.new.start!
