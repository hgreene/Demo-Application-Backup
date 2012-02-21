module ApplicationHelper



	def title
		base_title = "HTGBrando's Website "

		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def logo
		image_tag("logo2.png", :alt => "HTGBrando's Website", :class => "round")
	end

end
