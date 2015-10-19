class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :words
  has_many :words, dependent: :nullify
  validates :name, presence: true, length: { maximum: 50 }
  
  class << self
    def options_for_select
      order('LOWER(name)').map { |e| [e.name, e.id] }
    end
  end
end
