require 'json'
class JSONWriter
	def write student2
		File.open("results_Kamena_Dacheva_A_13.json","w") do |f|
			student2.sort_by{|k, v| v}.each do |name,sum|
				tempHash = ["#{name},#{sum}"]
				f.write(JSON.pretty_generate(tempHash))
			end
		end
   	end
end
