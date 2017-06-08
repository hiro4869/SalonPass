class OwnerController < ApplicationController
  def salon_index
    @SalonApplying = SalonApplying.new
    @owner_id = params[:id]
  end

  def show
  end

  def owner
  end
end
