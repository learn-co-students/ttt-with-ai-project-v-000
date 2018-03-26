require 'pry'
module Players
  class Computer < Player

    def move(board)
      puts "The computer is thinking..."
      sleep(0.75) #simulates thinking & slows pace
      test_board = Board.new(board.cells) # initialize a test board and game
      self.token == "X" ? opp_token = "O" : opp_token = "X"
      opponent = Players::Human.new(opp_token) #init opponent and set token
      test_game = Game.new(opponent, self, test_board) #init test_game
      open_spaces = [] # variable to store empty spaces
      move = nil # initialize a placeholder for return value
      corners = [0, 2, 6, 8]
      edges = [1, 3, 5, 7]

      if board.turn_count == 0 # take a corner if first player
        move = corners[rand(4)]
      elsif board.turn_count == 1 && corners.include?(board.cells.index(opponent.token))
        move = 4 # take the center if opponent took corner first
      elsif board.turn_count == 1 && !corners.include?(board.cells.index(opponent.token))
        move = corners[rand(4)] #take a corner if opponent didn't
      #Below handles a specific case
    elsif board.turn_count == 3 && board.cells[0] == opponent.token && board.cells[8] == opponent.token
        if board.valid_move?(8)
          move = 7
        elsif board.valid_move?(2)
          move = 1
        elsif board.valid_move?(4)
          move = 3
        elsif board.valid_move(6)
          move = 5
        end
      else
        board.cells.each_with_index do |s, i|
          open_spaces << i if s == " " #populate open_spaces with index values
        end
        open_spaces.each do |space|
          test_board.cells[space] = self.token #use test_board to check for win
          if test_game.won?
            move = space #move if game won
            test_board.cells[space] = " " #reset test
          else
            test_board.cells[space] = opponent.token
            move = space if test_game.won? #takes the space to prevent opp. win
            test_board.cells[space] = " " #reset test condition
          end
        end
        if move.nil?
          corners.each{|c| move = c if board.valid_move?(c + 1)} #attempts a coner if move still not made
        elsif move.nil?
          edges.each{|e| move = e if board.valid_move?(e + 1)} #attempts an edge if move still not made
        end
      end
      (move + 1).to_s #properly formats move
    end

  end
end
