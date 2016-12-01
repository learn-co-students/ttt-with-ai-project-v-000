require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS =
    [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      if board.turn_count % 2 == 0
        self.player_1
      else
        self.player_2
      end
    end

    def over?
      if board.full? || won? || draw?
        true
      else
        false
      end
    end

    def won?
      WIN_COMBINATIONS.find do |win_combination|
        if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X"
          true
        elsif self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
          true
        else
          false
        end
      end
    end

    def draw?
      if board.full? && !won?
        true
      else won?
        false
      end
    end

    def winner
      if won?
        self.board.cells[won?[0]]
      else
        nil
      end
    end

    def turn
      #binding.pry
      #This is where I believe I will program in the ability for the AI to function and actually return moves
      #if PLAYERS == 0
        #run computer game
      #elsif PLAYERS == 1
        #run semi-computer game
      #else
        puts "Please enter 1-9:"
        board.display
        input = self.current_player.move(self.board.cells)
        if board.valid_move?(input)
          board.update(input, self.current_player)
        else
          turn
        end
    end

    def play
      until over?
        turn
      end
      if won?
        board.display
        puts "Congratulations #{winner}!"
      elsif draw?
        board.display
        puts "Cats Game!"
      end
    end

    # def players
    # input = gets.strip
    # # def select_game_type(input)
    #   if input == 0
    #     # PLAYERS = input
    #     newgame = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
    #   elsif input == 1
    #     # PLAYERS =  input
    #     newgame = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    #   else
    #     # PLAYERS == 2
    #     newgame = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    #   end
    #   binding.pry
    #   newgame.play
    # end

end

#  cd ~/code/labs/ttt-with-ai-project-v-000
