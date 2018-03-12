module JsonMend
  class StringDeque
    def initialize(value)
      if value.is_a? String
        @value = value
      else
        raise ArgumentError.new 'must be a String'
      end
    end

    def pop!
      right = @value[-1]
      @value = @value.slice(0, @value.length-1)
      return right
    end

    def push!(letter)
      if letter.respond_to?(:[])
        @value = @value + letter[0].to_s
      end
      @value
    end

    def shift!
      left = @value[0]
      @value = @value.slice(1, @value.length-1)
      return left
    end

    def unshift!(letter)
      if letter.respond_to?(:[])
        @value = letter[0].to_s + @value
      end
      @value
    end

    def method_missing(method, *args, &block)
      if @value.respond_to?(method)
        @value.public_send(method, *args, &block)
      else
        super
      end
    end

    def inspect
      @value.inspect
    end

    def to_s
      @value.to_s
    end
  end
end
