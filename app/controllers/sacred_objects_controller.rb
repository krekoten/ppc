class SacredObjectsController < ApplicationController
  respond_to :html
  def index
    respond_with(@sacred_objects = SacredObject.all)
  end

  def show
    respond_with(@sacred_object = SacredObject.find(params[:id]))
  end
end
