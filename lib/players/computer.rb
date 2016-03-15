class Computer < Player

  attr_reader :board

  def move(board=nil)
    puts "The Computer is choosing a position"
    #wait 1 second to add some semblance of thinking
    sleep(1)
    #create empty array to hold available positions on board.cells
    available_board_positions = []
    #iterate over board.cells and push empty spots into array
    board.cells.each_with_index do |board_position, index|
      available_board_positions << index+1 if board_position == " " || board_position == nil
    end
    #set the computer position equal to
    #random .sample position from array and turn into string
    position = available_board_positions.sample.to_s 
    puts "The Computer chose position #{position}"
    sleep(1)
    #return position
    position
  end

end
