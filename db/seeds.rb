require "json"

puts "START"

if Card.delete_all
	puts "Table deleted."
end
path = "/home/azimcan/git/Projects/LOR Deck Builder/set1-en_us/en_us/data/set1-en_us.json"

cards = ""
File.open(path, "r") do |file|
	cards = JSON.parse(file.read)
end

print "Recording"
cards.each do |card|
	card["gameAbsolutePath"] = card["assets"].first["gameAbsolutePath"]
	card["fullAbsolutePath"] = card["assets"].first["fullAbsolutePath"]
	a = Card.new(card)
	if a.save
		print "."
	else
		puts "Error"
		break
	end
end

path = "/home/azimcan/git/Projects/LOR Deck Builder/set2-en_us/en_us/data/set2-en_us.json"

cards = ""
File.open(path, "r") do |file|
	cards = JSON.parse(file.read)
end

cards.each do |card|
	card["gameAbsolutePath"] = card["assets"].first["gameAbsolutePath"]
	card["fullAbsolutePath"] = card["assets"].first["fullAbsolutePath"]
	a = Card.new(card)
	if a.save
		print "."
	else
		puts "Error"
		break
	end
end


puts "\nEND"
