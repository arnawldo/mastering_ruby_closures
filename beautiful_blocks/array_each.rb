class Array
  def each
    x = 0
    while x < self.length
      yield self[x]
      x += 1
    end
  end
end

%w(all these words).each do |x|
  puts x
end
