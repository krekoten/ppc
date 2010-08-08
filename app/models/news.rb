class News < ActiveRecord::Base
  
  validates_presence_of :body
  validates_length_of :body, :minimum => 5
  
  before_save :_set_title, :_set_held_on
  
  scope :latest, order('held_on DESC')
  
  # Define predicate methods for checking if news item has special meaning
  [:press_release, :important_event].each do |method_name|
    define_method method_name do
      self.class.to_s == method_name.to_s.classify
    end
    alias_method "#{method_name}?".to_sym, method_name
    
    define_method "#{method_name}=".to_sym do |value|
      instance_variable_set("@#{method_name}", value)
    end
  end
  
  # Sets attributes of model and returns instance of correct class
  def set_attributes_and_model attributes
    self.attributes = attributes
    model_class = self.class.model_class(attributes)
    self.type = model_class.to_s
    self
  end
  
  def _set_title
    self.title = Sanitize.clean(self.body).truncate(40) if self.title.empty?
  end
  protected :_set_title
  
  def _set_held_on
    self.held_on = Date.now if self.held_on.blank?
  end
  protected :_set_held_on
  
  class << self
    def build params
      self.model_class(params).new(params)
    end
    
    def model_class params
      if params[:press_release] && params[:press_release] == '1'
        PressRelease
      elsif params[:important_event] && params[:important_event] == '1'
        ImportantEvent
      else
        News
      end
    end
  end
end
