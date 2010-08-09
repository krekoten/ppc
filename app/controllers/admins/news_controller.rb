module Admins
  class NewsController < Admins::ApplicationController

    uses_tiny_mce :only => [:new, :create, :edit, :update]
    
    before_filter :_get_news, :only => [:index]
    before_filter :_get_news_item, :except => [:index]
    
    def index
    end
    
    def edit
    end

    def create
      if @news_item.save
        redirect_to admins_news_index_url#, "Новина успішно збережена"
      else
        #flash[:alert] = "Виникли помилки при збереженні"
        render :action => :new
      end
    end

    def update
      params[:attachment].each do |attach|
        puts attach.inspect
        puts attach.class.to_s
      end if params[:attachment]
      
      if @news_item.set_attributes_and_model(params[:news]).save
        redirect_to admins_news_index_url
      else
        render :action => :edit
      end
    end

    def destroy
      @news_item.destroy
      redirect_to admins_news_index_url
    end

    protected

    def _get_news
      @news ||= News.all
    end

    def _get_news_item
      @news_item = News.find params[:id] if params[:id]
      @news_item ||= News.new params[:news] if params[:news]
      @news_item ||= News.new
    end
  end
end