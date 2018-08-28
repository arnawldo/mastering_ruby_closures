module Enumerable
  def lax
    Lax.new(self)
  end
end

class Lax < Enumerator
  def initialize(receiver)
    super() do |yielder|
      receiver.each do |val|
        yielder << val  
      end
    end
  end
end

def map(&block)
  Lax.new(self)
end

lax = Lax.new([1, 2, 3])
lax.map { |x| puts "map: #{x}"; x }
# 1.upto(Float::INFINITY)
#   .lax 
#   .map { |x| x*x }
#   .map { |x| x+1 }
#   .take(5)
#   .to_a
