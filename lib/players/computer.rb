require 'pry'

module Players
  class Players::Computer < Player # represents a computer player of Tic Tac Toe. Implement a #move method that accepts a board and returns the move the computer wants to make in the form of a 1-9 string.


    def move(board)
      move = nil

      # Center move if possible
      if !board.taken?(5)
        move = '5'
      # If player2 and the scoundrel took 5, goto the first position
      elsif board.turn_count == 1
        move = '1'
      # Go for the corners! Presumes you went first
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].find{|i| !board.taken?(i)}.to_s

      # Player2 side strategy
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"

      # You worked hard on these combinations - let's see who has the best combos thus far
      else Game::WIN_COMBINATIONS.find do |c|

        # Do I have a winner?
        if c.select{|i| board.position(i+1) == token}.size == 2 && c.any?{|i| board.position(i+1) == " "}
          move = c.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

        # No winner - let's block the other guy
        elsif c.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && c.any?{|i| board.position(i+1) == " "}
          move = c.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        end
      end

      # No one has a winner, let's play out the corners and sides if possible
      move = [1, 3, 7, 9, 2, 4, 6, 8].find{|i| !board.taken?(i)}.to_s if move == nil
      end
      move

    #  input = (1..9).to_a.sample
    #  input.to_s
    end
  end
end
