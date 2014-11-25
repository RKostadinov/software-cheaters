class XMLWriter
	def write student2
		xml = File.open("results_Kamena_Dacheva_A_13.xml", "w")
		xml.puts("<results>")
		student2.sort_by{|k, v| v}.each do |name,sum|
			xml.puts("<student>")
			xml.puts("<Name> #{name} </Name>")
			xml.puts("<sum> #{sum} </sum>")
			xml.puts("</student>")
		end
		xml.puts("</results>")
	xml.close
	end
end
