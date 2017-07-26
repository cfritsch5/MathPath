class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string  :name, null:false
      t.integer :question_id
      t.boolean :value

      t.timestamps
    end
  end
end
