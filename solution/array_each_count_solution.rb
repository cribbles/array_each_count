class Array
  def each_count method = nil, *args
    raise ArgumentError, "block supplied with arguments" if block_given? && !method.nil?

    memo = {}
    self.each do |item|
      item = item.send(method, *args) if !method.nil?
      item = yield(item) if block_given?
      memo.include?(item) ? memo[item] += 1 : memo[item] = 1
    end
    memo
  end
end
