class Driver
	attr_accessor :driver, :seed, :location
	attr_reader :toys, :books, :classes, :street_used
	
	#sets instance variables to usable/expected values
	def my_initialize
		@classes = 1
		@toys = 0
		@books = 0		
		srand seed.to_i
		@location = nil
		next_spot()
		@random_number = 0
		true
	end
	
	#moves the driver to first location or next location
	#returns location of the driver
	def next_spot
		if @location.nil?
			first()		
		else
			moving()
		end
	end

	#Used to set new random_number value
	def get_rand range
		@random_number = rand(range)
	end

	#pseudo-randomly sets the starting location of a driver
	def first
		random = get_rand(4)
		if random == 0
			@location = "Museum"
		elsif random == 1
			@location = "Cathedral"
		elsif random == 2
			@location = "Hospital"
		elsif random == 3
			@location = "Hillman"
		else
			raise "Something bad has happened"
		end
	end
	#These methods increment the stats and are called as necessary.
	#They were separated for ease of testing.
	def add_toy
		@toys += 1
	end
	
	def add_class
		@classes += 1
	end
	
	def add_books
		@books += 1
	end
	
	#calls for a new random number then calls the appropriate method to move the driver
	#returns location of the driver
	def moving
		get_rand(2)
		case @location
		when "Cathedral"
			from_cathy()
		when "Hospital"
			from_hospital()
		when "Hillman"
			from_hillman()
		when "Museum"
			from_museum()
		end
	end

	#gets called if driver is leaving Cathy, 
	#sets new location and the path used pseudo-randomly
	#returns driver location
	def from_cathy
		if @random_number == 1
			@street_used = "Fourth Ave."
			@location = "Monroeville"
		else 
			@street_used = "Bar St."
			@location = "Museum"
		end
	end
	
	#gets called if driver is leaving the hospital, 
	#sets new location and the path used pseudo-randomly
	#returns driver location
	def from_hospital
		if @random_number == 1
			@street_used = "Fourth Ave."
			@location = "Cathedral"
		else
			@street_used = "Foo St."
			@location = "Hillman"
		end
	end
	
	#gets called if driver is leaving Hillman, 
	#sets new location and the path used pseudo-randomly
	#returns driver location
	def from_hillman
		if @random_number == 1
			@street_used = "Fifth Ave."
			@location = "Downtown"
		else
			@street_used = "Foo St."
			@location = "Hospital"
		end
	end
	
	#gets called if driver is leaving the Museum, 
	#sets new location and the path used pseudo-randomly
	#returns driver location
	def from_museum
		if @random_number == 1
			@street_used = "Fifth Ave."
			@location = "Hillman"
		else
			@street_used = "Bar St."
			@location = "Cathedral"
		end
	end
	
end