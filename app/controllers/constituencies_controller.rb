class ConstituenciesController < ApplicationController

  before_filter :ensure_friendly_constituency_url, :only => :show

  def index
    @postcode = params[:pc]
    @constituency = Uk2010Constituency.find_by_postcode(@postcode)
    if @constituency
      redirect_to :action => 'show', :id => @constituency.friendly_id
    else
    end
  end
  
  def show
    id = params[:id]
    @constituency = Uk2010Constituency.find(id)
  end

  private
  
    def ensure_friendly_constituency_url
      begin
        constituency = Uk2010Constituency.find(params[:id])
        redirect_to constituency, :status => :moved_permanently if constituency.has_better_id?
      rescue
        render_not_found
      end
    end
  
end
