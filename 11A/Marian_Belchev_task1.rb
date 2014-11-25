require 'csv'

results = Hash.new

def flog file
	return flogResult = `flog #{file} -c -q -s`.split(":").first.to_i	
end

def split file
	firstName = file.split("/").last.split("_").first
	lastName = file.split("/").last.split("_", 2).last.split("_").first

	return fullName	= "#{firstName.capitalize},#{lastName.capitalize}"
end

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb") do |file|
	flogResult = flog(file)

	if flogResult < 200
		results[split(file)] = flogResult
	end
end

CSV.open("results.csv", "w") do |csv|
	results.sort.each do |key, value|
		csv << ["#{key},#{value}"]
	end
end