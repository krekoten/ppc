class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  
  def attachable_type= sType
    super(sType.to_s.classify.constantize.base_class.to_s)
  end  
end

case Rails.env
when 'development'
  class Attachment
    has_attached_file :attachment, :styles => { :small_thumb => "50x50>", :thumb => "150x100>" }
  end
when 'production'
  class Attachment
    has_attached_file :attachment,\
      :styles => { :small_thumb => "50x50>", :thumb => "150x100>" },\
      :path => ':attachment/:id/:style/:filename',
      :bucket => 'ppcorgua',\
      :s3_credentials => File.join(Rails.root, 'config', 'aws.yml'),\
      :url => ":s3_domain_url",\
      :storage => :s3
  end
end
