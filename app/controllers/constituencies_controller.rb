class ConstituenciesController < ApplicationController

  def index
    @postcode = params[:pc]
    @constituency = Uk2010Constituency.find_by_postcode(@postcode)
  end
  
  def show
  end

end
