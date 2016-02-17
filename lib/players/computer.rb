class Computer < Player
  def move(board)
    #between 1-9 and not a number that is already play
    num = 0
    loop do 
      num = rand(0..10) 
      break if !board.taken?(num)
      end 
    num.to_s
#------Unbeatable TicTacToe
  end
end 