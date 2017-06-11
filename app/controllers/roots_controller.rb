class RootsController < ApplicationController
  def index
    @salons = SalonInformation.all
  end
end
