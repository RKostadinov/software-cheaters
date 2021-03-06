
# Develop a program named FirstNAme_LastName_ClassNumber_<%= @task_number %>.rb

# 1.You are given 2 arguments.The first one is a folder with files named FirstName_LastName_digit.extension with differant extensions.
# The second one is the extension rb.
# 2.Find all the files with that with rb extension and check if they include an odd or an even number in their names.
# 3.If the number is odd write the results in XML file sorted by ASC.If it is even write the results in HTML file sorted by ASC.
# 4.The XML file must be named result_FirstName_LastName_ClassNumber.xml
# 5.The HTML file must be named result_FirstName_LastName_ClassNumber.html 
# 
# XML file
# <odd_result>
# 	<file>FirstName1_LastName1_digit.rb</file>
# 	<file>FirstName2_LastName2_digit.rb</file>
# 	<file>FirstNameN_LastNameN_digit.rb</file>
# </odd_result>

# HTML file
# <h3>Even result </h3>
# <ul>
# 	<li>#{file1_name}</li>
# 	<li>#{file2_name}</li>
# 	<li>#{fileN_name}</li>
# </ul>

require 'csv'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
odd_result=Array.new
even_result=Array.new
i=0
j=0
Dir.glob("#{ARGV[0]}*") do |file_name|
	file=file_name.split("/").last
	task=file_name.split("/").last.split("_",2).last.split("_").last.split(".").first
	extension=file_name.split(".").last

	if extension == "#{ARGV[1]}"
			if task.to_i.odd? 
				odd_result[i]=file
				i += 1
			elsif task.to_i.even?
				even_result[j]=file
				j += 1
			end
				
		end

end
writer= HTMLWriter.new 
writer.write even_result
writer = XMLWriter.new
writer.write odd_result









