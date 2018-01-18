
class Computer < Player

  attr_accessor :other_player

  def initialize(token)
    super
    if @token == "X"
      @other_player = Player.new("O")
    else 
      @other_player = Player.new("X")
    end
  end

  def move(board)
    move = find_move(board, self)[1] + 1
    move.to_s
  end

  def find_move(board, player)
    game = Game.new
    game.board = board
    #game.board.display
    #puts "Over? #{game.over?}"
    #puts "Score: #{answer[0]}, Move: #{answer[1]}"
    if game.over?
      winner = game.winner
      return [0, -1] if !winner
      return  [1, -1] if winner == "X"
      return [-1, -1] 
    end

    answer = nil

    empty_squares = board.cells.each_index.select {|i| board.cells[i] == " "}

    empty_squares.each do |square|
      
      new_board = Board.new
      new_board.cells = board.cells.clone
      new_board.update(square + 1, player)
      new_player = switch_player(player)
      #new_board.display
      move = find_move(new_board, new_player)
      if player.token == "X"
        if !answer || move[0] > answer[0]
          answer = [move[0], square]
        end
        break if move[0] == 1
      else
        if !answer || move[0] < answer[0]
          answer = [move[0], square]
        end
        break if move[0] == -1
      end

    end
    answer
  end

  def switch_player(p)
    return @other_player if p.token == @token
    self
  end

end



























