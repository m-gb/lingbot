class Game

  def initialize
    @article_questions = [{question: "What's the article of Bier?", answer: 'Das Bier'},
      {question: "What's the article of Buch?", answer: 'Das Buch'},
      {question: "What's the article of Frau?", answer: 'Die Frau'},
      {question: "What's the article of Wasser?", answer: 'Das Wasser'}]
  end

  def choose_game
    puts 'Which game do you want to play?(article, plurals, words, or stop to quit)'
    game = gets.chomp.downcase
  end

  def play_game(game)
    case game
    when 'article'
      article
    when 'plurals'
      plurals
    when 'words'
      words
    when 'stop'
      @stop_the_game = true
    else
      puts "That game doesn't exist."
    end
  end

  def article
    if @article_questions.empty?
      puts "You've answered all questions correctly."
      return
    end
    random_question = @article_questions.sample
    puts random_question[:question]
    loop do
      answer = gets.chomp
      if answer == random_question[:answer]
        correct = true
      else
        puts "wrong, try again"
      end
      break if(correct == true)
    end
    puts "correct"
    @article_questions.delete(random_question)
  end

  def start!
    loop do
      game = choose_game
      play_game(game)
      if(@stop_the_game == true)
        puts 'Quitting the game...'
        break
      end
    end
  end
end

Game.new.start!
