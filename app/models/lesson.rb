class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :word_lessons, dependent: :destroy
  has_many :words, through: :word_lessons

  accepts_nested_attributes_for :word_lessons

  before_create :create_word_lessons
  
  
  private
  def create_word_lessons
    word_ids = category.words.order("RANDOM()").limit(20).map(&:id)
    self.word_ids = word_ids
  end
end
