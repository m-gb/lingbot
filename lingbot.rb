class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def magenta
    colorize(35)
  end

  def grey
    colorize(37)
  end

end

class Game

  def initialize
    @article_questions = [{question: "What's the article of Bier?".colorize(36), answer: 'Das Bier'},
      {question: "What's the article of Buch?".colorize(36), answer: 'Das Buch'},
      {question: "What's the article of Frau?".colorize(36), answer: 'Die Frau'},
      {question: "What's the article of Wasser?".colorize(36), answer: 'Das Wasser'}]
    @plurals_questions = [{question: "What's the plural of Der Man?".colorize(34), answer: 'Die Männer'},
      {question: "What's the plural of Das Buch?".colorize(34), answer: 'Die Bücher'},
      {question: "What's the plural of Die Frau?".colorize(34), answer: 'Die Frauen'},
      {question: "What's the plural of Der Computer?".colorize(34), answer: 'Die Computer'}]
    @words_questions = [{question: "How do you say man?".colorize(35), answer: 'Der Man'},
      {question: "How do you say woman?".colorize(35), answer: 'Die Frau'},
      {question: "How do you say water?".colorize(35), answer: 'Das Wasser'},
      {question: "How do you say computer?".colorize(35), answer: 'Der Computer'}]
  end

  def choose_game
    puts 'Hello! Welcome to the German challenge game!'.colorize(32)
    puts 'Which game do you want to play?(please type: article, plurals, words, or stop to quit)'.colorize(33)
    game = gets.chomp.downcase
  end

  def play_game(game)
    case game
    when 'article'
      puts "You've picked the article game".colorize(33)
      article
    when 'plurals'
      puts "You've picked the plurals game".colorize(33)
      plurals
    when 'words'
      puts "You've picked the words game".colorize(33)
      words
    when 'stop'
      @stop_the_game = true
    else
      puts "That game doesn't exist.".colorize(31)
    end
  end

  def article
    if @article_questions.empty?
      puts "You've answered all questions correctly.".colorize(33)
      return
    end
    random_article_question = @article_questions.sample
    puts random_article_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_article_question[:answer]
        correct = true
      else
        puts "wrong, try again".colorize(31)
      end
      break if(correct == true)
    end
    puts "correct".colorize(32)
    puts
    @article_questions.delete(random_article_question)
  end

  def plurals
    if @plurals_questions.empty?
      puts "You've answered all questions correctly.".colorize(33)
      return
    end
    random_plurals_question = @plurals_questions.sample
    puts random_plurals_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_plurals_question[:answer]
        correct = true
      else
        puts "wrong, try again".colorize(31)
      end
      break if(correct == true)
    end
    puts "correct".colorize(32)
    puts
    @plurals_questions.delete(random_plurals_question)
  end

  def words
    if @words_questions.empty?
      puts "You've answered all questions correctly.".colorize(33)
      return
    end
    random_words_question = @words_questions.sample
    puts random_words_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_words_question[:answer]
        correct = true
      else
        puts "wrong, try again".colorize(31)
      end
      break if(correct == true)
    end
    puts "correct".colorize(32)
    puts
    @words_questions.delete(random_words_question)
  end

  def start!
    loop do
      game = choose_game
      play_game(game)
      if(@stop_the_game == true)
        puts 'Quitting the game...'.colorize(31)
        break
      end
    end
  end
end

Game.new.start!
