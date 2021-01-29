class Article < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :categories

  validates :categories, length: { minimum: 1, message: 'debes seleccionar una categoría' }
  validates :title, :body, :image, presence: true
end
