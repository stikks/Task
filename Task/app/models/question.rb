class Question < ActiveRecord::Base
	belongs_to :quiz_task
	scope :sorted, lambda {order("questions.number ASC")}
end
