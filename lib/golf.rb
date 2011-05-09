class Golf
  class << self
    def hole1(a)
      a.inject(1){|m,i| i*m}
    end
    
    def hole2(s)
      s.split(' ').sort_by{|w| w[1]}.join(' ')
    end
    
    def hole3(n)
      hole1(1..n)
    end
    
    def hole4(a)
      a.map {|i| i.sub(/man(.*)/, 'hat(\0)') }.
        map {|i| i.sub(/(dog.*)\)/,'\1(bone))') }.
        map {|i| i.sub('cat','dead')}
    end
    
    def hole5(a)
      (0..a.size).inject([]){|m,i| m + (0..a.size-i-1).map {|j| a[j..j+i] }  }
    end
    
    def hole6(n)
      (1..n).map{|i| (i%3 == 0 && i%5 == 0 && 'fizzbuzz') || (i%3 == 0  && 'fizz') || (i%5 == 0 && 'buzz') ||  i }
    end
    
    def hole8(n)
      a = [1,1]
      (2..n-1).each {|i| a << a[-2..-1].inject(0){|m,j| m+j}; }
      a
    end
    
    def hole9(f)
      v = File.read(f).split("\n").map{|l| l.split(', ')}
      count(v)
    end
    
    def count(v)
      
      c = v.flatten.uniq.inject({}){|m,i| m.merge(i => 0)}
      
      v.each {|can| c[can[0]] += 1}
      
      sorted = c.to_a.sort_by{|i| i[1]}
      least = sorted[0]
      most = sorted[-1]
      
      return most[0] if most[1] > v.size/2.0
      v = reject_and_dist(least[0], v)
      
      count(v)
    end
    
    def reject_and_dist(can, votes)
      votes.map {|v| v - [can] }.reject(&:empty?)
    end
  end
end
