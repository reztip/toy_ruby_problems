module Enumerable
  def my_each
  	for x in self
  		yield x
  	end
  	return self
  end



  def my_each_with_index
  	i = 0
    for x in self
      yield x, i
      i+=1
    end
  	return self
  end


  def my_select(&block)
  	ary = []
  	for x in self
  		pass = block.call(x)
  		if pass
 		  ary << x
  		end
    end
  	ary
  end

  def my_all?(&block)
  	for x in self
  		unless block.call(x)
  			return false
  		end
  	end
  	true  
  end

  def my_any?(&block)
  	for x in self
  		if block.call(x)
  			return true
  		end
  	end
  	return false
  end

  def my_none?(&block)
  	for x in self
  		if block.call(x)
  			return false
  		end
  	end
  	return true
  end

  def my_count(&block)
  	return my_select(&block).length
  end

  def my_map(proc = nil, &block)
  	a1 = []
  	a2 = []
  	if proc
  	  ary = a1
  	  self.my_each do |x|
  		ary << proc.call(x)
  	  end
  	end
    if block_given?
    	ary = a2
    	self.my_each do |x|
    		ary << block.call(x)
    	end
    end

    if proc && block_given?
    	return [a1, a2]
    elsif proc
    	return a1
    elsif block_given?
    	return a2
   	else
   		nil
   	end

  end

  def my_inject(starting, &block)
  	  self.each do  |x|
        starting = block.call(starting, x)
      end
    return starting
  end
end

puts (1..5).my_map {|x| x**2 }