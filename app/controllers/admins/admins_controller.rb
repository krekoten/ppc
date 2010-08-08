module Admins
  class AdminsController < ApplicationController
    before_filter :_load_admin, :except => [:index]
    before_filter :_load_admins, :only => [:index]
    
    skip_before_filter :_create_admin
    
    def create
      if @admin.save
        redirect_to admins_root_url
      else
        render :action => :new
      end
    end
    
    def update
      if params[:admin][:password].blank?
        params[:admin].delete(:password)
        params[:admin].delete(:password_confirmation)
      end
      if @admin.update_attributes(params[:admin])
        redirect_to [:admins, @admin]
      else
        render :action => :edit
      end
    end
    
    def destroy
      @admin.destroy
      redirect_to admins_admins_url
    end
    
    private
    
    def _load_admin
      @admin = Admin.find params[:id] if params[:id]
      @admin ||= Admin.new params[:admin] if params[:admin]
      @admin ||= Admin.new
    end
    
    def _load_admins
      @admins = Admin.all
    end
  end
end