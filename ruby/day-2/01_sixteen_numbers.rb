(1..16).each do |i|
  print "#{i} "
  puts "" if i % 4 == 0
end

(1..16).each_slice(4) { |s| puts s.join(' ') }
