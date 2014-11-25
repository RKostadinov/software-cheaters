class HTMLWriter
	def write student2
		html = File.open("results_Kamena_Dacheva_A_13.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<head>")
		html.puts("<title> Students homeworks </title>")
		html.puts("</head>")
		html.puts("<table border=1 style=width:50%>")
		student2.sort.each do |firstName,lastName|	
			html.puts("<tr>")
			html.puts("<th>#{firstName}</th>")
			html.puts("<th>#{lastName}</th>")
			html.puts("</tr>")					
		end
		html.puts("</table>")
		html.puts("</body>")
		html.puts("</html>")
	html.close
	end
end
