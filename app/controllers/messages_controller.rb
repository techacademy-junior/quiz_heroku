class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :asc)
    @message = Message.new
  end

  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      Message.create!(content: eval("@question.a_#{params[:answer]}"))
      @message = Message.new(content: "あなたの答えは " + eval("@question.a_#{params[:answer]}") + " です", answer: params[:answer], question_id: @question.id, robo: true)
    else
      @message = Message.new(message_params)
    end

    if @message.save && @message.content == "quiz"
      Message.create!(content: 'クイズです！！',question_id: Question.pluck(:id).sample, robo: true)
      redirect_to root_path
    elsif @message.save && params[:message_id].present?
      Message.find(params[:message_id]).update!(finished: true)
      redirect_to root_path
    elsif @message.save
      redirect_to root_path
    else
      @messages = Message.all.order(created_at: :asc)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
