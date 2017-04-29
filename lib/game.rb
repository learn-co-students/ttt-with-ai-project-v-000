
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
      [0,4,8],
      [6,4,2]
    ]

    def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
      @player_1 = p1 #unless p1.class != Players::Human
      @player_2 = p2 #unless p2.class != Players::Human
      @board = board unless board.class != Board
    end

    def current_player
      self.board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def over?
      self.won? || self.draw?
    end

    def won?
      WIN_COMBINATIONS.any? do |c|
      self.board.cells.values_at(c[0],c[1],c[2]) == ["X","X","X"] || self.board.cells.values_at(c[0],c[1],c[2]) == ["O","O","O"]
      end
    end

    def draw?
      !won? && self.board.full?
    end

    def winner
      if WIN_COMBINATIONS.any? { |c| self.board.cells.values_at(c[0],c[1],c[2]) == ["X","X","X"] }
        "X"
      elsif WIN_COMBINATIONS.any? { |c| self.board.cells.values_at(c[0],c[1],c[2]) == ["O","O","O"] }
        "O"
      end
    end

    def turn
      move = self.current_player.move(board) #call for, gets, returns move
      if self.board.valid_move?(move) #if move true
        self.board.update(move,self.current_player)
        self.board.display
      else
          self.turn
      end
    end

    def play
      #puts "Welcome to Tic Tac Toe"

      until over?
        self.turn
      end

      puts "Congratulations #{self.winner}!" if self.won?
      puts "Cat's Game!" if self.draw?

    end


end
