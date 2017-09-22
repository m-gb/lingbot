module Input

  def get_answer(randon_question)
    loop do
      answer = gets.chomp
      if answer == randon_question[:answer]
        correct = true
      else
        puts (colorize(str: 'wrong, try again', color_code: 31))                            
      end
      break if(correct == true)
    end
  end
end