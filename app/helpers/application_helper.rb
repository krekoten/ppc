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
      ],
      'news#index'    => [
        'news/index'
      ],
      'press_releases#index'    => [
        'news/index'
      ],
      'important_events#index'    => [
        'news/index'
      ],
      'news#show'    => [
        'news/show'
      ],
      'press_releases#show'    => [
        'news/show'
      ],
      'important_events#show'    => [
        'news/show'
      ],
      'sacred_objects#index'    => [
        'news/index'
      ],
      'sacred_objects#show'    => [
        'news/show'
      ]
    }
    
    (css[params[:controller]] || []) + (css["#{params[:controller]}##{params[:action]}"] || [])
  end
  
end
