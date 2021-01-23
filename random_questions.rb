
module Math
  class AddSubtractGenerator
    def initialize(rows, max_value)
      @justify = max_value.to_s.size
      @rows = rows
      @max = max_value
    end

    def generate
      @rows.times.map do |n|
        row = 3.times.map{ rand(2) == 0 ? make_sum : make_sub }
        "#{just(n + 1, true)}:  #{row.join("  |  ")}\n\n"
      end
    end

    private

    def make_sum
      result, first = rand_start
      case rand(3)
      when 0
        format('+', first: first, answer: result)
      when 1
        format('+', second: first, answer: result)
      when 2
        second = result - first
        format('+', first: first, second: second)
      end
    end

    def make_sub
      start, difference = rand_start
      case rand(3)
      when 0
        format('-', first: start, answer: difference)
      when 1
        format('-', second: start - difference, answer: difference)
      when 2
        format('-', first: start, second: start - difference)
      end
    end

    def rand_start
      result = 0
      result = rand(@max + 1) while result < 2
      first = rand(1...result)
      [result, first]
    end

    def format(operator, first: nil, second: nil, answer: nil)
      ph = '_' * @justify
      "#{(first.nil? ? ph : just(first, true))} #{operator} #{(second.nil? ? ph : just(second))} = #{(answer.nil? ? ph : just(answer))}"
    end

    def just(n, r = false)
      n = n.to_s
      r ? n.rjust(@justify) : n.ljust(@justify)
    end
  end
end

puts Math::AddSubtractGenerator.new(15, 10).generate

