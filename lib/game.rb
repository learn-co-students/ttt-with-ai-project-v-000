class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    attr_accessor :board, :player_1, :player_2
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new())
      @player_1=player_1
      @player_2=player_2
      @board=board
    end
    def current_player
      filled_cells = self.board.cells.count {|e|
        e=="X" || e=="O"
      }
      filled_cells.even? ? player_1 : player_2
    end
    def over?
      self.won? || self.draw? ? true : false
    end
    def won?
      WIN_COMBINATIONS.any? { |combo|
        combo.all? {|index|
          self.board.cells[index]=="X"
        }
      } || WIN_COMBINATIONS.any? { |combo|
        combo.all? {|index|
          self.board.cells[index]=="O"
        }
      }
    end
    def draw?
      self.board.cells.all?{|e|
        e=="X" || e=="O"
        } && !self.won?
    end
    def winner
      if WIN_COMBINATIONS.any? { |combo|
        combo.all? {|index|
          self.board.cells[index]=="X"
        }
      }
        "X"
      elsif WIN_COMBINATIONS.any? { |combo|
        combo.all? {|index|
          self.board.cells[index]=="O"
        }
      }
        "O"
      else
        nil
      end
    end
    def turn
        position = self.current_player.move(self.board)
        if self.board.valid_move?(position)
          self.board.update(position, self.current_player)
        else
          self.turn
        end
    end
    def play
      self.board.display
      while !self.over?
        puts "Your turn. Choose 1~9!!"
        puts "**********************"
        self.turn
        self.board.display
      end
      if self.winner=="X"
        puts "Congratulations X!"
      elsif self.winner=="O"
        puts "Congratulations O!"
      elsif self.draw?
        puts "Cat's Game!"
      end
    end

    def start
      puts "Welcome to Interactive Tic-Tac-Toe!!"
      puts "What kind of game do you want to play??"
      num_player = nil
      until [0,1,2].include?(num_player)
        puts "Type 0 for 0 Player mode"
        puts "Type 1 for 1 Player mode"
        puts "Type 2 for 2 Player mode"
        num_player = gets.strip.to_i
        if ![0,1,2].include?(num_player)
          puts "Invalid player mode!!!"
          puts "Please enter 0, 1 or 2"
        end
      end
      puts "Do you want to go first and be 'X'?"
      puts "Type 1 for yes."
      puts "Type any other key for no."
      first_player = gets.strip
      if num_player==0
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
      elsif num_player==1 && first_player == "1"
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      elsif num_player==1 && first_player != "1"
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
      else
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end
      @player_1 = player_1
      @player_2 =  player_2
      self.play
      puts "Do you want to play again?"
      puts "Type 1 for yes"
      puts "Type any other key for no"
      play_again = gets.strip
      if play_again=="1"
        self.board = Board.new()
        self.start
      end
    end
end
