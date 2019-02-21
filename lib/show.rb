require "pry"

def start
	shows = [
		{
			name: "Friends",
			main_character: "Rachel Green",
			rating: 8
		},
		{
			name: "Rick and Morty",
			main_character: "Rick",
			rating: 10
		},
		{
			name: "Breaking Bad",
			main_character: "Walter White",
			rating: 9
		}
	]

	input = nil

	while input != "exit"
		puts "What would you like to do?"
		puts "(a) add a show | (p) print | (s) sorted by rating | (d) delete | (c) count | (f) filter | (m) more info"

		input = gets.strip

		if input == "a"
			add_shows(shows)
		elsif input == "f"
			filter_shows(shows)
		elsif input == "c"
			puts "There are #{shows.count} shows in the array."
		elsif input == "d"
			shows.clear
		elsif input == "p"
			print_shows(shows)
		elsif input == "s"
			sorted_shows = shows.sort_by {|show| show[:rating]}
			print_shows(sorted_shows)
		elsif input == "m"
			more_info(shows)
		else
			puts "This is not a valid input"
		end
	end
end

def add_shows(shows)
	puts "What is the show's name?"
	name = gets.strip

	puts "Who is the main character?"
	main_character = gets.strip

	puts "What rating would you give this show?"
	rating = gets.strip

	show = {
		name: name,
		main_character: main_character,
		rating: rating
	}

	shows << show
	puts "#{show[:name]} was added to the list!"
end

def filter_shows(shows)
	puts "Input a keyword and we will return all titles with that keyword"

	search = gets.strip

	filtered = shows.collect do |show|
		if show[:name].downcase.include?(search.downcase)
			show
		end
	end.compact

	if filtered.empty?
		puts "No show with the name '#{search}' was found."
	else
		puts "Here are all the shows that have the word '#{search}' in the title."
		print_shows(filtered)
	end
end

def more_info(shows)
	puts "Which show would you like more info on?"
	print_shows(shows)
	input = gets.strip.to_i

	if input > 0 && input <= shows.count
		puts shows[input - 1][:main_character]
	else
		puts "That show does not exist."
	end
end

def print_shows(shows)
	if shows.empty?
		puts "You have no shows, please add some."
		"hello"
	else
		shows.each.with_index(1) do |show, index|
			puts "#{index}. #{show[:name]} - #{show[:rating]}"
		end
	end
end
