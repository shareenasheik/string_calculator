# String Calculator

This is a simple string calculator implemented in Ruby.
## Features

- Add numbers from a string of comma-separated values.
- Handle new lines between numbers.
- Support custom delimiters.
- Raise an exception for negative numbers, listing all negative numbers in the exception message.

## Usage

To use the `StringCalculator`, create an instance of the class and call the `add` method with the input string.

## Prerequisites

	* Ruby
	* Rails

## Install RSpec

	* gem install rspec


```ruby
require_relative 'string_calculator'

calculator = StringCalculator.new
puts calculator.add("1,2,3")  # Output: 6
puts calculator.add("1\n2,3") # Output: 6
puts calculator.add("//;\n1;2") # Output: 3
