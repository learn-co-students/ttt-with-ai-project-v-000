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
    [2,4,6]]

    def initialize(player_1=nil, player_2=nil, board=nil)
      @player_1 = player_1
      @player_2 = player_2
      @board = board

      @player_1 = Players::Human.new('X') if @player_1 == nil
      @player_2 = Players::Human.new('O') if @player_2 == nil
      @board = Board.new if @board == nil
    end

    def current_player
      #binding.pry
      board_of_X = @board.cells.select do |cell| cell == 'X' end
      board_of_O = @board.cells.select do |cell| cell == 'O' end
      
      num_X = board_of_X.length
      num_O = board_of_O.length

      if num_X == num_O
        player_1
      else
        player_2
      end
    end

    def over?
      won? || draw?
    end

    def won?
      someone_has_won = false
      WIN_COMBINATIONS.each do |combination|
        if (combination.all? {|spot| @board.cells[spot] == 'X'} || 
            combination.all? {|spot| @board.cells[spot] == 'O'} )
          someone_has_won = true
        end
      end
      someone_has_won
    end

    def draw?
      !won? && @board.full?
    end

    def winner
      if won?
        the_winner = ''
         WIN_COMBINATIONS.each do |combination|
          if (combination.all? {|spot| @board.cells[spot] == 'X'} || 
              combination.all? {|spot| @board.cells[spot] == 'O'} )
            the_winner = @board.cells[combination[0]]
          end
        end
        the_winner
      else
        nil
      end
    end

    def turn
      player = current_player

      move_valid = false

      while !move_valid
        move = player.move(@board).to_i
        move_valid = @board.valid_move?(move)
      end

      token = player.token
      #binding.pry

      @board.cells[move - 1] = token
      #binding.pry
    end

    def play
      @board.display
      while !over?
        turn
        @board.display
        # binding.pry
      end

      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
end