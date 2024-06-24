require 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "given an empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eql(0)
      end
    end

    context "given a single number" do
      it "returns that number" do
        expect(StringCalculator.add("1")).to eql(1)
      end
    end

    context "given two numbers" do
      it "returns their sum" do
        expect(StringCalculator.add("1,2")).to eql(3)
      end
    end

    context "given multiple numbers" do
      it "returns their sum" do
        expect(StringCalculator.add("1,2,3")).to eql(6)
      end
    end

    context "given numbers with new lines" do
      it "returns their sum" do
        expect(StringCalculator.add("1\n2,3")).to eql(6)
      end
    end

    context "given a different delimiter" do
      it "returns their sum" do
        expect(StringCalculator.add("//;\n1;2")).to eql(3)
      end
    end

    context "given negative numbers" do
      it "raises an exception" do
        expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
      end

      it "lists all negative numbers in the exception message" do
        expect { StringCalculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
      end
    end
  end
end
