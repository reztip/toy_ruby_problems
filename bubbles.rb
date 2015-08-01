require 'set'

def rand_n(n, max)
    randoms = Set.new
    loop do
        randoms << rand(max)
        return randoms.to_a if randoms.size >= n
    end
end

def bubble_sort(ary)
	array = ary.map {|e| e}
	a_len = array.length - 1
	until sorted?(array)
	  i = 0
	  until i >= a_len
	    if array[i] > array[i+1]
	    	array[i], array[i+1] = array[i+1], array[i]
	    end
	    i+=1
	  end
	end
	return array
end

def sorted?(ary)
  (0...ary.length-1).each do |i|
    if ary[i] > ary[i+1]
      return false
    end
  end
  true
end



def block_sorted?(ary)
    (0...ary.length-1).each do |i|
    comparison = yield [ary[i], ary[i+1]]
    if comparison > 0
      return false
    end
  end
  true
end

def bubble_sort_by(ary, &block)
  array = ary.map {|e| e}
  until block_sorted?(array, &block)
	  (0...array.length - 1).each do |i|
	  	comparison = block.call(array[i], array[i+1])
	  	if comparison > 0
	  	  array[i], array[i+1] = array[i+1], array[i]
	  	end
	  end
  end
  return array
end

5.times do 
  p bubble_sort_by([5,4,3,2,1]) {|left, right| right-left}
end