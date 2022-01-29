class Connection
  def initialize(user, password)
    @user, @password = user, password
  end

  def inspect
    "#<#{self.class} @user=#{@user} @password=#{@password.to_s.gsub(/./, '*')}>"
  end
end

class Text
  @@defaults = {
    font_size: 3,
    font_family: "Palatino",
    margin: 20,
    padding: 5,
    leter_spacing: 3
  }

  class Properties < Hash
    def pretty_print(pp)
      pp.group 0, "{", "}" do
        self.each_pair do |k, v|
          pp.comma_breakable
          pp.text "#{k}"
          pp.pp v
        end
      end
    end
  end

  def initialize(value, properties = {})
    @value = value
    @properties = Properties[@@defaults.merge(properties)]
  end

  def pretty_print(pp)
    pp.object_address_group self do
      pp.breakable
      pp.text "@value="
      pp.pp @value
      pp.breakable
      pp.text "@properties="
      pp.pp @properties
    end
  end

  alias inspect pretty_print_inspect
end
