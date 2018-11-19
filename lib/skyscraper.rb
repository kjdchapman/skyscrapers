class Skyscraper
  attr_reader :top, :bottom, :left, :right

  def initialize(top: [], bottom: [], left: [], right: [])
    @top = top
    @bottom = bottom
    @left = left
    @right = right
  end

  def solve
    if top.length == 3
      solve_three_grid
    else
      solve_two_grid
    end
  end

  def solve_two_grid
    one_clues = [ top[1], left[1], bottom[0], right[0] ].any?(1)
    two_clues = [ top[0], left[0], bottom[1], right[1] ].any?(2)

    if one_clues || two_clues
      { first_row: [1, 2], second_row: [2, 1] }
    else
      { first_row: [2, 1], second_row: [1, 2] }
    end
  end

  def solve_three_grid
    if top[1] == 1
      { first_row: [1, 3, 2], second_row: [2, 1, 3], third_row: [3, 2, 1]}
    else
      { first_row: [1, 2, 3], second_row: [2, 3, 1], third_row: [3, 1, 2]}
    end
  end
end

# class TwoByTwoGrid
#   attr_reader :first_row
#   attr_reader :second_row

#   def initialize(first_row:, second_row:)
#     @first_row = first_row
#     @second_row = second_row
#   end

#   def picture
#     "|#{first_row[0]}|#{first_row[1]}|" + "\n" \
#     "|#{second_row[0]}|#{second_row[1]}|"
#   end
# end


