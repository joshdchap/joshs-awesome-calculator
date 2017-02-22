require 'rails_helper'

RSpec.describe Calculator, type: :model do 

  describe ".valid_calculation?" do
    it "returns true for valid inputs of comprising of two numbers and an operator" do
      expect(Calculator.valid_calculation?("1+20")).to be true
    end
    it "returns true for valid inputs of comprising of multiple numbers and operators" do
      expect(Calculator.valid_calculation?("1+20*3-15/12*5*3/21")).to be true
    end
    it "returns false when a space character is input" do
      expect(Calculator.valid_calculation?("1+ 20*3-15/12*5*3/21")).to be false
    end
    it "returns false when a letter character input" do
      expect(Calculator.valid_calculation?("1+f20*3-15/12*5*3/21")).to be false
    end
    it "returns false when a parenthesis is input" do
      expect(Calculator.valid_calculation?("1+(20*3-15/12)*5*3/21")).to be false
    end
    it "returns false when empty" do
      expect(Calculator.valid_calculation?("")).to be false
    end
    it "returns false when html is input" do
      expect(Calculator.valid_calculation?("<b>Hello World</b>")).to be false
    end
  end
  
  describe ".calculate" do
    context "when multiplying numbers" do
      it "correctly mutiplies two numbers" do
        expect(Calculator.calculate("10*10")).to eq 100
      end
      
      it "correctly multiplies multiple numbers" do 
        expect(Calculator.calculate("10*10*10*10")).to eq 10000
      end
    end
    
    context "when dividing numbers" do
      it "correctly divides two numbers" do
        expect(Calculator.calculate("10/5")).to eq 2
      end
      
      it "correctly divides multiple numbers" do 
        expect(Calculator.calculate("100/2/2/5")).to eq 5
      end
    end 
    
    context "when adding numbers" do
      it "correctly adds two numbers" do
        expect(Calculator.calculate("10+10")).to eq 20
      end
      
      it "correctly adds multiple numbers" do 
        expect(Calculator.calculate("100+2+2+5")).to eq 109
      end
    end
    
    context "when subtracting numbers" do
      it "correctly adds two numbers" do
        expect(Calculator.calculate("10-5")).to eq 5
      end
      
      it "correctly adds multiple numbers" do 
        expect(Calculator.calculate("100-2-2-5")).to eq 91
      end
    end  
    
    context "when doing mixed math on numbers" do
      it "correctly executes the correct order of operations" do
        expect(Calculator.calculate("10+5*2*10/2*5-5")).to eq 255
      end
    end
    
    context "when result needs to be formatted correctly" do
      it "shows two decimal places when a float" do
        expect(Calculator.calculate("10/3")).to eq 3.33
      end
      it "shows no decimal places when an int" do
        expect(Calculator.calculate("10/2")).to eq 5
      end
    end
  end
  
end