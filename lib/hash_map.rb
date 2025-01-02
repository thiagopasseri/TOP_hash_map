class HashMap
  attr_accessor :load_factor, :capacity, :array, :word_array, :size


  def initialize
    @load_factor = 0.8
    @capacity = 4
    @size = 0
    @array = Array.new(@capacity)
  end

  def hash(str)
    hash_code = 0
    str.each_char do |char|
      hash_code = 31*hash_code + char.ord
    end
    hash_code % @capacity
  end

  def read_file(file_name, arr)
    count = 0
    File.open(file_name, 'r') do |f|
      until (f.eof)
        arr << f.readline.chomp
        count += 1 
      end
    end
  end

  def set(key, value)
    node = Node.new([key, value])
    hash_code = hash(key) 

    target_bucket = @array[hash_code]
    # puts "target_bucked_class: #{target_bucket.class}"

    if target_bucket.class == LinkedList
      index = target_bucket.contains_key?(key)
      if index != false
        target_bucket.remove_at(index)
        target_bucket.insert_at([key, value], index)
        # p target_bucket.array_list
      else
        target_bucket.append(node)
        @size += 1
      end
    elsif target_bucket == nil
      new_list = LinkedList.new(node)
      @array[hash_code] = new_list
      @size += 1
    end
    # puts "capacity: #{@capacity}, load_factor: #{load_factor} -> #{@capacity*@load_factor} -> size: #{size}"
    refresh if @capacity * @load_factor  <= @size

  end

  def get(key)
    hash_code = hash(key)
    # puts "key: #{key} - hash_code: #{hash_code}"
    index = @array[hash_code]&.contains_key?(key)
    # puts "index: #{index}"
    if index != nil
      @array[hash_code].at(index).value[1]
    else
      nil
    end
  end

  def remove(key)
    hash_code = hash(key)

    index = @array[hash_code]&.contains_key?(key)
    if index != nil
      @array[hash_code].remove_at(index)
    else
      nil
    end
  end

  def has(key)
    hash_code = hash(key)
    index = @array[hash_code]&.contains_key?(key)
    !!index

  end

  def reset
    @array = Array.new(@capacity)
    @size = 0
  end

  def refresh
      # puts "vetor dobrando de tamanho de #{@capacity} para #{2*@capacity}"
      @capacity *= 2

      old_array = to_array
      reset
      old_array.each do |element|
        set(element[0], element[1])
      end
  end

  # or entries
  def to_array
    arr = []
    # puts "array #{@array}"
    @array.each do |element|
      # puts "element: #{element}"
      arr += element.array_list if element != nil
    end
    arr
  end

  def to_s
    @array.each_with_index do |element, index|
      puts "bucket #{index}: #{element}"
    end
  end

  def length
    @size
  end

  def clear
    reset
  end

  def keys
    arr = []
    to_array.each do |element|
      arr << element[0]
    end
    arr
  end

  def values
    arr = []
    to_array.each do |element|
      arr << element[1]
    end
    arr
  end


end

