# In a grid of 4 by 4 squares you want to place a skyscraper
# in each square with only some clues:

# 1) The height of the skyscrapers is between 1 and X, where X
# is the grid size

# 2) No two skyscrapers in a row or column may have the same number
# of floors

# 3) A clue is the number of skyscrapers that you can see in a row
# or column from the outside

# 4) Higher skyscrapers block the view of lower skyscrapers
# located behind them

# Can you write a program that can solve this puzzle?

 #  4  4  4  4
 #  _  _  _  _
 # |_||_||_||_|
 # |_||_||_||_|
 # |_||_||_||_|
 # |_||_||_||_|

require "./lib/skyscraper"

describe 'skyscrapers' do
  context 'a 2x2 grid' do
    context 'with a top clue of 2, 1' do
      let(:top_clues) { [2, 1] }
      let(:solution) {{ first_row: [1, 2], second_row: [2, 1] }}

      it 'solves it' do
        expect(Skyscraper.solve(top: top_clues)).to eq solution
      end
    end

    context 'with a top clue of 1, 2' do
      let(:top_clues) { [1, 2] }
      let(:solution) {{ first_row: [2, 1], second_row: [1, 2] }}

      it 'solves it' do
        expect(Skyscraper.solve(top: top_clues)).to eq solution
      end
    end

    context 'with bottom clue of 1, 2' do
      let(:bottom_clues) { [1, 2] }
      let(:solution) {{ first_row: [1, 2], second_row: [2, 1] }}

      it 'solves it' do
        expect(Skyscraper.solve(bottom: bottom_clues)).to eq solution
      end
    end

    context 'with bottom clue of 2, 1' do
      let(:bottom_clues) { [2, 1] }
      let(:solution) {{ first_row: [2, 1], second_row: [1, 2] }}

      it 'solves it' do
        expect(Skyscraper.solve(bottom: bottom_clues)).to eq solution
      end
    end

    context 'with left clue of 1, 2' do
      let(:left_clues) { [1, 2] }
      let(:solution) {{ first_row: [2, 1], second_row: [1, 2] }}

      it 'solves it' do
        expect(Skyscraper.solve(left: left_clues)).to eq solution
      end
    end

    context 'with left clue of 2, 1' do
      let(:left_clues) { [2, 1] }
      let(:solution) {{ first_row: [1, 2], second_row: [2, 1] }}

      it 'solves it' do
        expect(Skyscraper.solve(left: left_clues)).to eq solution
      end
    end

    context 'with right clue of 1, 2' do
      let(:right_clues) { [1, 2] }
      let(:solution) {{ first_row: [1, 2], second_row: [2, 1] }}

      it 'solves it' do
        expect(Skyscraper.solve(right: right_clues)).to eq solution
      end
    end

    context 'with right clue of 2, 1' do
      let(:right_clues) { [2, 1] }
      let(:solution) {{ first_row: [2, 1], second_row: [1, 2] }}

      it 'solves it' do
        expect(Skyscraper.solve(right: right_clues)).to eq solution
      end
    end

    context 'with top clue of 1, nil' do
      let(:top_clues) { [1, nil] }
      let(:solution) {{ first_row: [2, 1], second_row: [1, 2] }}

      it 'solves it' do
        expect(Skyscraper.solve(top: top_clues)).to eq solution
      end
    end

    context 'with top clue of nil, 1' do
      let(:top_clues) { [nil, 1] }
      let(:solution) {{ first_row: [1, 2], second_row: [2, 1] }}

      it 'solves it' do
        expect(Skyscraper.solve(top: top_clues)).to eq solution
      end
    end

    context 'with top clue of 2, nil' do
      let(:top_clues) { [2, nil] }
      let(:solution) {{ first_row: [1, 2], second_row: [2, 1] }}

      it 'solves it' do
        expect(Skyscraper.solve(top: top_clues)).to eq solution
      end
    end
  end
end
