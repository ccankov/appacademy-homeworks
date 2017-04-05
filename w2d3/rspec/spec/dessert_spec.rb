require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cookie) { Dessert.new('cookie', 1000, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(1000)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('chocolate', 'mountains', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookie.ingredients).to be_empty
      cookie.add_ingredient('chocolate')
      expect(cookie.ingredients).to include('chocolate')
    end
  end

  describe "#mix!" do
    let(:original_ingredients) { ['chocolate', 'dough', 'sugar', 'love', 'magic'] }

    it "shuffles the ingredient array" do
      cookie.add_ingredient('chocolate')
      cookie.add_ingredient('dough')
      cookie.add_ingredient('sugar')
      cookie.add_ingredient('love')
      cookie.add_ingredient('magic')
      expect(cookie.ingredients).to eq(original_ingredients)
      cookie.mix!
      expect(cookie.ingredients).to_not eq(original_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(50)
      expect(cookie.quantity).to eq(950)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(2000) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Perennial Trendsetter Jeremy")
      expect(cookie.serve).to include('Perennial Trendsetter Jeremy')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
