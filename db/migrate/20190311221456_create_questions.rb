class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :a_1
      t.string :a_2
      t.string :a_3
      t.string :a_4
      t.integer :answer

      t.timestamps
    end
  end
end
