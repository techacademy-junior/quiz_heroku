class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :question, foreign_key: true
      t.boolean :robo, default: false, null: false
      t.boolean :finished, default: false, null: false

      t.timestamps
    end
  end
end
