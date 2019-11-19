BasicModel = Class.new(Sequel::Model)
class BasicModel
  alias_method :read_attribute_for_serialization, :public_send
  plugin :validation_helpers
end