class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :user_words, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :content_jp, presence: true, length: { maximum: 50 },
                        uniqueness: {case_sensitive: false}
  belongs_to :category
  filterrific available_filters: [:with_category_id]
  scope :with_category_id, lambda { |category_ids|
    where(category_id: [*category_ids])
  }
end
