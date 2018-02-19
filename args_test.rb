require 'minitest/autorun'
require_relative "ArgsChecker"

class Args_Test < Minitest::Test
	# UNIT TESTS FOR METHOD check_args()
	# Equivalence classes:
	# arr = 1 -> do nothing
	# 1 < arr > 1 or nil -> raises "I need one number bud, try again"
	
	# If arr = 1 then nothing happens
	def test_args_check
		args_checker = ArgsChecker::new
		arr = [1]
		assert_nil args_checker.check_args arr
	end
	
	# If arr > 1 then "I need one number bud, try again" is raised
	def test_args_check_greater
		args_checker = ArgsChecker::new
		arr = [2, 4]
		assert_raises("I need one number bud, try again") { args_checker.check_args arr }
	end

	# If arr < 1 then "I need one number bud, try again" is raised
	def test_args_check_less
		args_checker = ArgsChecker::new
		arr = []
		assert_raises("I need one number bud, try again") { args_checker.check_args arr }
	end
	
	# If arr is nil then "I need one number bud, try again" is raised
	def test_args_check_nil
		args_checker = ArgsChecker::new
		arr = nil
		assert_raises("I need one number bud, try again") { args_checker.check_args arr }
	end
	
end