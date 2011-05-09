class Golf
  class << self
    def hole1 a
      a.inject :*
    end
    
    def hole2 s
      s.split(' ').sort_by{|i| i[1]}.join ' '
    end
    
    def hole3 n
      hole1 1..n
    end
    
    def hole4 a
      a.map {|i| i.sub(/man(.*)/, 'hat(\0)').sub(/(dog.*)\)/,'\1(bone))').sub('cat','dead') }
    end
    
    def hole5 a
      b=a.size
      c=[]
      (0..b).map{|i| c += (0..b-i-1).map {|j| a[j..j+i] }  }
      c
    end
    
    def hole6 n
      (1..n).map{|i| i%15 == 0 && 'fizzbuzz' || i%3 == 0  && 'fizz' || i%5 == 0 && 'buzz' ||  i }
    end
    
    def hole8 n
      a = [1,1]
      (2..n-1).each {|i| a << a[-2] + a[-1] }
      a
    end
    
    def hole9 f
      v = File.open(f).map{|l| l.chomp.split ', '}
      loop {
        c = {}
        
        v.map {|i| c[i[0]] ||= 0
          c[i[0]] += 1}

        s = c.sort_by{|i| i[1]}
        l = s[0]
        m = s[-1]

        return m[0] if m[1] > v.size/2.0
        v = v.map{|v| v - [l[0]] } - [[]]
      }
    end
  end
end
