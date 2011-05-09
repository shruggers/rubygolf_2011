class Golf
  class << self
    i = 0
    [
    'a.inject :*',
    "a.split.sort_by{|i| i[1]}*' '",
    'hole1 1..a',
    %q{a.map {|i| i.sub(/man(.*)/, 'hat(\0)').sub(/(dog.*)\)/,'\1(bone))').sub('cat','dead') }},
    '(1..4).map{|i| a.each_cons(i).to_a}.inject :+',
    '(1..a).map{|i| 
        s="fizz" if i%3==0
        s="#{s}buzz" if i%5==0
        s || i 
      }',
    'c = nil
    m = []
    a.map { |i|
      i-1 != c ? m << [i] : m[-1] << i
      c = i
    }
    m.map { |i|
      i.size > 1 ? "#{i[0]}-#{i[-1]}" : i[0].to_s
    }',
    'b = [1,1]
      (2..a-1).map {|i| b << b[-2] + b[-1] }
      b',
    "v = File.new(a).map{|l| l.chomp.split ', '}
      loop {
        c = Hash.new 0
        
        v.map {|i| c[i[0]] += 1}

        s = c.sort_by{|i| i[1]}
        l = s[0]
        m = s[-1]

        return m[0] if m[1] > v.size/2.0
        v = v.map{|v| v - [l[0]] } - [[]]
      }"
    ].map {|m| eval "def hole#{i += 1} a
    #{m}
    end"}
  end
end
