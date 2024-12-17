class Boomerang
  def self.boomerang?(array)
    return false if array.size < 3

    first_num = array.first
    second_num = array[1]

    if first_num < second_num
      increasing = true
    elsif first_num > second_num
      increasing = false
    else
      return false
    end

    switched = 0
    1.upto(array.size-1) do |idx|
      if array[idx] > array[idx - 1]
        if increasing
          next
        else 
          switched += 1
          increasing = !increasing
        end
      elsif array[idx] < array[idx - 1]
        if increasing
          switched += 1
          increasing = !increasing
        else 
          next
        end
      else
        return false
      end
    end

    switched == 1
  end
end