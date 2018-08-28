class Symbol
	def to_proc
    proc { |obj| obj.send(self) }
  end
end

p %w(hello, there).map(&:upcase)

# instantiate classes with #to_proc
class SpiceGirl
  def initialize(name, nick)
    @name = name
    @nick = nick
  end

  def inspect
    "#{@name} (#{@nick} Spice)"
  end

  def self.to_proc
    proc { |args| new(*args) }
  end
end

spice_girls = [['Mel B', 'Scary'], ['Mel C', 'Sporty'], ['Emma B', 'Baby'], ['Geri H', 'Ginger'], ['Vic B', 'Posh']]

p spice_girls.map(&SpiceGirl)
