
module Math
  class AddSubtractGenerator
    def initialize(rows, max)
      @justify = max.to_s.size
      @rows = rows
      @max = max
    end

    def generate
      @rows.times.map do |n|
        row = 3.times.map{ make_sum_question(@max) }
        "#{(n + 1).to_s.rjust(@justify)}:  #{row.join("  |  ")}\n\n"
      end
    end

    private

    def just(n)
      n.to_s.ljust(@justify)
    end

    def make_sum_question(max)
      result = 0
      result = rand(max + 1) while result < 2
      first = rand(1...result)
      case rand(3)
      when 0
        "#{just(first)} + __ = #{just(result)}"
      when 1
        "__ + #{just(first)} = #{just(result)}"
      when 2
        second = result - first
        "#{just(first)} + #{just(second)} = __"
      end
    end

    def format(first: nil, second: nil, answer: nil)
    end

  end
end

puts Math::AddSubtractGenerator.new(15, 20).generate

