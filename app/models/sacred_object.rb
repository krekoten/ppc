class SacredObject < ActiveRecord::Base

  validates_presence_of :title, :contacts, :history, :eparchy, :decanat, :region, :district, :city

  scope :latest, order('held_on DESC')

	has_many :attachments, :as => :attachable
	accepts_nested_attributes_for :attachments, :allow_destroy => true

  has_and_belongs_to_many :news
end
