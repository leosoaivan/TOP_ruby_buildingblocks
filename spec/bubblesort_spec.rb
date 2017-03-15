require 'bubblesort'


describe "#bubble_sort" do
  let(:array) { [4, 3, 78, 2, 0, 2] }
  
  it "sort an array without a block" do
    expect(bubble_sort(array)).
      to eq([0, 2, 2, 3, 4, 78])
  end
end

describe "#bubble_sort_by" do
  let(:array) { ["hi", "hello", "hey", "holler", "howdy"] }

  it "sorts an array with a block" do
    expect(bubble_sort_by(array) { |left, right| left.length - right.length }).
     to eq(["hi", "hey", "hello", "howdy", "holler"])
  end
    
end