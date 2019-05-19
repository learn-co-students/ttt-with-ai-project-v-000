require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

    def move(board)
        opponent_token = ""

        if self.token == 'X'
            opponent_token = 'O'
        else
            opponent_token = 'X'
        end

    	move_to_win = two_in_a_row?(board)
        move_to_block = opponent_two_in_a_row?(board)

    	if move_to_win
    		move_to_win
        elsif move_to_block
            move_to_block

        # elsif forkable?
        #     create fork
        # elsif opponent_fork?
        #     block fork

        # If it's free, play the middle
        elsif board.cells[4] == ' '
            5

        # if the opponent's in the corner, play opposite corner when possible
        elsif board.cells[0] == opponent_token && board.cells[8] == ' '
            9
        elsif board.cells[2] == opponent_token && board.cells[6] == ' '
            7
        elsif board.cells[6] == opponent_token && board.cells[2] == ' '
            3
        elsif board.cells[8] == opponent_token && board.cells[0] == ' '
            1

        # If there's an empty corner, play it
        elsif board.cells[0] == ' '
            1
        elsif board.cells[2] == ' '
            3
        elsif board.cells[6] == ' '
            7
        elsif board.cells[8] == ' '
            9

        # LAST RESORT: Plays an empty side
        elsif board.cells[1] == ' '
            2
        elsif board.cells[3] == ' '
            4
        elsif board.cells[5] == ' '
            6
        elsif board.cells[7] == ' '
            8

        # the 'catch-all' - Matheas
        else
            Random.rand(1..9)
    	end
    end

    def opponent_two_in_a_row?(board)
        move = false

        WIN_COMBINATIONS.each do |win_combination|
            num_opponent = win_combination.select do |index|
                board.cells[index] != self.token && board.cells[index] != ' '
            end.size

            if num_opponent == 2
                win_combination.each do |index|
                    if board.cells[index] == ' '
                        move = index + 1
                    end
                end
            end
        end

        move
    end

    def two_in_a_row?(board)
        move = false

        WIN_COMBINATIONS.each do |win_combination|
            num_self = win_combination.select do |index|
                board.cells[index] == self.token
            end.size

            if num_self == 2
                win_combination.each do |index|
                    if board.cells[index] == ' '
                        move = index + 1
                    end
                end
            end
        end

        move
    end

  end
end