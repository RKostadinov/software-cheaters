=begin
Develop a program named FirstName_LastName_ClassNumber_<%=@task_number%>.rb
1. you are given an argument for a folder with files;
2. some file names in this folder are in the form First_Last.csv
3. find all the students that have <%= @letters %> symbols in their <%= @which_name %> name;
4. Sort the result by <%= @which_to_sort %> <%= @in_what_order %>.
5. Produce a result in <%= @format %> format named result.html:
<html>
	<head></head>
	<body>
		FirstName1,LastName1 FirstName2,LastName2 FirstNameN,LastNameN
	</body>
</html>
=end


a=ARGV[0]
require 'csv'
array=[]
hash=Hash.new
Dir.glob("#{a}*.csv*")  do |my_text_file|
	name = my_text_file.split("/").last.split(".").first.split("_")	
	if name[1]!=nil && name[1].length==10
		hash[name[1]]=name[0]
	end
end
hash=hash.sort
File.open("kwo.html", "w") do |html| 
	html.puts("<html>
	<head></head>
	<body>")
	hash.each do |arg|
			html.puts("		#{arg[1]},#{arg[0]}")
	end
	html.puts("	</body>
</html>")
end
