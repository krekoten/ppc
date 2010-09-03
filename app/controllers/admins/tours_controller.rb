module Admins
  class ToursController < Admins::ApplicationController

    uses_tiny_mce :only => [:new, :create, :edit, :update]
    
    before_filter :_get_tours, :only => [:index]
    before_filter :_get_tour, :except => [:index]
    
    respond_to :html
    
    def index
    end
    
    def edit
    end

    def create
      @tour.save
      respond_with([:admins, @tour])
    end

    def update
      @tour.update_attributes(params[:tour])
      respond_with([:admins, @tour])
    end

    def destroy
      @tour.destroy
      respond_with([:admins, @tour])
    end

    protected

    def _get_tours
      @tours ||= Tour.all
    end

    def _get_tour
      @tour = Tour.find params[:id] if params[:id]
      @tour ||= Tour.new params[:tour] if params[:tour]
      @tour ||= Tour.new
    end
  end
end