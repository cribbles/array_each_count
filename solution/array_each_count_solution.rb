class Array
  def each_count *args
    raise ArgumentError, "block supplied with arguments" if block_given? && !args.empty?

    memo = {}
    self.each do |item|
      item = item.send(*args) if not args.empty?
      item = yield(item) if block_given?
      memo.include?(item) ? memo[item] += 1 : memo[item] = 1
    end
    memo
  end
end
