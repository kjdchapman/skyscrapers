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
  subject do  
    args = {} 
    args[:bottom] = bottom_clues if defined?(bottom_clues)  
    args[:top] = top_clues if defined?(top_clues) 
    args[:left] = left_clues if defined?(left_clues)  
    args[:right] = right_clues if defined?(right_clues) 
     solver = Skyscraper.new(args)  
    solver.solve  
  end 
   context "a 3x3 grid" do  
    context "with a left clue of 3, 1, nil" do  
      let(:left_clues) { [3, 1, nil] }  
      it { is_expected.to eq({  
        first_row: [1, 2, 3], 
        second_row: [3, 1, 2],  
        third_row: [2, 3, 1]  
      })} 
    end 
     context "with a left clue of 3, 2, nil" do 
      let(:left_clues) { [3, 2, nil] }  
      it { is_expected.to eq({  
        first_row: [1, 2, 3], 
        second_row: [2, 3, 1],  
        third_row: [3, 1, 2]  
      })} 
    end 
     context "with a left clue of nil, 3, 1" do 
      let(:left_clues) { [nil, 3, 1] }  
      it { is_expected.to eq({  
        first_row: [2, 3, 1], 
        second_row: [1, 2, 3],  
        third_row: [3, 1, 2]  
      })} 
    end 
     context "with a left clue of 1, 3, nil" do 
      let(:left_clues) { [1, 3, nil] }  
      it { is_expected.to eq({  
        first_row: [3, 1, 2], 
        second_row: [1, 2, 3],  
        third_row: [2, 3, 1]  
      })} 
    end 
    context "with a left clue of 3, nil, 2" do 
      let(:left_clues) { [3, nil, 2] }  
      it { is_expected.to eq({  
        first_row: [1, 2, 3], 
        second_row: [3, 1, 2],  
        third_row: [2, 3, 1]  
      })} 
    end 
    context "with a left clue of 2, 3, nil" do 
      let(:left_clues) { [2, 3, nil] }  
      it { is_expected.to eq({  
        first_row: [2, 3, 1], 
        second_row: [1, 2, 3],  
        third_row: [3, 1, 2]  
      })} 
    end 
    context "with a left clue of 2, nil, 3" do 
      let(:left_clues) { [2, nil, 3] }  
      it { is_expected.to eq({  
        first_row: [2, 3, 1], 
        second_row: [3, 1, 2],  
        third_row: [1, 2, 3]  
      })} 
    end 

  end 
   xcontext 'a 2x2 grid' do  
    context 'with a top clue of 2, 1' do  
      let(:top_clues) { [2, 1] }  
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with a top clue of 1, 2' do 
      let(:top_clues) { [1, 2] }  
      it { is_expected.to eq({ first_row: [2, 1], second_row: [1, 2] }) } 
    end 
     context 'with bottom clue of 1, 2' do  
      let(:bottom_clues) { [1, 2] } 
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with bottom clue of 2, 1' do  
      let(:bottom_clues) { [2, 1] } 
      it { is_expected.to eq({ first_row: [2, 1], second_row: [1, 2] }) } 
    end 
     context 'with left clue of 1, 2' do  
      let(:left_clues) { [1, 2] } 
      it { is_expected.to eq({ first_row: [2, 1], second_row: [1, 2] }) } 
    end 
     context 'with left clue of 2, 1' do  
      let(:left_clues) { [2, 1] } 
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with right clue of 1, 2' do 
      let(:right_clues) { [1, 2] }  
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with right clue of 2, 1' do 
      let(:right_clues) { [2, 1] }  
      it { is_expected.to eq({ first_row: [2, 1], second_row: [1, 2] }) } 
    end 
     context 'with top clue of 1, nil' do 
      let(:top_clues) { [1, nil] }  
      it { is_expected.to eq({ first_row: [2, 1], second_row: [1, 2] }) } 
    end 
     context 'with top clue of nil, 1' do 
      let(:top_clues) { [nil, 1] }  
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with top clue of 2, nil' do 
      let(:top_clues) { [2, nil] }  
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with bottom clue of 1, nil' do  
      let(:bottom_clues) { [1, nil] } 
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with left clue of nil, 1' do  
      let(:left_clues) { [nil, 1] } 
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
     context 'with right clue of 1, nil' do 
      let(:right_clues) { [1, nil] }  
      it { is_expected.to eq({ first_row: [1, 2], second_row: [2, 1] }) } 
    end 
  end 
end