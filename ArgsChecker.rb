class ArgsChecker
	#Checks the arguments for correct format
	def check_args arr
		raise "I need one number bud, try again" unless arr.count == 1
		nil
	end
end