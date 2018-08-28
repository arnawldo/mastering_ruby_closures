class Array
	def map
    new_array = []
    each { |x| new_array << yield(x) }
    new_array
  end
end

%w(look ma no for loops).map do |x|
  x.upcase
end

class String
  def each_word
    words = self.split(' ')
    words.each { |w| yield(w) }
  end
end

"nothing lasts forever but cold November Rain".each_word do |x|
  puts x
end

class File
  def self.open(filename, mode)
    file_handle = new(filename, mode)
    return file_handle unless block_given?
    yield file_handle
  ensure
    file_handle.close
  end
end

File.open("router.rb", "r") do |f|
  f.each { |line| puts line }
end

module ActiveRecord
  class Schema
    def self.define(version, &block)
      instance_eval &block
    end

    def self.create_table(table_name, options = {}, &block)
      t = Table.new(table_name, options)
      yield t
    end
  end

  class Table
    def initialize(name, options)
      @name = name
      @options = options
    end

    def string(value)
      puts "Creating column of type string named #{value}"
    end

    def integer(value)
      puts "Creating column of type integer names #{value}"
    end

    def datetime(value)
      puts "Creating column of type datetime named #{value}"
    end
  end
end

ActiveRecord::Schema.define(version: 20130315230445) do
  create_table "microposts", force: true do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
