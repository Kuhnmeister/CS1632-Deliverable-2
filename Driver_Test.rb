require 'minitest/autorun'
require_relative "Driver"

class Driver_Test< Minitest::Test
	
	# UNIT TESTS FOR METHOD next_spot()
	# Equivalence classes:
	# location = nil -> returns 1 of 4 locations,
	# "Museum", "Hillman", "Hospital" or "Cathedral"
	# location = "Museum" -> returns "Hillman" or "Cathedral"
	# location = "Hillman" -> returns "Downtown" or "Hospital"
	# location = "Cathedral" -> returns "Monroeville" or "Museum"
	# location = "Hospital" -> returns "Cathedral" or "Hillman"
	
	# If location is nil then one of the four locations is returned,
	# "Museum", "Hillman", "Hospital", or "Cathedral".
	def test_next_spot_first
		driver = Driver::new
		driver.location = nil
		assert_includes ["Museum", "Hillman", "Hospital", "Cathedral"], driver.next_spot
	end
	
	# If location is "Museum" then "Hillman" or "Cathedral" is returned.
	def test_next_spot_moving_museum
		driver = Driver::new
		driver.location = "Museum"
		assert_includes ["Hillman", "Cathedral"], driver.next_spot
	end
	
	# If location is "Hillman" then "Downtown" or "Hospital" is returned.
	def test_next_spot_moving_hillman
		driver = Driver::new
		driver.location = "Hillman"
		assert_includes ["Downtown", "Hospital"], driver.next_spot
	end
	
	# If location is "Cathedral" then "Monroeville" or "Museum" is returned.
	def test_next_spot_moving_cathedral
		driver = Driver::new
		driver.location = "Cathedral"
		assert_includes ["Monroeville", "Museum"], driver.next_spot 
	end
	
	# If location is "Hospital" then "Cathedral" or "Hillman" is returned.
	def test_next_spot_moving_hospital
		driver = Driver::new
		driver.location = "Hospital"
		assert_includes ["Cathedral", "Hillman"], driver.next_spot
	end
	
	# UNIT TESTS FOR METHOD first()
	# Equivalence classes:
	# random = 0 -> returns "Museum"
	# random = 1 -> returns "Cathedral"
	# random = 2 -> returns "Hospital"
	# random = 3 -> returns "Hillman"
	# 0 > random > 3, or not a number -> raises "Something bad has happened" 
	
	# If random = 0 then "Museum" is returned
	def test_first_museum
		driver = Driver::new
		def driver.get_rand(range); 0; end
		assert_equal "Museum", driver.first
	end

	# If random = 1 then "Cathedral" is returned
	def test_first_cathedral
		driver = Driver::new
		def driver.get_rand(range); 1; end
		assert_equal "Cathedral", driver.first
	end

	# If random = 2 then "Hospital" is returned
	def test_first_hospital
		driver = Driver::new
		def driver.get_rand(range); 2; end
		assert_equal "Hospital", driver.first
	end

	# If random = 3 then "Hillman" is returned
	def test_first_hillman
		driver = Driver::new
		def driver.get_rand(range); 3; end
		assert_equal "Hillman", driver.first
	end
	
	# If random is not a number, a string in this case, 
	# then first() raises "Something bad has happened"
	# EDGE CASE
	def test_first_invalid_word
		driver = Driver::new
		def driver.get_rand(range); "Cat"; end
		assert_raises("Something bad has happened") { driver.first }
	end
	
	# If random is larger than 3 then first() raises
	# "Something bad has happened"
	# EDGE CASE
	def test_first_invalid_number_large
		driver = Driver::new
		def driver.get_rand(range); 5; end
		assert_raises("Something bad has happened") { driver.first }
	end
	
	# If random is less than 0 then first() raises
	# "Something bad has happened"
	# EDGE CASE
	def test_first_invalid_number_negative
		driver = Driver::new
		def driver.get_rand(range); -1; end
		assert_raises("Something bad has happened") { driver.first }
	end
		
end