require 'rubygems'
require 'json'

class JSONWriter

	def write(hash)

		File.open("result.json","w") do |f|
		  f.write("{\n")
		  
		  hash.each do |key, value|
		  
			f.write("	\"#{key[0]}\":\"#{value}\"\n")
			
		  end
		  
		  f.write("}\n")
		  
		end
		
	end
	
end
