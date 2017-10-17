class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
                          [0,1,2],
                          [3,4,5],
                          [6,7,8],
                          [0,3,6],
                          [1,4,7],
                          [2,5,8],
                          [0,4,8],
                          [6,4,2]
                        ]

    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count.even? ? self.player_1 : self.player_2
    end

    def won?
      WIN_COMBINATIONS.find do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = self.board.cells[win_index_1]
        position_2 = self.board.cells[win_index_2]
        position_3 = self.board.cells[win_index_3]

        position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      end
    end

    def draw?
      !self.won? && self.board.full?
    end

    def over?
      self.draw? || self.won?
    end

    def winner
      if self.won?
        index = self.won?[0]
        self.board.cells[index]
      end
    end

    def turn
      current = self.current_player
      i = current.move(@board)

      if !@board.valid_move?(i)
        turn
      else
        @board.update(i, current)
        @board.display
      end
    end

    def play
      if !self.over?
        turn
        play
      elsif draw?
        puts "Cat\'s Game!"
      elsif won?
        puts "Congratulations #{self.winner}!"
      end
    end

    def start

      puts "Welcome to Tic-Tac_Toe"
      puts "Please select 0,1,2,wargames plays mode"
      i = gets.chomp

      case i
        when "0"
          @player_1 = Players::Computer.new('X')
          @player_2 = Players::Computer.new('O')
          self.play
        when "1"
          @player_1 = Players::Human.new('X')
          @player_2 = Players::Computer.new('O')
          self.play
        when "2"
          @player_1 = Players::Human.new('X')
          @player_2 = Players::Human.new('O')
          self.play
        when "wargames"
          @player_1 = Players::Computer.new('X')
          @player_2 = Players::Computer.new('O')
          x_wins = 0
          o_wins = 0
          draws = 0
          100.times do
            self.play
            if over? && winner == 'X'
              x_wins += 1
            elsif over? && winner == 'O'
              o_wins += 1
            else
              draws += 1
            end
          end
          puts "Player One (X) won #{x_wins} times"
          puts "Player Two (O) won #{o_wins} times"
          puts "Draws: #{draws}"
        end
    end

end
