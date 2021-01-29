class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :name, presence: true

  scope :with_articles, -> { joins(:articles).distinct }

  before_save do
    self.slug = name.split.join('-').downcase
  end
end
