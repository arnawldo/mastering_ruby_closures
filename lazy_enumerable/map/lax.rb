def map(&block)
  Lax.new(self) do |yielder, val|
  	yielder << block.call(val)
  end
end
