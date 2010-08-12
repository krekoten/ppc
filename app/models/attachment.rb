class Attachment < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true

	has_attached_file :attachment,\
		:styles => { :small_thumb => "50x50>", :thumb => "100x100>" },\
		:path => ':attachment/:id/:style/:filename',
		:bucket => 'ppcorgua',\
		:s3_credentials => File.join(Rails.root, 'config', 'aws.yml'),\
		:url => ":s3_domain_url",\
		:storage => :s3
	

	def attachable_type= sType
    super(sType.to_s.classify.constantize.base_class.to_s)
  end	
end
