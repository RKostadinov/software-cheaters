class XMLWriter
	def write student2
		xml = File.open("results_Kamena_Dacheva_A_13.xml", "w")
		xml.puts("<results>")
		student2.sort_by{|k, v| v}.each do |firstName,lastName|
			xml.puts("<student>")
			xml.puts("<firstName> #{firstName} </firstName>")
			xml.puts("<lastName> #{lastName} </lastName>")
			xml.puts("</student>")
		end
		xml.puts("</results>")
	xml.close
	end
end
