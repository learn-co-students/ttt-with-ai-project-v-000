class Game
  include Players

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #diagonal top left to bottom right
    [2, 4, 6]  #diagonal top right to bot
    ]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def board
      @board
    end

    def player_1
      @player_1
    end

    def player_2
      @player_2
    end

    def board_view
      self.player_1.board = self.board
      self.player_2.board = self.board
    end

    def current_player
      if self.board.turn_count.even?
        self.player_1
      else
        self.player_2
      end
    end

    def last_player
      if self.board.turn_count.odd?
        self.player_1
      else
        self.player_2
      end
    end

    def won?
      WIN_COMBINATIONS.each do |combo_array|
          win_index_1 = combo_array[0]
          win_index_2 = combo_array[1]
          win_index_3 = combo_array[2]

          position_1 = self.board.cells[win_index_1]
          position_2 = self.board.cells[win_index_2]
          position_3 = self.board.cells[win_index_3]

          if position_1 == position_2 && position_1 == position_3 && self.board.taken?(win_index_1 + 1)
            return [win_index_1, win_index_2, win_index_3]
          end
      end
      return false
    end

    def draw?
      self.board.full? && !self.won?
    end

    def over?
      self.draw? || self.won?
    end

    def winner
      if self.won?
        self.board.cells[self.won?[0]]
      end
    end

    def turn
      puts "Please input a number between 1 and 9"
      input = self.current_player.move(board)
        if self.board.valid_move?(input)
          self.board.update(input, self.current_player)
          self.board.display
        else
          self.turn
        end
    end

    def play
      until self.over?
        self.turn
      end
      if won?
        puts "Congratulations #{self.winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

    def start
      puts "Welcome to Tic Tac Toe!"
      players = nil
      until players == 0 || players == 1 || players == 2
        puts "What kind of game do you want to play? (Enter a number)"
        puts "0 Players"
        puts "1 Player"
        puts "2 Players"
        players = gets.chomp
        if players == "0" || players == "1" || players == "2"
          players = players.to_i
        end
      end
      if players == 1
        first_player = nil
          until first_player == "human" || first_player == "Human" || first_player == "computer" || first_player == "Computer"
            puts "Who should go first and be 'X',"
            puts "Human or Computer?"
            first_player = gets.chomp
          end
          if first_player == "human" || first_player == "Human"
            self.player_1 = Human.new("X")
            self.player_2 = Computer.new("O")
            @player_2.board = self.board
            puts "player one = #{self.player_1}"
          elsif first_player == "computer" || first_player == "Computer"
            self.player_1 = Computer.new("X")
            self.player_2 = Human.new("O")
            @player_1.board = self.board
          end
      elsif players == 0
        self.player_1 = Computer.new("X")
        self.player_2 = Computer.new("O")
        @player_1.board = self.board
        @player_2.board = self.board
      end
      self.play
      puts "Play again?"
      play_again = gets.chomp
      if play_again == "Yes" || play_again == "yes" || play_again == "y" || play_again == "Y"
        Game.new.start
      end
    end

end
