class Skyscraper
  attr_reader :top, :bottom, :left, :right

  def initialize(top: [], bottom: [], left: [], right: [])
    @top = top
    @bottom = bottom
    @left = left
    @right = right
  end

  def solve
    if left.length == 3
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
    top_left_clue = left[0]
    middle_left_clue = left[1]
    bottom_left_clue = left[2]

    if top_left_clue == 1 && bottom_left_clue == 3
      { first_row: [3, 1, 2], second_row: [2, 3, 1], third_row: [1, 2, 3]}

    elsif (top_left_clue == 1 && bottom_left_clue != 3) || bottom_left_clue == 2
      { first_row: [3, 1, 2], second_row: [1, 2, 3], third_row: [2, 3, 1]}

    elsif top_left_clue == 3 && bottom_left_clue == 2 || middle_left_clue == 1
      { first_row: [1, 2, 3], second_row: [3, 1, 2], third_row: [2, 3, 1]}

    elsif top_left_clue == 3 && middle_left_clue != 1
      { first_row: [1, 2, 3], second_row: [2, 3, 1], third_row: [3, 1, 2]}

    else
      { first_row: [2, 3, 1], second_row: [1, 2, 3], third_row: [3, 1, 2]}
    end
  end
end
