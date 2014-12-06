require 'similar_text'
require 'csv'
data=Hash.new	#NAMES
data1=Hash.new	#PATHS
data2=Hash.new	#EXPECTED RESULTS
data3=Hash.new	#TASK
result_ex1=Hash.new #SELFEXPLANITORY
result_ex2=Hash.new	#SELFEXPLANITORY

#We use "a" and "b" as the variable while making a .each loop for the data hashes 

Dir.glob("#{ARGV[0]}/class019_test/files_for_exam_2/*").each do |file|
	if file.split("/").last == "results" #results
		Dir.glob("#{file}/*").each do |file_results|
			file_result=file_results.split("/").last
			if (file_result.split("_").first == 'xml') || (file_result.split("_").first == 'html')
			else
				data1[file_result.split("_").last.chomp("\.rb")]=file_results
				data["#{file_result.split("_").first},#{file_result.split("_")[1]}"] = file_result.split("_").last.chomp("\.rb")
			end
		end
		file.split("/").last == "tasks" #expects + tasks
		Dir.glob("#{ARGV[0]}/class019_test/files_for_exam_2/expects/*").each do |file_results|
			file_hex=file_results.split("/").last.split(".").first
			data.each do |a|
				if a[1] == file_hex 
					complete=""
					file = File.open(file_results, "r").each do |text|
						complete+=text
					end
					data2[file_hex]=complete #hex code = expected results
				end
			end
		end
		Dir.glob("#{ARGV[0]}/class019_test/files_for_exam_2/tests/*").each do |file_results|
			file_hex=file_results.split("/").last.split(".").first.split("_").last
			data.each do |a|
				if a[1] == file_hex
					complete=""
					file = File.open(file_results, "r").each do |text|
						complete+=text
					end
					data3[file_hex]=complete
				end
			end
		end
	end
end

Dir.glob("#{ARGV[0]}/class016/Iosyf_Saleh_18_B.rb/*").each do |t|
	if t.split("/").last.include? "task3.eruby"
		complete=""
		file = File.open(t, "r").each do |text|
			complete+=text
		end
		data3.each do |a|
			e = a[1].similar("#{complete}")
			if e>=85
				data.each do |b|
					if b[1]==a[0]
						puts b[1]
					end
				end
			end
			
		end
	end
end
