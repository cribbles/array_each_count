# # Topics
#
# * send
# * blocks
# * yield
# * reopening classes
#
# Create a method, `Array#each_count`, which returns a count of
# discrete elements contained in the form of {element => count}.
#
# Your method should meet the following criteria:
#
# * When called without arguments or a block, it should iterate over
#   each element of self, returning a count of its unique elements.
#
# * It should accept a method (in symbol or string format) followed
#   by any number of arguments as parameters. It should apply these
#   parameters to each element of self, returning a count of each
#   unique return value.
#
# * It should accept a block, call the block on each element of
#   self, and return a count of each unique return value.

require 'array_each_count'
require 'date'

cities = ["New York", "Seattle", "Kathmandu", "New York", "Chicago"]

dates = [DateTime.parse('3rd Feb 2001 04:05:06 PM'), \
         DateTime.parse('15th Jan 1992 08:05:06 PM'), \
         DateTime.parse('July 19 2012 14:01'), \
         DateTime.parse('April 1st 2005 03:55 AM'), \
         DateTime.parse('22/01/2014 8:20 PM'), \
         DateTime.parse('5 October 1999 2:03:19')]

# cities.each_count
cities_result = {"New York"=>2, "Seattle"=>1, "Kathmandu"=>1, "Chicago"=>1}
# cities.each_count :length
cities_length_result = {8=>2, 7=>2, 9=>1}
# cities.each_count :gsub, /[aeiou]/, 'x'
cities_gsub_result = {"Nxw Yxrk"=>2, "Sxxttlx"=>1, "Kxthmxndx"=>1, "Chxcxgx"=>1}

# dates.each_count :wday
dates_method_result = {6=>1, 3=>2, 4=>1, 5=>1, 2=>1}
# dates.each_count :strftime, "%l %p"
dates_args_result = {" 4 PM"=>1, " 8 PM"=>2, " 2 PM"=>1, " 3 AM"=>1, " 2 AM"=>1}

# a simple cities#each_count test with a block
cities_with_block = cities.each_count {|city| city.length % 3 == 0}
cities_with_block_result = {false=>4, true=>1}

# a lengthier dates#each_count test with a block
verbose_days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
dates_with_block = dates.each_count {|dt| verbose_days[dt.wday]}
dates_with_block_result = {"Saturday"=>1, "Wednesday"=>2, "Thursday"=>1, \
                          "Friday"=>1, "Tuesday"=>1}

describe "Array#each_count" do
  it "returns an empty hash when called on an empty array" do
    Array.new.each_count.should == {}
  end

  it "performs a simple count" do
    cities.each_count.should == cities_result
  end

  it "performs a count with a simple method" do
    cities.each_count(:length).should == cities_length_result
    dates.each_count(:wday).should == dates_method_result
  end

  it "performs a count with a method and arguments" do
    dates.each_count(:strftime, "%l %p").should == dates_args_result
    cities.each_count(:gsub, /[aeiou]/, 'x').should == cities_gsub_result
  end

  it "performs a count with a code block" do
    cities_with_block.should == cities_with_block_result
    dates_with_block.should == dates_with_block_result
  end
end
