class Skyscraper
  def self.solve(top: [], bottom: [], left: [], right: [])
    if top[0] == 2 || top[1] == 1 \
      || bottom == [1, 2] \
      || left == [2, 1] \
      || right == [1, 2]
      { first_row: [1, 2], second_row: [2, 1] }
    else
      { first_row: [2, 1], second_row: [1, 2] }
    end
  end
end


