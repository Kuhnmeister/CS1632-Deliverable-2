require_relative "Game"

class Simcity

end

#This is the main.  The game is created and initialized here after checking the arguments formatting.
args_checker = ArgsChecker::new
args_checker.check_args ARGV
game = Game.new
game.seed = ARGV[0]
game.start_game