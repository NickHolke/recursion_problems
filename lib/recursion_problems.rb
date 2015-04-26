#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

def sum_recur(array)
  return 0 if array.empty?

  new = array.dup

  new.shift + sum_recur(new)
end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

def includes?(array, target)
  new_arr = array.dup.sort

  mid = array.length/2

  return true if new_arr[mid] == target
  return false if new_arr.length == 0

  left = new_arr[0...mid]
  right = new_arr[mid+1..-1]

  if target > new_arr[mid]
    includes?(right,target)
  else
    includes?(left,target)
  end
end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  new_array = array.dup

  counter = 0
  counter += 1 if new_array.shift == target
  return counter if new_array.empty?


  counter += num_occur(new_array,target)

  counter

end


#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  new_array = array.dup

  return false if new_array.empty?

  if new_array.take(2).inject(:+) == 12
    true
  else
    new_array.shift
    add_to_twelve?(new_array)
  end
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.

def sorted?(array)
  new_array = array.dup

  a = new_array.shift
  b = new_array.shift

  return true if new_array.empty?

  if a > b
    false
  else
    new_array.unshift(b)
    sorted?(new_array)
  end
end


#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)

def reverse(number)
  copy = number.to_s.dup

  digits = copy.split('').map(&:to_i)

  reversed = []
  reversed << digits.pop

  return reversed if number.to_s.length == 1

  reversed + reverse(digits.join.to_i)
end
