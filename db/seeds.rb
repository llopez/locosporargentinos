# frozen_string_literal: true

admin = AdminUser.find_or_initialize_by(email: 'admin@example.com')
admin.password = admin.password_confirmation = 'password'
admin.save!

CATEGORIES = %w[
  Inferiores
  Femenino
  Disciplinas
].freeze

CATEGORIES.each do |name|
  category = Category.find_or_initialize_by(name: name)
  category.save!
end
