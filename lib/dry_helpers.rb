class Dry_Helpers
#=================DRY_Helpers==================
  def win_combo_char
    cell[won?[0]]
  end

  def cell
    board.cells
  end
#==============================================
end
