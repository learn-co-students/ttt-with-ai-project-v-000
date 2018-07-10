module Players
  class Computer < Player

  def move(board)
    "#{rand(1...9)}"
  end

end
end
