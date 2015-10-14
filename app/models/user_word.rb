class UserWord < ActiveRecord::Base
  belongs_to :user
  belongs_to :word
  validates :user_id, presence: true
  validates :word_id, presence: true
end
