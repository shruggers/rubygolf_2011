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
    [
      [/man\(.*\)/, "hat(\\0)"],
      [/dog\(\w+/, "\\0(bone)"],
      ["cat", "dead"]
    ].map { |s, r|
      a.map! {|i| i.sub(s, r) }
    }
    a
  end
  
  def self.hole5 a
    (1..4).map {|n| (0..4-n).map { |i| a[i, n] }}.inject(:+)
  end
  
  def self.hole6 a
    (1..a).map { |i| i % 15 == 0 ? 'fizzbuzz' : i % 3 == 0 ? 'fizz' : i % 5 == 0 ? 'buzz' : i }
  end
  
  def self.hole8 n
    f = proc { |i| i < 3 ? 1 : f[i-1] + f[i-2] }
    (1..n).map(&f)
  end
  
  def self.hole9 f
    v = File.read(f).split(/\n/).map { |l| l.split ", " }
    while true
      c = Hash.new(0)
      v.map(&:first).each { |i| i && c[i] += 1 }
      r = c.invert
      a = r.keys.max
      return r[a] if a > (v.size/2.0) || c.size == 2
      v.map { |p| p.reject! { |s| s == r[r.keys.min] } }
    end
  end
end
