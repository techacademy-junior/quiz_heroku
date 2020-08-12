class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :asc)
    @message = Message.new
  end

  def create
    @messages = Message.all.order(created_at: :asc)
    @message_count = @messages.count
    if params[:question_id]
      @question = Question.find(params[:question_id])
      answer = answer_select(@question, params[:answer])
      @message_user = Message.create!(content: answer)
      @message = Message.new(content: "<p>あなたの答えは<span class='text-success'><strong>#{answer}</strong></span>です。</p>", answer: params[:answer], question_id: @question.id, robo: true)
    else
      @message = Message.new(message_params)
    end
    if @message.save && @message.content == "quiz"
      Message.where(finished: false, robo: true, content: "クイズです！！").update_all(finished: true)
      @message_robo = Message.create!(content: 'クイズです！！',question_id: Question.pluck(:id).sample, robo: true)
      render :create
    elsif @message.save && params[:message_id].present?
      puts @message.inspect
      @message_finished = Message.find(params[:message_id])
      @message_finished.update!(finished: true)
      render :create
    elsif @message.save
      render :create
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def answer_select(question, answer)
    if answer.to_i == 1
      question.a_1
    elsif answer.to_i == 2
      question.a_2
    elsif answer.to_i == 3
      question.a_3
    elsif answer.to_i == 4
      question.a_4
    end
  end
end
