# module only contains text for game
module TextContent
    def formatting(description,string)
        {
            'underline' => "\e[4m#{string}\e[0m ",
            'red' => "\e[31;1m#{string}\e[0m"
        }[description]
    end
    def turn_message(message,number = nil)
        {
            'breaker_start' => "The computer has start the 'master code' and now its time for you to break the code.\n\n",
            'guess_prompt' => "Guess #{number} : Please enter a 4 digit valid guess between 1 and 6, or 'q' to quit the game."
        }[message]
    end
    def game_message(message)
        {
          'human_won' => "  You broke the code! Congratulations, you win! \n\n",
          'display_code' => "Here is the 'master code' that you were trying to break:",
          'computer_lost' => "\nYou out-smarted the computer & won the game!",
          'repeat_prompt' => "\n\nDo you want to play again? Press 'y' for yes (or any other key for no).",
          'thanks' => 'Thank you for playing Mastermind!'
        }[message]
    end
    def warning_message(message)
        {
          'answer_error' => formatting('red', "Enter '1' to be the code MAKER or '2' to be the code BREAKER.").to_s,
          'turn_error' => formatting('red', 'Your guess should only be 4 digits between 1-6.').to_s,
          'last_turn' => formatting('red', 'Choose carefully. This is your last chance to win!').to_s,
          'code_error' => formatting('red', "Your 'master code' must be 4 digits long, using numbers between 1-6.").to_s,
          'game_over' => "#{formatting('red', 'Game over. That was a hard code to break! ¯\\_(ツ)_/¯ ')} \n\n"
        }[message]
      end
end