class StringCalculator

	def add(numbers)
		return 0 if numbers.empty?
		# The best way to extract only digits from given input but as per the requirement I am checking delimeter
		# numbers = numbers.tr("^0-9","")

		# Support different delimiters
		delimiter = /,|\n/
		if numbers.start_with?("//")
			parts = numbers.split("\n", 2)
			delimiter = Regexp.escape(parts[0][2..-1])
			numbers = parts[1]
		end

		num_list = numbers.split(/#{delimiter}/)
		negatives = num_list.select { |n| n.to_i < 0 }
		raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

		num_list.map(&:to_i).reduce(0, :+)
	end

end