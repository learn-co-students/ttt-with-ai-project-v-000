
class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
            ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)

      @player_1 = player_1
      @player_2 = player_2
      @board = board

    end


    def turn_count
      counter = 0
      self.board.cells.map do |current_turn|
        if current_turn == "X" || current_turn == "O"
          counter += 1
        end
      end
      counter
    end


    def current_player

      self.turn_count
      if self.turn_count % 2 == 0
        self.player_1

      else
        self.player_2

      end
    end


    def over?
       self.won? || self.draw?

    end


    def won?
        WIN_COMBINATIONS.detect do |win_combination|
          self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X" ||
          self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
      end
    end


    def draw?
      if !self.won? && board.full?
      true
        else
        false
      end
    end

  def winner

    if won = won?
      self.board.cells[won.first]
    end
  end

     def turn
          location = current_player.move(board)
         if board.valid_move?(location)
           board.update(location, current_player)
           board.display
           puts "it's now #{current_player.token}'s turn"
         else
           self.turn
         end
     end


     def play
        until self.over?
          self.turn
          self.won?
        end
          if self.won?
            puts "Congratulations #{self.winner}!"
          else
            self.draw?
            puts "Cats Game!"
          end
      end



end
