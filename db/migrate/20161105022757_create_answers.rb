class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
    add_index :answers, [:question_id, :option_id]
  end
end
