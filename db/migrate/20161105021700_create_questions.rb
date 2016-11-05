class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question_type
      t.text :question
      t.integer :survey_id
      t.boolean :multi_select
      t.boolean :required

      t.timestamps
    end
    add_index :questions, :survey_id
  end
end
