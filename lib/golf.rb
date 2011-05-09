class Golf
  s = self
  def s.hole1 a
    a.inject :*
  end
  
  def s.hole2 s
    s.split.sort_by { |w| w[1] } * ' '
  end
  
  def s.hole3 n
    n == 1 ? 1 : n * hole3(n-1)
  end
  
  def s.hole4 a
    [
      [/man\(.*\)/, "hat(\\0)"],
      [/dog\(\w+/, "\\0(bone)"],
      ["cat", "dead"]
    ].map { |s, r|
      a.map! {|i| i.sub(s, r) }
    }
    a
  end
  
  def s.hole5 a
    (1..4).map {|n| (0..4-n).map { |i| a[i, n] }}.inject(:+)
  end
  
  def s.hole6 a
    (1..a).map { |i|
      n = ''
      n << 'fizz' if i % 3 == 0
      n << 'buzz' if i % 5 == 0
      n != '' && n || i
    }
  end
  
  def s.hole8 n
    f = proc { |i| i < 3 ? 1 : f[i-1] + f[i-2] }
    (1..n).map(&f)
  end
  
  def s.hole9 f
    v = File.read(f).split(/\n/).map { |l| l.split ", " }
    while true
      c = Hash.new(0)
      v.map(&:first).each { |i| i && c[i] += 1 }
      r = c.invert
      k = r.keys
      a = k.max
      return r[a] if a > v.size/2.0 || c.size == 2
      v.map { |p| p.reject! { |s| s == r[k.min] } }
    end
  end
end
