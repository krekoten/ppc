class ToursController < ApplicationController
  before_filter :_load_tours, :only => [:index]
  before_filter :_load_tour, :only => [:show]
  
  respond_to :html
  
  def index
    respond_with(@tours)
  end
  
  def show
    respond_with(@tour)
  end
  
  private
  def _load_tours
    @tours = Tour.all
  end
  
  def _load_tour
    @tour = Tour.find params[:id]
  end
end