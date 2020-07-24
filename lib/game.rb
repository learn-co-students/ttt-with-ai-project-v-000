class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader

  WIN_COMBINATIONS =
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [2, 5, 8],
      [0, 4, 8],
      [1, 4, 7],
      [2, 4, 6]
    ]

  @board = []

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  # def token
  #   @board.cells.count % 2 == 0 ? "X" : "O"
  #
  # end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2

  end

  def over?
    won? || draw?
  end

  def won?
  new_arr_x = []
  new_arr_o = []
  WIN_COMBINATIONS.each do |array|

      win_index_1 = array[0]
      win_index_2 = array[1]
      win_index_3 = array[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winner_x = 'yes'
        new_arr_x.push(array[0])
        new_arr_x.push(array[1])
        new_arr_x.push(array[2])
        return new_arr_x

      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        winner_o = 'yes'
        new_arr_o.push(array[0])
        new_arr_o.push(array[1])
        new_arr_o.push(array[2])
        return new_arr_o
      end
    end
      false
  end

  def full?
    @board.cells.none?{|i| i == " "}
  end

  def draw?
    !won? && full?
  end

  def winner

    WIN_COMBINATIONS.each do |array|

        win_index_1 = array[0]
        win_index_2 = array[1]
        win_index_3 = array[2]
        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return @player_1.token
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return @player_2.token
        end
      end
        nil
    end

    def turn
      current = current_player
      current_move = current.move(@board)

      if !@board.valid_move?(current_move)
        turn
      else
        @board.update(current_move, current)
      end

    end



    def play
      puts "Welcome to Tic Tac Toe!\n\n"
      @board.display
      puts "\n\n"

      while !over?
        puts "It is now #{current_player.token}'s move"

        turn
        @board.display
        puts "\n\n"
      end

      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      else
        puts "Cat's Game!"
      end




    end


end
