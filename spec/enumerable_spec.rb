require 'enumerable'

describe Enumerable do

  describe "#my_each" do
    context "when block is not present" do
      it "returns an Enumerator" do
        expect([1,2,3].my_each).to be_kind_of Enumerator
      end
    end

    context "when block is present" do
      it "returns each array element for manipulation" do
        expect([1,2,3].my_each { |x| x }).to eql([1,2,3])
      end

      it "returns each hash pair for manipulation" do
        expect({100 => "Hello"}.my_each { |x| x }).to eql({100 => "Hello"})
      end
    end
  end

end
