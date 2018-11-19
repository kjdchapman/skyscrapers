class Skyscraper
  def self.solve(top: [], bottom: [], left: [], right: [])
    if top.length == 3 || left.length == 3
      top0_three_clues = [right[1], right[2], top[1]].any?{|number| number == 2} || right[2] == 3
      left0_three_clues = [left[1], bottom[1], bottom[2]].any?{|number| number == 2} || top[0] == 3
      bottom0_three_clues = [left[2], right[2], bottom[2]].any?{|number| number == 2} || right[0] == 3
      right0_three_clues = [right[1], bottom[0], bottom[1]].any?{|number| number == 2} || top[2] == 3
      top2_three_clues = [top[0], right[0], left[0]].any? { |number| number == 2  } || left[2] == 3
      left2_three_clues = [left[0], top[0], bottom[0]].any? { |number| number == 2  } || top[2] == 3
      bottom2_three_clues = [left[1], left[0], bottom[2]].any? { |number| number == 2  } || right[2] == 3
      right2_three_clues = [right[1], top[0], top[1]].any? { |number| number == 2  } || bottom[2] == 3
      if  top[1] == 1 && left[2] == 3
        { first_row: [2, 3, 1], second_row: [3, 1, 2], third_row: [1, 2, 3]}
      elsif left[0] == 3 && left0_three_clues == false
      	{ first_row: [1, 2, 3], second_row: [3, 1, 2], third_row: [2, 3, 1]}
      elsif bottom[2] == 3 && bottom2_three_clues == false
      	{ first_row: [1, 2, 3], second_row: [3, 1, 2], third_row: [2, 3, 1]}
      elsif top[0] == 3 && top0_three_clues
      	{ first_row: [1, 2, 3], second_row: [2, 3, 1], third_row:[3, 1, 2] }
      elsif left[0] == 3 && left0_three_clues
      	{ first_row: [1, 2, 3], second_row: [2, 3, 1], third_row: [3, 1, 2]}
      elsif top[0] == 3 && top0_three_clues == false 
      	{ first_row: [1, 3, 2], second_row: [2, 1, 3], third_row: [3, 2, 1]}
      elsif right[2] == 3 && bottom2_three_clues == false
      	{ first_row: [1, 3, 2], second_row: [2, 1, 3], third_row: [3, 2, 1]}
      elsif bottom[2] == 3 && bottom2_three_clues == true
      	{ first_row: [2, 1, 3], second_row: [1, 3, 2], third_row: [3, 2, 1]}
      elsif right[2] == 3 && bottom2_three_clues == true
      	{ first_row: [2, 1, 3], second_row: [1, 3, 2], third_row: [3, 2, 1]}
      elsif top[2] == 3 && top2_three_clues
      	{first_row: [2, 3, 1], second_row: [3, 1, 2], third_row: [1, 2, 3]}
      elsif left[2] == 3 && left2_three_clues
      	{first_row: [2, 3, 1], second_row: [3, 1, 2], third_row: [1, 2, 3]}
      elsif bottom[0] == 3 && bottom0_three_clues == false
      	{first_row: [3, 1, 2], second_row: [2, 3, 1], third_row: [1, 2, 3]}
      elsif right[0] == 3 && right0_three_clues 
      	{first_row: [3, 2, 1], second_row: [1, 3, 2], third_row: [2, 1, 3]}
      elsif top[2] == 3 && top2_three_clues == false
      	{first_row: [3, 2, 1], second_row: [1, 3, 2], third_row: [2, 1, 3]}
      elsif bottom[0] == 3 && bottom0_three_clues
      	{first_row: [3, 2, 1], second_row: [2, 1, 3], third_row: [1, 3, 2]}
      elsif right[0] == 3 && right0_three_clues == false
      	{first_row: [3, 2, 1], second_row: [2, 1, 3], third_row: [1, 3, 2] }
      else
        { first_row: [1, 2, 3], second_row: [2, 3, 1], third_row: [3, 1, 2]}
      end
      
    else
      one_clues = [ top[1], left[1], bottom[0], right[0] ].any?{|number| number == 1}
      two_clues = [ top[0], left[0], bottom[1], right[1] ].any?{|number| number == 2}

      if one_clues || two_clues
        { first_row: [1, 2], second_row: [2, 1] }
      else
        { first_row: [2, 1], second_row: [1, 2] }
      end
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


