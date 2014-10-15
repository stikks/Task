class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer "quiz_task_id"
    	t.integer "number"
    	t.string  "body"
    	t.string  "A"
    	t.string  "B"
    	t.string  "C"
    	t.string  "answer"

      t.timestamps
    end
  end
end
