class Photo < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  scope :editorial, -> { where(photo_type: 0) }
  scope :runway, -> { where(photo_type: 1) }
  
  def photo_type_enum
  	{ Editorial: 0, Runway: 1 }
  end

  def lightbox_photographer 
  	!(photographer.empty?) ? "#{photographer.strip} (photographer)" : ""; 
  end

  rails_admin do 
		list do 
			field :photo  
			field :caption
			field :photographer
			field :photo_type
			field :created_at
			field :updated_at
			field :id	
		end
  end
end
