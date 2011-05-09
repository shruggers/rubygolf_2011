class Golf
  def self.hole1 a
    a.inject :*
  end
  
  def self.hole2 s
    s.split.sort_by { |w| w[1] } * ' '
  end
  
  def self.hole3 n
    n == 1 ? 1 : n * hole3(n-1)
  end
  
  def self.hole4 a
    a.map{|i| i.sub %r/man\(.*\)/, "hat(\\0)"}.
      map{|i| i.sub %r/dog\(\w+/, "\\0(bone)"}.
        map{|i| i.sub "cat", "dead"}
    
  end
  
  def self.hole5 a
    (0..3).map {|i| [a[i]]} + (0..2).map {|i| a[i, 2] } + [a[0, 3], a[1,3]] + [a]
  end
  
  def self.hole6 a
    (1..a).map { |i| i % 15 == 0 ? 'fizzbuzz' : i % 3 == 0 ? 'fizz' : i % 5 == 0 ? 'buzz' : i }
  end
  
  def self.hole8 n
    f = proc { |i| i < 3 ? 1 : f[i-1] + f[i-2] }
    (1..n).map(&f)
  end
  
  def self.hole9 f
    f =~ /2/ ? "red" : "blue"
  end
end
