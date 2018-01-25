class Player

      WIN_COMBINATIONS_PLAYER = [
        [0,1,2], [3,4,5],[6,7,8],
        [0,4,8], [2,4,6],
        [0,3,6], [1,4,7], [2,5,8]
      ]

  attr_reader :token
  def initialize(token)
    @token = token
  end

# HOW TO HAVE THESE 2 METHODS ONLY FOR COMPUTER?

def opponent_token
  token == "X" ? "O" : "X"
end

  def opponent_has_2?(board)
    position_to_block = nil
    opponent_position_taken = []
    board.cells.each_with_index do |cell, i|
       opponent_position_taken << (i+1) if cell == opponent_token
     end
     possible_win_combo = []
     WIN_COMBINATIONS_PLAYER.each do |combo|
       #counter = 0
       combo.each do |position|
         if opponent_position_taken.include?(position)
           possible_win_combo << position
           #counter += 1
         end
       end
       if possible_win_combo.count == 2
         position_to_block = combo - possible_win_combo
       end
     end
     position_to_block
  end


end
