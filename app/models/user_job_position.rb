class UserJobPosition # < ApplicationRecord

  attr_accessor :id, :name, :username, :email, :role_id, :role_name

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @username = hash["username"]
    @email = hash["email"]
    @role_id = hash["role_id"]
    @role_name = hash["role_name"]
  end

end
