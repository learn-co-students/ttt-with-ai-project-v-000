class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    cells.clear
    # cells = [" "]
    cells.fill(" ", 0, 9)
  end

  def display
    @cells.each do |a|
      print "  |  |  "
    end
    # # print "  |  |  "
    # print "  |  |  "
  end

end
