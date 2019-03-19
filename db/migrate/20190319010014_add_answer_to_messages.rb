class AddAnswerToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :answer, :integer
  end
end
