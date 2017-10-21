class Game

attr_accessor :player_1, :player_2, :board, :turn_count

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8], [8,5,2],
  [0,4,8], [6,4,2]
]

def initialize(player_1 = Player::Human.new("X") , player_2 = Player::Human.new("O") , board = Board.new)
  @player_1 = player_1 
  @player_2 = player_2 
  @board = board 
end

def current_player 
  board.turn_count.even? ? player_1 : player_2
end

def over?
  won? || draw? ? true : false 
end

def won?
  WIN_COMBINATIONS.each do |combo|
    i, i2, i3 = combo[0], combo[1], combo[2]
    return true if board.cells[i] + board.cells[i2] + board.cells[i3] == "XXX" || board.cells[i] + board.cells[i2] + board.cells[i3] == "OOO"
  end
  false 
end

def draw?
  board.turn_count == 9 && !won? 
end

def winner 
  WIN_COMBINATIONS.each do |combo|
    i = combo[0]
    i2 = combo[1]
    i3 = combo[2]
    
    if board.cells[i] + board.cells[i2] + board.cells[i3] == "XXX"
      return "X"
    elsif board.cells[i] + board.cells[i2] + board.cells[i3] == "OOO"
      return "O"
    end
  end
  nil
end

def turn
  board.display unless board.turn_count < 1 
  input = current_player.move(board)
    while true 
      if board.valid_move?(input)
        board.update(input, current_player)
        break
      else
        puts "invalid"
        input = current_player.move(board)
      end  
    end
end

def play 
  while true 
    turn until over? || won? || draw?

    if winner
      puts "Congratulations #{winner}!"
      board.display
    elsif draw?
      puts "Cats Game!"
      board.display
    end
    break if over?
  end
end

end
