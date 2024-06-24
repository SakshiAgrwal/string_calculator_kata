class StringCalculator
    def self.add(numbers)
      return 0 if numbers.empty?
  
      delimiter = ","
      if numbers.start_with?("//")
        parts = numbers.split("\n", 2)
        delimiter = parts[0][2..-1]
        numbers = parts[1]
      end
  
      numbers = numbers.gsub("\n", delimiter)
      num_list = numbers.split(delimiter).map(&:to_i)
  
      negatives = num_list.select { |num| num < 0 }
      if negatives.any?
        raise "negative numbers not allowed: #{negatives.join(", ")}"
      end
  
      num_list.sum
    end
  end
  