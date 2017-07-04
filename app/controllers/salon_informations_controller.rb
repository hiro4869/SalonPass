class SalonInformationsController < ApplicationController

  def new
    @SalonInformation = SalonInformation.new
  end

  def create
    @SalonInformation = SalonInformation.new(salon_information_params)
    @SalonInformation.salon_id = params[:salon_id]
    if @SalonInformation.save
      redirect_to owner_salon_path(params[:salon_id])
    else
      render 'salon_informations/new'
    end
  end

  def edit
    @SalonInformation = SalonInformation.find_by(salon_id: params[:salon_id])
  end

  def update
    @SalonInformation = SalonInformation.find_by(salon_id: params[:salon_id])
    if @SalonInformation.update(salon_information_params)
      redirect_to owner_salon_path(params[:salon_id])
    else
      render 'salon_informations/edit'
    end
  end


  private

  def salon_information_params
      params.require(:salon_information).permit(:salon_name, :salon_description, :automatic_approval, :image)
  end

end
