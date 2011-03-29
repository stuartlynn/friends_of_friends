module  Friends_of_friends


class FOF_finder 
  attr_accessor :data, :chains, :tolerance, :points,:weights
  
  
  def initialize(data, tolerance, weights)
    self.chains = data.collect{|d| [d] }
    self.points = self.chains.clone
    self.tolerance=tolerance
    self.weights =  weights
  end
  
  def reset_chains 
   self.chains=self.points.clone
  end 
  
  
  def update_chains
      i=0
      done = true
      
      while i < chains.size do 
        j=i+1
        while j<chains.size do
        if compare_chains(chains[i],chains[j])
          chains[i] = chains[i] | chains[j]
          chains.delete_at j 
          j=j-1
          done=false 
        end 
        j=j+1
      end
      i=i+1
    end
    
    done 
  end
  
  
  
  def find_groups
    done = false  
    while !self.update_chains
    end
    chains 
  end

  def compare_chains(chain1,chain2) 
    joined = false
    chain1.each do |part1|
      chain2.each do |part2|
        if self.dist(part1, part2) < tolerance
          return true 
        end
      end
    end
    return false
  end
  
  def dist(point1,point2)
    val =0
    point1.each_index do |dim|
      val = val + ( (point1[dim] - point2[dim])*self.weights[dim] )**2 unless weights[dim]==0
    end
    val =Math.sqrt(val.abs)
  end
  
  def chains_to_string
    s=""
    chains.each_with_index do |c,i|
      data= c.collect{|data| data.to_a}
      s<<"#{data},"
    end
    s
  end
  
  def chains_to_csv
    s=""
    chains.each_with_index do |c,chain_no|
      c.each do |data|
        s<<"#{chain_no}, #{data.to_csv}"
      end
      s<<"\n\n"
    end
    s
  end
  
  def centers
    centers=[]
    chains.each do |chain| 
      ave = Array.new(chain.first.count,0)
      chain.each do |point|
        point.each_with_index{|v,i| ave[i]+=v unless weights[i]==0}
      end
      centers<<ave.map{|a| a/chain.count.to_f}
    end
    centers
  end
  
  def chains_to_json
    data=[]
    chains.each_with_index do |c,i|
      data<< c.collect{|data| data.to_a}
    end
    data.to_json
  end
  
  def add_point(point)
    chains <<[point]
    while !self.update_chains
    end
    chains
  end
end

def consensis(array)
  counts = Array.new(array.first.count).collect{|c| {} } 
  array.each do |point|
    point.each_with_index do |v,i|
      (counts[i])[v]||=0
      (counts[i])[v]=(counts[i])[v]+1
    end
  end
  result = Array.new(array.first.count)
  counts.each_with_index do |hist,i|
    result[i]=hist.invert.max[1]
  end
  result
end

def plotChains(out_file,chains)
  Gnuplot.open do |gp|
    Gnuplot::Plot.new( gp ) do |plot|

     
      plot.title  out_file

      plot.xlabel "x"
      plot.ylabel "y"
      
      plot.term "png"
      plot.output out_file
      object_counter =1
      
      plot.xrange "[0:606]"
      plot.yrange "[0:943]"
      #   
      chains.each_with_index do |chain, chain_index|
        puts chain.to_json
        puts "\n\n"
        xdata= chain.collect{|c| c[0]+235}
        ydata= chain.collect{|c| c[1]+131}
        plot.data << Gnuplot::DataSet.new( [xdata,ydata] ) do |ds|
          ds.with = "p"
        end
      end

    end

  end
end

end