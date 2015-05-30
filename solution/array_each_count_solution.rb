class Array
  def each_count *args
    raise ArgumentError, "block supplied with arguments" if block_given? && !args.empty?

    each_with_object(Hash.new) do |item, hash|
      item = item.send(*args) unless args.empty?
      item = yield(item) if block_given?
      hash[item] ||= 0
      hash[item] += 1
    end
  end
end
