class CreateQuizTasks < ActiveRecord::Migration
  def change
    create_table :quiz_tasks do |t|
    	t.string "name", :limit=> 50
    	t.integer "position"
    	t.text "about", :limit=>100, :default=>"",:null=>false
      t.timestamps
    end
  end
end
