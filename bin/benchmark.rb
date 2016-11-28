require 'benchmark'
require './lib/heapsort.rb'

rand1 = (1..500_000).map { rand }
rand2 = (1..1_000_000).map { rand }

Benchmark.bm(4) do |x|
  x.report('heapsort  500_000') { rand2.dup.heapsort! }
  x.report('heapsort 1_000_000') { rand1.dup.heapsort! }
end
