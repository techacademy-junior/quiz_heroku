module MessagesHelper
  def answer_select(question)
    answer = question.answer
    if answer == 1
      question.a_1
    elsif answer == 2
      question.a_2
    elsif answer == 3
      question.a_3
    elsif answer == 4
      question.a_4
    end
  end
end
