class Product < ApplicationRecord
  # validations
  validates_presence_of :title, :price, :inventory_count

  scope :available, -> { where("inventory_count > 0") }
  scope :by_title, -> (title) { where(title: title) if title.present? }

end
