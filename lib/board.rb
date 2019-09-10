require 'pry'
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

    # input = " "
    #  if input = "X" || input = "O"
    #    @cells.fill(" ", 0, 9).each do |a|
    #   print " #{a} | #{a} | #{a} "
    #   print "-----------"
    # end


    # @cells.collect do |a|
    #
    #   print " #{a} | #{a} | #{a} "
    #   print "-----------"
    # end

  #
    # @cells.fill("X", 0, 3).each do |a|
    #   print " #{a} | #{a} | #{a} "
    #   print "-----------"
    # end
  #
    # @cells.replace(a).each do |b|
    #     print " #{b} | #{b} | #{b} "
    #     print "-----------"
    #   end
  #
    # @cells.each do |a|
    #   a.replace(" ")
    #   print " #{a} | #{a} | #{a} "
    #   print "-----------"
    #   end

    @cells.each do |a|
      # a = "X"
        # a[b].replace(@cells[0..9])
      puts a[0][1] 
      puts "-----------"
      end

  end

end
