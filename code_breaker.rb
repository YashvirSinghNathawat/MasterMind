require_relative 'text_content'
require_relative 'game_logic'
require_relative 'display'
class HumanSolver
    attr_reader :guess,:computer_code,:exact_number,:same_number
    include TextContent
    include GameLogic
    include Display
    def initialize
        random_numbers = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
        @computer_code = random_numbers.map(&:to_s)
    end
    def break_code
        puts turn_message('breaker_start')
        turn_order
        human_game_over(computer_code, guess)
    end
    def turn_order
        turn = 1
        while turn <= 12
            puts turn_message('guess_prompt',turn)
            @guess = player_input.split(//)
            turn += 1

            break if guess[0].downcase == 'q'
            show_code(guess)

            break if solved?(computer_code,guess)

            turn_outcome
        end
    end
    def player_input
        input = gets.chomp
        return input if input.match(/^[1-6]{4}$/)
        return input if input.downcase == 'q'

        puts warning_message('turn_error')
        player_input
    end
    def turn_outcome
        compare(computer_code,guess)
        show_clues(exact_number,same_number)
    end
    def human_game_over(master, guess)
        if solved?(master, guess)
          puts game_message('human_won')
        else
          puts warning_message('game_over')
          puts game_message('display_code')
          show_code(master)
        end
        repeat_game
    end
end