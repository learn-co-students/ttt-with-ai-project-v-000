class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1, :player_2, :token

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)

    @player_1= player_1
    @player_2= player_2
    @board= board
   end
   def current_player
     counter = board.turn_count
       if counter.odd?
         player = player_2
       else
         player = player_1
       end
       return player
       end
    def won?
      WIN_COMBINATIONS.each do |combwin|
            if board.cells[combwin[0]] == "X" && board.cells[combwin[1]] == "X" && board.cells[combwin[2]]  == "X"
              return combwin
            end

            if board.cells[combwin[0]] == "O" && board.cells[combwin[1]] == "O" && board.cells[combwin[2]]  == "O"
              return combwin
            end
          end
          return false
    end
    def draw?
            if board.full? == true && won? == false
            return true
            end
    end
    def over?
        if won?
         return true
        elsif  draw? == true
        return true
        else
         return false
        end
    end
    def winner
      if won? != false
          matrix = won?
          return board.cells[matrix[0]]
       end
    end
    def turn

        player = current_player
        user_input = player.move(board)

        if board.valid_move?(user_input)

            board.update(user_input,player)
        else
          puts "Invalid move."
          turn
        end
    end
    def play
            while !over?
              turn
            end
            if won? != false
              puts "Congratulations #{winner}!"
            elsif draw?
              puts "Cat's Game!"
            else
            end
    end
end
