class Game
  attr_accessor :board, :player_1, :player_2, :token
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
  ]

    def board
      @board
    end

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count%2 == 0 ? player_1 : player_2
    end

    def full?
      self.board.cells.any? {|i| i == " "} ? false : true
   end

    def draw?
      full? && !won?
    end

    def over?
      draw? || won?
    end

    def won?
    WIN_COMBINATIONS.detect do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        if position_1 == @player_1.token && position_2 == @player_1.token && position_3 ==  @player_1.token
          win_combination
        elsif position_1 == @player_2.token && position_2 == @player_2.token && position_3 == @player_2.token
          win_combination
        else
          false
        end
      end
    end

    def winner
      if won?
        WIN_COMBINATIONS.detect do |combo|
          if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]]
            return @board.cells[combo[0]]
          end
        end
      end
    end

    # def winner(board)
    #   if won?(board)
    #     winning_line = won?(board)
    #     return board[winning_line[0]]
    #   end
    # end

    def turn
      # puts "#{current_player}, Please enter 1-9:"
      # input = gets.chomp.to_i-1
      # if index <= 8
      #   player.move(index)
      #   board.display
      # end
    end


    #  puts "#{current_player}, Please enter 1-9:"
    #  input = STDIN.gets.strip
    #    if self.board.valid_move?(input)
    #      self.board.update(input, current_player)
    #      self.board.display
    #  else
    #    puts "invalid"
    #   turn
    #  end


end
