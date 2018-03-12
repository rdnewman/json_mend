require "json_mend/version"
require "json_mend/mender"

module JsonMend
  def JsonMend.mend(string)
    JsonMend::Mender.new(string).mend
  end
end
