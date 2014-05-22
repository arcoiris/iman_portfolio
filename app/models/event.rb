class Event < ActiveRecord::Base
	scope :upcoming, -> { where("date > ?", Date.today) }
	scope :past, -> { where("date < ?", Date.today) }
end
