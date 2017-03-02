require 'pry'

class Game



  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


  attr_accessor :player_1, :player_2, :board



   def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)

     @player_1 = player_1
     @player_2 = player_2
     @board = board

    end

    def input_to_index(input)
      input = (input.to_i-1)

    end

    def current_player
      if @board.turn_count % 2 == 0
        @player_1
      else
        @player_2
      end
    end

    def over?
       self.won? || self.draw?
      # || (@board.cells.all?{|cell| cell == "X" || cell == "O"})

      #   true
      # else
      #   false
      # end
    end

    def won?
      WIN_COMBINATIONS.any? do |win|
        (@board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] == "X") || (@board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] == "O")
      end


    end

    def draw?
      !won? && board.full?
      # if !self.won?
      #   true
      # else self.won?
      #   false
      # end

    end

    def winner
      if WIN_COMBINATIONS.detect do |win|

         (@board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] == "X")

      end
      "X"
    elsif WIN_COMBINATIONS.detect do |win|
      (@board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] == "O")
      end
      "O"
    end
    end



    def turn
      if current_player.is_a?(Players::Human)||(Players::Computer)

        player_move= current_player.move(board)

        if @board.valid_move?(player_move)
          board.update(player_move,current_player)
          board.display
          else
          self.turn
        end
      # else current_player.is_a?(Players::Computer)
      #   player_move= current_player.move(board)
      #
      #   if @board.valid_move?(player_move)
      #     board.update(player_move,current_player)
      #     board.display
      #     else
      #     self.turn
        end

      end


      def play
          while !over?
            turn

          end
          if won?
            puts "Congratulations #{winner}!"
          elsif draw?

          puts "Cat's Game!"
        end


      end




      def self.start
        puts "Good Day Let's play a round of Tic-Tac-Toe"

        puts "How many players are you playing with 0, 1, or 2?"
        num_players = gets.strip



            if num_players == "0"
             game = self.new(Players::Computer.new("X"), Players::Computer.new("O"))
             game.play
            elsif num_players == "1"
             puts "Who should go first? Player or CPU"
             player1= gets.strip.downcase
             if player1 == "player"
               game = self.new(Players::Human.new("X"),Players::Computer.new("O"))
               game.play
             elsif player1 == "cpu"
               game = self.new(Players::Computer.new("X"),Players::Human.new("O"))
               game.play
             end
           elsif num_players == "2"

             game = self.new(Players::Human.new("X"),Players::Human.new("O"))
             game.play

           elsif num_players == "exit"


         else
           puts "Invalid option please choose correctly"
           self.start
           end

         end
end
