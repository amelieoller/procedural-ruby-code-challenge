require_relative "../lib/show.rb"

describe "show" do
	# Array of show hashes, where each show has a name and a rating.
  let(:shows) {
  	[
			{
				name: "Friends",
				rating: 8
			},
			{
				name: "Rick and Morty",
				rating: 10
			}
		]
	}
	
	# Write a method that returns the number of shows in your array
		context "#show_count" do
		let(:breaking_bad) { { name: "Breaking Bad", rating: 9 } }
		let(:home_movies) { { name: "Home Movies", rating: 8 } }

		it 'defines a method show_count' do
			expect(defined?(show_count)).to be_truthy
		end

		it "accepts 1 argument of the shows array" do
			expect{show_count}.to raise_error(ArgumentError)
		end

		it "returns the number of shows in the array" do
			expect(show_count(shows)).to be(2)
		end
	end

 	# Write a method that adds a new show to the shows array
  context "#add_show" do
		let(:breaking_bad) { { name: "Breaking Bad", rating: 9 } }
		let(:home_movies) { { name: "Home Movies", rating: 8 } }

		it 'defines a method add_show' do
			expect(defined?(add_show)).to be_truthy
		end

    it "accepts 3 arguments, all shows, the name of the new show, and that shows rating and adds that new show to the shows array" do
      add_show(shows, "Breaking Bad", 9)
      expect(shows).to include(breaking_bad)
      expect(shows.length).to be(3)
    end

    it "adds a different show to the shows array" do
      add_show(shows, "Home Movies", 8)
			add_show(shows, "Breaking Bad", 9)
			expect(shows).to include(home_movies)
      expect(shows.length).to be(4)
		end
		
		it "prints that the show was added and uses the show_count method to print out how many shows are in the array" do
			expect($stdout).to receive(:puts).with("Home Movies has been added to the list! You now have 3 show(s) in your list.")
			add_show(shows, "Home Movies", 8)
		end
		
		it 'calls show_count passing in the shows' do
			allow($stdout).to receive(:puts)
			expect(self).to receive(:show_count).with(shows).at_least(:once)
			add_show(shows, "Breaking Bad", 9)
		end
	end

	# Write a method prints all shows
	context '#print_shows' do
		it 'defines a method print_shows' do
			expect(defined?(add_show)).to be_truthy
		end

		it 'accepts an argument of shows and prints "You have no shows yet, please add some." if the shows array is empty' do
			shows = []
			expect($stdout).to receive(:puts).with("You have no shows yet, please add some.")
			print_shows(shows)
		end

		it "should output a formatted list of shows and their ratings" do
			shows = [
				{name: "Friends", rating: 9},
				{name: "Rick and Morty", rating: 10}
			]

			# For more info about heredocs, see this link: http://en.wikibooks.org/wiki/Ruby_Programming/Here_documents
			@output = <<-TEXT
1. Friends - 9
2. Rick and Morty - 10
TEXT

			@output.each_line do |line|
				expect($stdout).to receive(:puts).with(line.chomp)
			end

			print_shows(shows)
		end
	end
end
