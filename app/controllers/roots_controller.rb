class RootsController < ApplicationController
  def index
    @salons = Owner.all.select("id")
  end
end
