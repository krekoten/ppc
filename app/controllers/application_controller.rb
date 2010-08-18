class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :_load_important_events
  
  private
  
  def _load_important_events
    @events = ImportantEvent.latest.limit(2)
  end
end
