class Material < ApplicationRecord

  validates :material_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :stock_qty, presence: true, numericality: true

end
