require 'minitest/autorun'
require_relative "Game"

class Game_Test < Minitest::Test

	#UNIT TEST FOR METHOD start_game()
	#This should always return 5 as it runs through all five drivers.
	def test_start_game
		game = Game::new
		assert_equal 5, game.start_game
	end
	
	#UNIT TEST FOR METHOD print_stats()
	#Given values of 1 for each stat, the method should 
	# print the statement with all 1s filled in for parameters
	def test_print_stats
		game = Game::new
		driver = Minitest::Mock.new("test driver")
		def driver.books; 1; end
		def driver.classes; 1; end
		def driver.toys; 1; end
		assert_output("Driver 1 obtained 1 book!\nDriver 1 obtained 1 dinosaur toy!\nDriver 1 attended 1 class!\n",nil) { game.print_stats(driver, 1) }
	end
	
	# UNIT TESTS FOR METHOD book_plural()
	# Equivalence classes:
	# books = 1 -> returns "book"
	# books > 1 || books = 0 -> returns "books"
	# books < 0 || books (not a number) -> returns nil
	
	# If 1 is passed in then "book" is returned
	def test_book_plural_book
		game = Game::new
		assert_equal "book", game.book_plural(1)
	end
	
	# If a positive number that isn't 1 is passed in 
	#then "books" is returned
	def test_book_plural_books
		game = Game::new
		assert_equal "books", game.book_plural(2)
		assert_equal "books", game.book_plural(0)
	end
	
	# If a negative number is passed then nil is returned
	# EDGE CASE
	def test_book_plural_invalid
		game = Game::new
		assert_nil game.book_plural(-1)
	end
	
	# If books is a non-numeric value then 
	# "You messed up the books" is raised
	# EDGE CASE
	def test_book_plural_invalid_type
		game = Game::new
		assert_raises("You messed up the books") { game.book_plural("Carbonar") }
	end
	
	# UNIT TESTS FOR METHOD toy_plural()
	# Equivalence classes:
	# toys = 1 -> returns "toy"
	# toys > 1 || toys = 0 -> returns "toys"
	# toys < 0 -> returns nil
	# toys is not a number -> raises "You messed up the toys"
	
	# If 1 is passed in then "toy" is returned
	def test_toy_plural_toy
		game = Game::new
		assert_equal "toy", game.toy_plural(1)
	end
	
	# If a positive number that isn't 1 is passed in 
	# then "toys" is returned
	def test_toy_plural_toys
		game = Game::new
		assert_equal "toys", game.toy_plural(2)
		assert_equal "toys", game.toy_plural(0)
	end
	
	# If a negative number is passed then nil is returned
	# EDGE CASE
	def test_toy_plural_invalid
		game = Game::new
		assert_nil game.toy_plural(-1)
	end
	
	# If toys is a non-numeric value then 
	# "You messed up the toys" is raised
	# EDGE CASE
	def test_toy_plural_invalid_type
		game = Game::new
		assert_raises("You messed up the toys") { game.toy_plural("Friendship never dies") }
	end
	
	# UNIT TESTS FOR METHOD class_plural()
	# Equivalence classes:
	# classes = 1 -> returns "class"
	# classes > 1 || classes = 0 -> returns "classes"
	# classes < 0 || classes -> returns nil
	# classes is not a number -> raises "You messed up the classes"
	
	# If 1 is passed in then "class" is returned
	def test_class_plural_class
		game = Game::new
		assert_equal "class", game.class_plural(1)
	end
	
	# If a positive number that isn't 1 is passed in 
	# then "classes" is returned
	def test_class_plural_classes
		game = Game::new
		assert_equal "classes", game.class_plural(2)
		assert_equal "classes", game.class_plural(0)
	end
	
	# If a negative number then nil is returned
	# EDGE CASE
	def test_class_plural_invalid
		game = Game::new
		assert_nil game.class_plural(-1)
	end
	
	# If classes is a non-numeric value then 
	# "You messed up the classes" is raised
	# EDGE CASE
	def test_class_plural_invalid_type
		game = Game::new
		assert_raises("You messed up the classes") { game.class_plural("Pancetta") }
	end
	
end