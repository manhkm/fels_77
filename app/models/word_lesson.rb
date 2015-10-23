class WordLesson < ActiveRecord::Base
  belongs_to :answer
  belongs_to :lesson
  belongs_to :word
  
  scope :answer_not_nil, ->{where "answer_id <> ''"}
end
