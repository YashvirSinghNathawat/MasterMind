require_relative 'instructions'
require_relative 'display'
require_relative 'text_content'
require_relative 'code_breaker'
class Game
    include TextInstructions
    include Display
    include TextContent
    def play
        puts instructions
        game_mode = mode_selection
        code_maker if game_mode == '1'
        code_breaker if game_mode == '2'
    end
    def mode_selection
        input = gets.chomp
        return input if input.match(/[1-2]/)

        puts 'answer_error'
        mode_selection
    end
    def code_maker
        # maker = ComputerSolver.new
        # maker.computer_start
    end
    def code_breaker
        breaker = HumanSolver.new
        breaker.break_code
    end
end