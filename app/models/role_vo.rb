class RoleVo

  attr_accessor :id, :role_name

  def initialize(hash)
    @id = hash["id"]
    @role_name = hash["role_name"]
  end

end
