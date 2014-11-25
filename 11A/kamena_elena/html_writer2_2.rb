class HTMLWriter
	def write studentWRO
		html = File.open("results_Elena_Karakoleva_A_8.html", "w")
		html.puts("<!DOCTYPE html>")
			html.puts("<html>")
			html.puts("<table>")
	   			studentWRO.keys.sort.each do |key,val|
					html.puts("<p>#{key}</p>")
				end
			html.puts("</table>")
			html.puts("</body>")
			html.puts("</html>")
		html.close
	end
end
