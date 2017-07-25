class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null:false
      t.integer :lesson_id
      
      t.timestamps
    end
  end
end
