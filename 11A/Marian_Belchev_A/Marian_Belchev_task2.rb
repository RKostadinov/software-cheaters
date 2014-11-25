require 'csv'
require 'builder'

results = Hash.new

CSV.foreach(ARGV[0]) do |row|
	rowInt = row.to_csv.to_i

	if rowInt.odd? # .even? or .odd?
		results[rowInt] = NIL
	end
end

xmlFile = File.new("results.xml", "w")
xml = Builder::XmlMarkup.new(:indent => 2)
xmlFile << xml.numbers {
	results.keys.sort.each do |key| # .sort or .sort.reverse
		xml.number key
	end
}