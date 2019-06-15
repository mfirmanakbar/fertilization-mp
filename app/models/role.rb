class Role < ApplicationRecord

  before_save { self.role_name = role_name.upcase }

  validates :role_name, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }

  ### Custom columns
  def self.to_csv(options = {})
    desired_columns = ["id", "role_name"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |obj|
        csv << obj.attributes.values_at(*desired_columns)
      end
    end
  end

end
