class HTMLWriter 
	def write results
		file = File.new("results_Radoslav_Kostadinov_A_22.html", "w")		
			results.sort.each do |key, value|
			file << "<div class=\"students\">
						<ul>
							<li>#{key} #{value}</li>
						</ul>
					</div>"
		end
	end
end