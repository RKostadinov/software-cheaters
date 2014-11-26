hash = Hash.new

Dir.glob("#{ARGV[0]}/*.*") do |student_task|
	student_prog = student_task.split('/')[-1]
	prog_name = student_prog.split('.')[0] # first
	first_name = prog_name.split('_')[0].to_s
	last_name = prog_name.split('_')[1].to_s
	digit = prog_name.split('_')[2]
	prog_extension = student_prog.split('.')[1] # second
	
	if !first_name.empty? && last_name.length == 5 && digit.to_i.to_s == digit && 
		prog_name.split('_').length == 3 && prog_extension == "rb" then	
		l = prog_name.length 
		hash[prog_name] = first_name + "," + last_name + "," + l.to_s
	end
end

hash = Hash[hash.sort_by{|k, v| v}.reverse]


html = File.open("result.html", "w")
	html.puts("<!DOCTYPE html>")
	html.puts("<html>")
	html.puts("<body>")
	hash.each do |key, value|
		first = value.split(",")[0]
		last = value.split(",")[1]
		len = value.split(",")[2]
		html.puts("<h4>#{first},#{last},#{len}</h4>")
	end
		
	html.puts("</body>")
	html.puts("</html>")
	
html.close
