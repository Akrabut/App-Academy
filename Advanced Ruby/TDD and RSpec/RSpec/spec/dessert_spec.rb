require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("fruits", 2, "chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("fruits")
    end
    
    it "sets a quantity" do
      expect(subject.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        Dessert.new('more fruits', 'hi', 'chef')
      end.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      ingredient = "peach"
      subject.add_ingredient ingredient
      expect(subject.ingredients).to include(ingredient)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      subject.add_ingredient "peach"
      subject.add_ingredient "apple"
      subject.add_ingredient "pear"
      expect(subject.ingredients).to_not eq(subject.mix!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(1)
      expect(subject.quantity).to eq(1)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect do
        subject.eat(6)
      end.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      serve = subject.serve
      expect(serve).to include("chef".titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
