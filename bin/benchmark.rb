#! /usr/bin/env ruby
require 'benchmark'
require '../lib/heapsort.rb'

rand1 = (1..200000).map { rand }
rand2 = (1..500000).map { rand }
rand3 = rand1, rand2
 rand4 = 4000.times.map { ('a'..'z').to_a.shuffle[0..4].join}

  rand5 = 400000.times.map { ('a'..'z').to_a.shuffle[0..25].join}
Benchmark.bm do |x|

          x.report('heapsort string 4000 [0-4]') { rand5.dup.heapsort! }
        x.report('heapsort string 400000 [0..25]') { rand4.dup.heapsort! }
  x.report('heapsort  200000') { rand1.dup.heapsort! }
  x.report('heapsort 500000') { rand2.dup.heapsort! }
    x.report('heapsort table [rand1],[rand2]') { rand3.dup.heapsort! }


end

Benchmark.bm do |x|

    x.report('heapsort string') { rand5.dup.sort }
  x.report('heapsort string') { rand4.dup.sort }

  x.report('heapsort  200000') { rand1.dup.sort }
  x.report('heapsort 500000') { rand2.dup.sort }
    x.report('heapsort table [rand1],[rand2]') { rand3.dup.sort }
end
