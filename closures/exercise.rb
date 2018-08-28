MusicDB = lambda do 
  tracks = {}

  insert = lambda { |artist, title| tracks[artist] = title }

  dump = lambda { tracks }

  delete = lambda do |artist| 
  	deleted = tracks[artist]
  	tracks[artist] = nil
  	deleted
  end

  {insert: insert, dump: dump, delete: delete}
end

p db = MusicDB.call

p db[:insert].call("Eagles", "Hell Freezes Over")

p db[:insert].call("Pink Floyd", "The Wall")

p db[:dump].call

p db[:delete].call("Pink Floyd")

p db[:dump].call


complement = lambda do |predicate|
  lambda do |value| 
    not predicate.call(value)
  end
end

is_even = lambda { |n| n % 2 == 0 }
p complement.call(is_even).call(4) #=> false
p complement.call(is_even).call(5) #=> true


reduce = lambda do |acc, arr| 
  if arr.empty?
    acc
  else
    reduce.call(acc.push(arr.first * 2), arr.drop(1))
  end
end

p reduce.call([], [1, 2, 3, 4, 5])
