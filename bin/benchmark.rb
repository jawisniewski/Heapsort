#! /usr/bin/env ruby
require 'benchmark'
require '../lib/heapsort.rb'

rand1 = (1..200000).map { rand }
rand2 = (1..500000).map { rand }
rand3 = rand1, rand2
Benchmark.bm do |x|
  x.report('heapsort  200000') { rand1.dup.heapsort! }
  x.report('heapsort 500000') { rand2.dup.heapsort! }
    x.report('heapsort table [rand1],[rand2]') { rand3.dup.heapsort! }
end
