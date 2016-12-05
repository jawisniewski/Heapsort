
public def Rozdziel (childArray)
  childArray.heapsort!
end
public def heapsort!
  j=0
  self.each {
    if(self[j].is_a?(Array)) then
    Rozdziel self[j]
    end
    j +=1
 }
  #    j=0
 # if(self.any? {|word| word.is_a?(Array)})
#  self.each {
#    if(self[j].is_a?(Array)) then
#    Rozdziel self[j]
 #   end
 #   j +=1
#}
end

    1.upto(self.length - 1) do |i|
      child = i
      while child > 0
        parent = (child - 1) / 2
        if (self[parent].is_a?(Array) ) then
          break
        else if( self[child].is_a?(Array)) then
          self[child], self[parent] = self[parent], self[child]
          child = parent
        else
          if self[parent] < self[child]
            self[parent], self[child] = self[child], self[parent]
            child = parent
          else
            break
          end
        end
      end
    end
  end
#sort
  i = self.length - 1
  while i > 0
    self[0], self[i] = self[i], self[0]
    i -= 1
  #move down
    parent = 0
    while parent * 2 + 1 <= i
 	    child = parent * 2 + 1
      if (self[parent].is_a?(Array)) then
        break
      else
        if (child <i and self[child+1].is_a?(Array)) then
          if ( self[child].is_a?(Array)) then
          else
            child += 1
          end
        end
        if( self[child].is_a?(Array)) then
          self[child], self[parent] = self[parent], self[child]
          parent = child
        else
          if child < i && self[child] < self[child + 1]
            child += 1
          end
          if self[parent] < self[child]
            self[parent], self[child] = self[child], self[parent]
            parent = child
          else
            break
          end
        end
      end
    end
  end
end

