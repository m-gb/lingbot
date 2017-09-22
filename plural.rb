require_relative 'colorable'
require_relative 'input'

class Plural
  include Colorable
  include Input

  def play(questions)
    random_plural_question = questions.sample    
    puts random_plural_question[:question]
    get_answer(random_plural_question)
    questions.delete(random_plural_question)
  end
end