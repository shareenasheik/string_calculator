require 'rspec'
require_relative '../string_calculator/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns empty if numbers contains characters' do
      expect(calculator.add("incubyte2323")).to eq(0)
    end

    it 'returns the number itself when given integer' do
      expect(calculator.add(21)).to eq(21)
    end

    it 'returns the number itself when given a single number' do
      expect(calculator.add('2')).to eq(2)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add('10, 1')).to eq(11)
    end

    it 'returns the sum of multiple numbers' do
      expect(calculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters using ;' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'handles custom delimiters with special regex characters' do
      expect(calculator.add("//.\n1.2.3")).to eq(6)
      expect(calculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'returns 0 for a string with only delimiters' do
      expect(calculator.add(',')).to eq(0)
      expect(calculator.add('\n')).to eq(0)
      expect(calculator.add(',\n,')).to eq(0)
    end

    it 'raises an exception for negative numbers' do
      expect { calculator.add('3,-1,2') }.to raise_error('Negative numbers not allowed: -1')
    end

    it 'shows all negative numbers in the exception message' do
      expect { calculator.add('3,-1,-3,4') }.to raise_error('Negative numbers not allowed: -1, -3')
    end
  end
end
