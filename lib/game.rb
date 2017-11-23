require'pry'

class Game

  attr_accessor :board, :player_1,  :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [2,4,6], # Diagonal Right Corner
  [0,4,8] # Diagonal Left Corner
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    counter = board.turn_count
      if counter % 2 == 0
        player_1
      else
        player_2
      end
    end

    def won?
      # check board and return the winning combination indexes as an array
      # if there is a win and false/nil if no win combination

        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = board.cells[win_index_1]
          position_2 = board.cells[win_index_2]
          position_3 = board.cells[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
          end
        end
          return false
    end

    def draw?
      if board.full? == true && self.won? == false
        return true
      end
    end

    def over?
      if self.won? != false || self.draw? == true
        return true
      end
    end

    def winner
        if self.won?
          winner = self.won? # get return value of # #won method (win_combination)
          return board.cells[winner[0]] #return token of first element of winning combination
        else
          return nil
        end
    end

    def turn
        user_input = self.current_player.move(board) # set user_input equal to string that the user inputs (1-9)
          if board.valid_move?(user_input)  # convert string to array index.  If index is (0-8) and element isn't already populated
              board.update(user_input, self.current_player) # update the array element with the token of the current player object
              board.display #display the board
          else
              puts "invalid move."
              self.turn
          end
      end

      def play
        until self.over?
          self.turn
        end
            if self.won?
              win_token = self.winner# get return value of #winner method
              puts "Congratulations #{win_token}!"
            elsif self.draw?
              puts "Cat's Game!"
            end
        end


end
