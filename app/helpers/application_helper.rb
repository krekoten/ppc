require 'digest/sha1'

module ApplicationHelper
  def css_file_list
    ['reset', '960', 'text', 'layout'] + css_for_controller_and_action
  end
  
  def css_file_name
    Digest::SHA1.hexdigest(css_file_list.join('_'))
  end
  
  def css_for_controller_and_action
    css = {
      'welcome#index' => [
        'welcome/index'
      ]
    }
    
    (css[params[:controller]] || []) + (css["#{params[:controller]}##{params[:action]}"] || [])
  end
  
end
