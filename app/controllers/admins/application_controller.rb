class Admins::ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'admins'
  before_filter :authenticate_admin!, :if => Proc.new{Admin.count > 0}
  before_filter :_create_admin, :unless => Proc.new{Admin.count > 0}
  
  private
  
  def _create_admin
    redirect_to new_admins_admin_url
  end
end