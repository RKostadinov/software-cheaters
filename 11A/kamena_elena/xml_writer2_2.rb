class XMLWriter
	def write studentWRO
		xml = File.open("results_Elena_Karakoleva_A_8.xml", "w")
			xml.puts("<results>")
				studentWRO.keys.sort.each do |key|
					xml.puts("<student>")
					xml.puts("<Name> #{key} </Name>")
					xml.puts("</student>")
				end
			xml.puts("</results>")
		xml.close
	end
end
