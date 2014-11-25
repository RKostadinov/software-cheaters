require 'json'
class JSONWriter
	def write studentWRO
		File.open("results_Elena_Karakoleva_A_8.json","w") do |f|
		studentWRO.keys.sort!.each do |key,val|
			tempHash = ["#{key}"]
f.write(JSON.pretty_generate(tempHash))
		end
	end
  end
end
