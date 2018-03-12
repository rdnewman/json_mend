module JsonMend
  class Mender
    def initialize(original_string)
      @subject = original_string
    end

    def clean
      # strip off outside whitespace
      result = @subject.strip

      # remove newline characters
      newline = /\n/
      result = result.gsub(newline, '')

      # # object key names should be in quotes
      # quote_keys = /\s*([^\"\'])(\w*)([^\"\'])\s*\:\s*/
      # result = result.gsub(quote_keys, '"\1\2\3": ');
      #
      # # change value quotes to be double quoted
      # requote_values = /((?<![\\])['])((?:.(?!(?<![\\])\1))*.?)\1/
      # result = result.gsub(requote_values, '"\1\2\3": ');

      result
    end

    def mend
      mend_object(@subject)
      # return cleaned
    end

  # private
    def parseable?(string)
      begin
        Oj.load(string)
        true
      rescue Oj::ParserError
        false
      end
    end

    def mend_object(string)
      if parseable?(subject)
        return {parseable: true, result: string, amended: false}
      end

      subject = string.strip

      left = subject[0]
      right = subject[-1]
      potential = subject

      # not an object if no beginning or ending braces
      if (left != '{') && (right != '}')
        return result
      end

      if (left == '{') && (right == '}')
        result[:parseable] = true
        return result
      end

      if (left == '{')
        potential = subject
        potential.shift
        right = '}'
      elsif (right == '}')
        potential = subject
        potential.pop
        left = '{'
      end

      unless parseable?(potential)
        verdict = mend_value_pairs(potential)
        potential = verdict[:result]
        par
      end

      result = left + potential + right
      return {parseable: true, result: result, amended: true}
    end

    def mend_value_pairs(string)
      return {parseable: false, result: string, amended: false}
    end
  end
end
