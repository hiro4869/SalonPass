class SalonInformationsController < ApplicationController

  def new
    @SalonInformation = SalonInformation.new
  end

  def create
    @SalonInformation = SalonInformation.new(salon_information_params)
    @SalonInformation.salon_id = params[:salon_id]
    if @SalonInformation.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def salon_information_params
      params.require(:salon_information).permit(:salon_name, :salon_description)
  end

end
