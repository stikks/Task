class QuizTask < ActiveRecord::Base
	has_many :questions
	scope :sorted, lambda {order("quiz_tasks.position ASC")}
end
