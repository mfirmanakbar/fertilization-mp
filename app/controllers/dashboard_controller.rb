class DashboardController < ApplicationController

  def home
    @list = [
      {"id"=>1, "name"=>"Material Stock", "icon"=>"material.png", "underconstruction"=>false, "linkto"=>materials_path},
      {"id"=>2, "name"=>"Outgoing Bon", "icon"=>"bon.png", "underconstruction"=>true, "linkto"=>nil},
      {"id"=>3, "name"=>"Inspection Report", "icon"=>"inspection.png", "underconstruction"=>true, "linkto"=>nil},
      {"id"=>4, "name"=>"User Profile", "icon"=>"user.png", "underconstruction"=>false, "linkto"=>users_path},
      {"id"=>5, "name"=>"Job Position", "icon"=>"role.png", "underconstruction"=>false, "linkto"=>roles_path},
      {"id"=>6, "name"=>"Log Out", "icon"=>"logout.png", "underconstruction"=>false, "linkto"=>logout_path}
    ]
  end

end
