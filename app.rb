require_relative 'game_data'
require_relative 'score'
require_relative 'colorable'
require_relative 'article'
require_relative 'plural'
require_relative 'word'
require_relative 'output'

class Game
  include Colorable
  include Output
  
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
        quit_game
        exit(0)
      end
    end
  end

  def play_game(game)
    case game
    when 'article'
      picked_game(game)
      @a_questions ||= @game_data.article_questions
      article = Article.new
      check_status(article, @a_questions)
    when 'plural'
      picked_game(game)
      @p_questions ||=  @game_data.plural_questions
      plural = Plural.new
      check_status(plural, @p_questions)
    when 'word'
      picked_game(game)
      @w_questions ||= @game_data.word_questions 
      word = Word.new
      check_status(word, @w_questions)
    when 'score'
      @score.show_score
    when 'stop'
      @stop_the_game = true
    else
      puts (colorize(str: "That game doesn't exist.", color_code: 31))              
    end
  end

  def check_status(game, questions)
    if out_of_questions(questions)
      return
    else
      game.play(questions)
      @score.increase_score
    end
  end
end