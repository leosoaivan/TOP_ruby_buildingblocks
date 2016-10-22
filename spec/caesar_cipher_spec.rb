require 'caesar_cipher.rb'

describe "cipher" do
  it "shifts a letter by a given number key" do
    expect(cipher("a", 1)).to eql("b")
  end

  it "returns a after z" do
    expect(cipher("z", 1)).to eql("a")
  end

  it "returns A after Z" do
    expect(cipher("Z", 1)).to eql("A")
  end

  it "translates a string" do
    expect(cipher("apple", 1)).to eql("bqqmf")
  end

  it "translates multiple strings" do
    expect(cipher("apples and bananas", 5)).to eql("fuuqjx fsi gfsfsfx")
  end

  it "leaves special characters as is" do
    expect(cipher("?!@:.,", 5)).to eql("?!@:.,")
  end

end
