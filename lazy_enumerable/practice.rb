module Enumerable
  def lax
    Lax.new(self)
  end
end

class Lax < Enumerator

  def initialize(receiver)
    super() do |yielder|
      begin
        receiver.each do |val|
          if block_given?
            yield(yielder, val)
          else
            yielder << val
          end
        end
      rescue StopIteration
      end
    end
  end

  def select(&block)
    Lax.new(self) do |yielder, val|
      yielder << val if block.call(val)
    end
  end

  def drop(n)
    i = 0
    Lax.new(self) do |yielder, val|
      yielder << val if i >= n
      i += 1
    end
  end
end

e = [1, 2, 3].lax.select { |x| x < 3 }
p e.next
p e.next

e = [1, 2, 3, 5, 6, 7].lax.drop(2)
p e.next
p e.next
p e.next
