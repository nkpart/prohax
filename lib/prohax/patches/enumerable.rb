module Enumerable
  def index_by &key_function
    inject({}) do |accum, elem|
      accum[key_function.call(elem)] = elem
      accum
    end
  end

  def as_index_for &value_function
    inject({}) do |accum, elem|
      accum[elem] = value_function.call(elem)
      accum
    end
  end

  def take_while &pred
    result = []
    each do |elem|
      if (!pred.call(elem))
        return result
      end
      result << elem
    end
  end

  def group_by &key_function
    inject(Hash.new { |h,k| h[k] = [] }) do |hsh,elem|
      hsh[key_function.call(elem)] << elem
      hsh
    end
  end

  def grepv re
    select { |s| s !~ re }
  end

  def zip_with arr, &blk
    zip(arr).map(&blk)
  end

  def inject_with sym
    inject { |a, b| a.send(sym, b) }
  end
end
