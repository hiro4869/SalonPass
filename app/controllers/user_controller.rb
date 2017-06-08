class UserController < ApplicationController

  def show
    @salons = SalonApplying.where(user_id: "#{current_user.id}")
  end

end
