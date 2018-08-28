class Fixnum
  def times
    x = 0
    while x < self
      yield
      x += 1
    end
    self
  end
end
