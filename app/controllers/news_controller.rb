class NewsController < ApplicationController
  before_filter :_load_news, :only => [:index]
  before_filter :_load_news_item, :only => [:show]
  
  def index
    render :template => 'news/index'
  end
  
  def show
    render :template => 'news/show'
  end
  
  private
  
  def _model_class
    @model_class ||= self.class.to_s.gsub(/Controller/, '').singularize.constantize
  end
  
  def _load_news
    @news = _model_class.latest
  end
  
  def _load_news_item
    @item = _model_class.find params[:id]
  end
end