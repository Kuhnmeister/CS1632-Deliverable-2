require_relative "Driver"
require_relative "ArgsChecker"

class Game
	#the instance variable needed for this class is made here.
	attr_accessor :seed
	
	#The main game loop is in this method.
	#This seeds the random number generator used in this class.
	#This method will complete after it calls new_run 5 times.
	#This returns i for testing purposes
	def start_game
		i = 0
		srand seed.to_i
		#This is the loop that runs the simulation 5 times.
		loop do
			i += 1
			new_run(i)
			if i == 5
				break
			end
		end
		i
	end
	
	#After driver creation/initialization this method keeps moving the driver until he/she leaves the map.
	#Once the driver leaves the city, this method calls the print_stats to print the drivers stats.
	def new_run i
		this_driver = driver_initialize()
		#Driver movement loops until the driver is found outside of the map.
		until ["Monroeville", "Downtown"].include? this_driver.location
			#Increments appropriate stat value
			case this_driver.location
			when "Cathedral"
				this_driver.add_class
			when "Hillman"
				this_driver.add_books
			when "Museum"
				this_driver.add_toy
			end
			puts "Driver #{i} heading from #{this_driver.location} to #{this_driver.next_spot} via #{this_driver.street_used}"
		end
		print_stats(this_driver, i)
	end
	
	
	# This method creates a new driver, seeds their random number generator and calls the initialize method.
	# Basically just a setter method for multiple variables
	# Returns driver
	def driver_initialize
		#Driver initialization happens here.
		driver = Driver::new
		driver.seed = rand(100)
		driver.my_initialize
		driver
	end
	
	def print_stats (this_driver, i)
		#This is where the drivers stats are printed.  This uses a method to check for correct pluralization.
		puts "Driver #{i} obtained #{this_driver.books} #{book_plural(this_driver.books)}!"
		puts "Driver #{i} obtained #{this_driver.toys} dinosaur #{toy_plural(this_driver.toys)}!"
		puts "Driver #{i} attended #{this_driver.classes} #{class_plural(this_driver.classes)}!"
	end
	
	#This method returns the correct pluralization of the word book.
	def book_plural books
		if books.is_a? Numeric
			if books == 1
				"book"
			elsif (books > 1 || books == 0)
				"books"
			else
				nil
			end
		else
			raise "You messed up the books"
		end
	end
	
	#This method returns the correct pluralization of the word toy.
	def toy_plural toys
		if toys.is_a? Numeric
			if toys == 1
				"toy"
			elsif (toys > 1 || toys == 0)
				"toys"
			else
				nil
			end
		else
			raise "You messed up the toys"
		end
	end
	
	#This method returns the correct pluralization of the word class.
	def class_plural classes	
		if classes.is_a? Numeric
			if classes == 1
				"class"
			elsif (classes > 1 || classes == 0)
				"classes"
			else
				nil
			end
		else
			raise "You messed up the classes"
		end
	end
		
end