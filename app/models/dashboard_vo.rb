class DashboardVo

  attr_accessor :id, :name, :icon, :underconstruction, :linkto

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @icon = hash["icon"]
    @underconstruction = hash["underconstruction"]
    @linkto = hash["linkto"]
  end

end
