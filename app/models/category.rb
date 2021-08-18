class Category < ApplicationRecord
  has_and_belongs_to_many :articles
  belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true
  has_many :children, class_name: 'Category', foreign_key: :category_id
  validates :name, presence: true, uniqueness: true
  validate :one_level_depth

  scope :with_articles, -> { joins(:articles).distinct }
  scope :parents, -> { where(parent: nil) }

  before_save do
    self.slug = name.split.join('-').downcase
  end

  def is_parent?
    parent.nil?
  end

  def is_child? 
    parent.present?
  end

  private

  def one_level_depth
    return unless parent
    return unless parent.parent

    errors.add(:parent, 'max depth level reached')
  end
end
