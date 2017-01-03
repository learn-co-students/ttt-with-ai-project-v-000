
    # define turn method here
    def turn
        puts 'Please enter 1-9:'
        position = gets.strip
        if valid_move?(position)
            move(position, current_player)
            display_board
        elsif !valid_move?(position)
            turn
        end
    end


    # define current_player here
    def current_player
        if turn_count.even? == true
            'X'
        else
            'O'
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            if board[win_combo[0]] == board[win_combo[1]] &&
               board[win_combo[1]] == board[win_combo[2]] &&
               (board[win_combo[0]] == 'X' || board[win_combo[0]] == 'O')
                return win_combo
            else
                false
            end
        end
  end

      # define draw? here
    def draw?
        !won? && full?
    end

    # over? here - won, is a draw, or full
    def over?
        won? || draw? || full?
    end

    # define winner here
    def winner
        if winner = won?
            @board[winner.first]
        end
    end

    # define #play here
    def play
        until over? # until the game is over
            turn # take turns
        end
        if won?
            puts "Congratulations #{winner}!"
        else draw?
             puts 'Cats Game!'
        end
    end
