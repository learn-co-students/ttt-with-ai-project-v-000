require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #left vert
    [1,4,7], #middle vert
    [2,5,8], #Right Vert
    [0,4,8], #TL to RB diag
    [2,4,6] #TR to BL diag
    ]
    
    def initialize(player_1= Player::Human.new("X"), player_2= Player::Human.new("O"), board= Board.new)
      @player_1=player_1
      @player_2=player_2
      @board=board
    end


    def current_player
      board.turn_count.even? ? @player_1 : @player_2
    end

    def over?
      won? || draw?
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        if board.cells[combo[0]] == "X" && board.cells[combo[1]]=="X" && board.cells[combo[2]] == "X"
          return combo
        elsif board.cells[combo[0]] == "O" && board.cells[combo[1]]=="O" && board.cells[combo[2]] == "O"
          return combo
        end
      end
    end

    def position_taken?(input)
      !board.cells(input)== " " || !board.cells(input)== "" || !board.cells(input)== nil
    end

    def draw?
      board.turn_count==9 && !won?
    end

    def winner
      if won=won?
        board.cells[won[0]]
      end
    end

    def turn
      board.display
      select=current_player.move(self.board)
      if board.valid_move?(select)
        board.update(select,current_player)
      else
        puts "Invalid Entry"
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
      else
        board.display
        puts "Cats Game!"
      end
    end
end