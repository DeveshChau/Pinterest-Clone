class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_attached_file :image
  	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
