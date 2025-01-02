def read_file(file_name, arr)
  count = 0
  File.open(file_name, 'r') do |f|
    until (f.eof)
      arr << f.readline.chomp
      count += 1 
    end
  end
end

def hash_function(str)
  hash_code = 0
  str.each_char do |char|
    hash_code = 31*hash_code + char.ord
  end
  hash_code
end

arr = []
arr_count = []
read_file('words.txt', arr)

# arr_sample = Array.new(3, arr.sample)

arr_sample = arr.sample(10)
puts arr_sample




# 1..500.times do |_|
#   word = arr.sample
#   arr_count << hash_function(word)%1024
#   puts "arr:#{word}: -> hash_function: #{hash_function(word)%16}"
# end

# p arr_count.tally.sort_by {|key,value| value}.reverse




# p arr
# p arr.length