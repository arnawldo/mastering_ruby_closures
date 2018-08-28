## notifier practice

# load 'notifier.rb'

# good_report = OpenStruct.new(to_csv: "59.99, Great Success")

# Notifier.new(Generator.new(good_report),
#              on_success: lambda { |r| puts "Send #{r} to boss@acme.co" },
#              on_failure: lambda { puts "Send email to ben@acme.co" }
# ).tap do
#   |n|
#   n.run
# end

# bad_report = OpenStruct.new(to_csv: nil)

# Notifier.new(Generator.new(bad_report),
#              on_success: lambda { |r| puts "Send #{r} to boss@acme.co" },
#              on_failure: lambda { puts "Send email to ben@acme.co" }
# ).tap do
#   |n|
#   n.run
# end

## adder practice

adder.call(11, [1, 2, 3])
