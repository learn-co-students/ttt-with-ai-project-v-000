require_relative "../player.rb"
module Players
  class Computer < Player
    attr_accessor :board, :game
    def move(board)
      move = nil
      if board.turn_count == 0 #first move always top left corner
       move = "1"
      end
     if board.turn_count == 1 && !board.taken?(1) #second move, take top left if open
        move ="1"
      else board.turn_count == 1 && !board.taken?(5) #second move, middle is not taken, play middle [4]
         move = "5"
     end
     if board.turn_count == 2 && !board.taken?(9)
        move = "9"
       else
         move = "7"
    end
    if board.turn_count == 3 && !board.taken?(4)
      move = "4"
    else
      move = "6"
    end
    #
    # if board.turn_count == 3
  #     Game::WIN_COMBINATIONS.detect do |win|
  #        if win.any? == board.position(win) && game.current_player == self #or token
  #          move = "#{win[2]}"
  #        end
  #      end
  #         #if win of the first two of combinations, and the third position is not taken
  #          #move = that third position
  #
  #   #to block a win:
  #     else
  #         Game::WIN_COMBINATIONS.detect do |win|
  #             if win.any? == board.position(win) && game.current_player != token
  #               move = "#{win[2]}"
  #             end
  #           end
  #         end
        #move = the third position in that combination.
    #if none of these are true
    #else board.detect do |i|
    #if i == " "
    #move == i.
  end
end
end
