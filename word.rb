require_relative 'colorable'
require_relative 'input'

class Word
  include Colorable
  include Input

  def play(questions)
    random_word_question = questions.sample    
    puts random_word_question[:question]
    get_answer(random_word_question)
    questions.delete(random_word_question)
  end
end