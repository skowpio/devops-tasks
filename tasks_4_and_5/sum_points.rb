#!/usr/bin/ruby
# Piotr Skowron

pointsAll = Array.new

def addPoints(points,pointsAll)
  if points.any?
    points.each { |x| x.map(&:to_i).each { |y| pointsAll.push(y) } }
  end
end

File.open("data.txt", "r") do |f|
  prev_line = ""
  points_regex = /\[\s?([0-9]+)\s?pts/
  points_nl_regex = /\[\s?([0-9]+)\s?/
  
  f.each_line do |line|
    points = line.scan(points_regex)
    # scan with capture group produce array of array, and results are string
     addPoints(points, pointsAll)

    # case when [XXpts ] break to the new line    
    if line.match('^\s?pts')
      points = prev_line.scan(points_nl_regex)
      addPoints(points, pointsAll)
    end
    prev_line = line
  end
end

# make sure that we got at least 0 value in array, and print sum of the array
puts "Total points: "+ pointsAll.inject(0){|sum,x| sum + x }.to_s
