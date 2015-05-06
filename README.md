# Array#each_count

A simple Ruby code kata designed for rspec, inspired by Alex Chaffee's [Test First Ruby](https://github.com/alexch/learn_ruby).

## Description

Create a method, `Array#each_count`, which returns a count of discrete elements contained in the form of `{element => count}`.

Your method should meet the following criteria:

* When called without arguments or a block, it should iterate over each element of _self_, returning a count of its unique elements.

* It should accept a method (in symbol or string format) followed by any number of arguments as parameters. It should apply these parameters to each element of _self_, returning a count of each unique return value.

* It should accept a block, call the block on each element of _self_, and return a count of each unique return value.

## Examples

Given an array _cities_:

_`cities = ["Melbourne", "Dallas", "Taipei", "Toronto", "Dallas", "Kathmandu"]`_

**`cities.each_count`** should return:

_`# => {"Melbourne"=>1, "Dallas"=>2, "Taipei"=>1, "Toronto"=>1, "Kathmandu"=>1}`_

**`cities.each_count :length`** should return:

_`# => {9=>2, 6=>3, 7=>1}`_

**`cities.each_count :gsub, /[aeiou]/, 'x'`** should return:

_`# => {"Mxlbxxrnx"=>1, "Dxllxs"=>2, "Txxpxx"=>1, "Txrxntx"=>1, "Kxthmxndx"=>1}`_

**`cities.each_count {|city| city.length % 3 == 0}`** should return:

_`# => {true=>5, false=>1}`_
