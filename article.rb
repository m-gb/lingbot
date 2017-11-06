require_relative 'colorable'
require_relative 'input'

class Article
  include Colorable
  include Input

  def play(questions)
    random_article_question = questions.sample
    puts random_article_question[:question]
    get_answer(random_article_question)
    questions.delete(random_article_question)
  end

end