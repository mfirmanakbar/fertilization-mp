class Material < ApplicationRecord

  validates :material_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :stock_qty, presence: true, numericality: true

  # default
  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

  # custom
  def self.to_csv(options = {})
    desired_columns = ["id", "material_name", "stock_qty"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |obj|
        csv << obj.attributes.values_at(*desired_columns)
      end
    end
  end

end
