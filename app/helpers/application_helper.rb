module ApplicationHelper
	
	# Returns full title 
	def full_title(page_title)
		base_title = "Iman J. Brown"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
