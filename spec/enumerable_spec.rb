require 'enumerable'

describe Enumerable do

  describe "#my_each" do
    context "when called on non-Enumerable objects" do
      it "returns NoMethodError" do
        expect{ "Hello".my_each }.to raise_error(StandardError)
      end
    end
    context "given no block" do
      it "returns an Enumerator" do
        expect([1,2,3].my_each).to be_kind_of Enumerator
      end
    end
    context "given an array with block" do
      it "returns item and index" do
        expect{ |b| [1,2,3].my_each(&b) }.
        to yield_successive_args(1, 2, 3)
      end
    end
    context "given a hash with block" do
      it "returns each hash pair" do
        expect{ |b| { :a => 1, :b => 2 }.my_each(&b) }.
        to yield_successive_args([:a, 1], [:b, 2])
      end
    end
    context "given a range with block" do
      it "returns item and index" do
        expect{ |b| (1..10).my_each(&b) }.
        to yield_successive_args(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
      end
    end
  end

  describe "#my_each_with_index" do
    context "when called on non-Enumerable objects" do
      it "returns NoMethodError" do
        expect{ "This is a string.".my_each_with_index }.to raise_error(StandardError)
      end
    end
    context "when block is not present" do
      it "returns an Enumerator" do
        expect([2,3,4,5,0].my_each_with_index).to be_kind_of Enumerator
      end
    end
    context "when block is present" do
      it "returns each array element and index for manipulation" do
        expect { |b| [5,6,7].my_each_with_index(&b) }.
        to yield_successive_args([5, 0], [6,1], [7,2])
      end
      it "returns each hash key and value for manipulation" do
        expect { |b| { "Hello" => 10, "Bye" => 11 }.my_each_with_index(&b) }.
        to yield_successive_args([["Hello", 10], 0], [["Bye", 11], 1])
      end
    end
  end

  describe "#my_select" do
    context "when called on non-Enumerable objects" do
      it "returns NoMethodError" do
        expect { "This is a string.".my_select }.to raise_error(StandardError)
      end
    end
    context "when block is not present" do
      it "returns an Enumerator" do
        expect([2,3,4,5,0].my_select).to be_kind_of Enumerator
      end
    end
    context "when block is present" do
      it "returns each array element and index for manipulation" do
        expect { |b| [5,6,7].my_each_with_index(&b) }.
        to yield_successive_args([5, 0], [6,1], [7,2])
      end
      it "returns each hash key and value for manipulation" do
        expect { |b| { "Hello" => 10, "Bye" => 11 }.my_each_with_index(&b) }.
        to yield_successive_args([["Hello", 10], 0], [["Bye", 11], 1])
      end
    end
  end

end
