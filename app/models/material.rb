class Material < ApplicationRecord

  require 'activerecord-import/base'

  validates :material_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :stock_qty, presence: true, numericality: true

  ### default columns
  # def self.as_csv
  #   CSV.generate do |csv|
  #     csv << column_names
  #     all.each do |item|
  #       csv << item.attributes.values_at(*column_names)
  #     end
  #   end
  # end

  ### Custom columns
  def self.to_csv(options = {})
    desired_columns = ["id", "material_name", "stock_qty"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |obj|
        csv << obj.attributes.values_at(*desired_columns)
      end
    end
  end

  ### basic import
  # import csv custom columns
  # def self.to_import(file)
  #   materials = []
  #   CSV.foreach(file.path, headers: true) do |row|
  #     materials << Material.new(row.to_h)
  #   end
  #   Material.import materials, recursive: true
  # end

  ### more fastest
  def self.to_import(file)
    Material.transaction do
      materials = CSV.read(file.path)
      columns = [:material_name, :stock_qty]
      Material.import columns, materials, validate: false
    end
  end


end
