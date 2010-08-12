module Admins
  class SacredObjectsController < Admins::ApplicationController
    uses_tiny_mce :only => [:new, :create, :edit, :update]
    respond_to :html

    before_filter :_load_sacred_objects, :only => [:index]
    before_filter :_load_sacred_object, :except => [:index]

    before_filter :_respond, :only => [:index, :show, :edit, :new]

    def index
    end

    def show
    end

    def edit
    end

    def new
    end

    def create
      @sacred_object.save
      _respond
    end

    def update
      params[:sacred_object][:news_ids] ||= []
      @sacred_object.update_attributes(params[:sacred_object])
      _respond
    end

    def destroy
      @sacred_object.destroy
      _respond
    end

    private

    def _load_sacred_objects
      @sacred_objects = SacredObject.all
    end

    def _load_sacred_object
      @sacred_object = SacredObject.find params[:id] if params[:id]
      @sacred_object ||= SacredObject.new params[:sacred_object] if params[:sacred_object]
      @sacred_object ||= SacredObject.new

      @news = News.all
    end

    def _respond
      respond_with([:admins, @sacred_object]) if @sacred_object
      respond_with([:admins, @sacred_objects]) if @sacred_objects
    end
  end
end
