class HTMLWriter
	def write student2
		html = File.open("results_Kamena_Dacheva_A_13.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<head>")
		html.puts("<title> Students homeworks </title>")
		html.puts("</head>")
		html.puts("<table border=1 style=width:50%>")
		student2.sort_by{|k, v| v}.each do |name,sum|	
			html.puts("<tr>")
			html.puts("<th>#{name}</th>")
			html.puts("<th>#{sum}</th>")
			html.puts("</tr>")					
		end
		html.puts("</table>")
		html.puts("</body>")
		html.puts("</html>")
	html.close
	end
end
