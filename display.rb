module Display
    def code_colors(number)
        {
            '1' => "\e[101m  1  \e[0m ",
            '2' => "\e[102m  2  \e[0m ",
            '3' => "\e[103m  3  \e[0m ",
            '4' => "\e[104m  4  \e[0m ",
            '5' => "\e[105m  5  \e[0m ",
            '6' => "\e[106m  6  \e[0m "

        }[number]
    end
    def clue_colors(clue)
        {
          '*' => "\e[91m\u25CF\e[0m ",
          '?' => "\e[37m\u25CB\e[0m "
        }[clue]
    end
    def show_code(guess)
        guess.each do |number|
            code_colors(number)
        end
    end
    def show_clues(exact, same)
        print '  Clues: '
        exact.times { print clue_colors('*') }
        same.times { print clue_colors('?') }
        puts ''
    end
end