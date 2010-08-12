module Admins
  class SacredObjectsController < Admins::ApplicationController
    respond_to :html

    before_filter :_load_sacred_objects, :only => [:index]
    before_filter :_load_sacred_object, :except => [:index]

    def index
      respond_with(@sacred_objects)
    end

    def show
      respond_with(@sacred_object)
    end

    def edit
      respond_with(@sacred_object)
    end

    def new
      respond_with(@sacred_object)
    end

    def create
      @sacred_object.save
      respond_with(@sacred_object)
    end

    def update
      @sacred_object.update_attributes(params[:sacred_object])
      respond_with(@sacred_object)
    end

    def destroy
      respond_with(@sacred_object)
    end

    private

    def _load_sacred_objects
      @sacred_objects = SacredObject.all
    end

    def _load_sacred_object
      @sacred_object = SacredObject.find params[:id] if params[:id]
      @sacred_object ||= SacredObject.new params[:sacred_object] if params[:sacred_object]
      @sacred_object ||= SacredObject.new
    end
  end
end
