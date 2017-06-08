class UserController < ApplicationController

  def show
    @SalonApplying = SalonApplying.where(user_id: "#{current_user.id}")
    @SalonApproved = SalonApproved.where(user_id: "#{current_user.id}")
  end

end
