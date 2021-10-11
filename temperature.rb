class Temperature

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_kelvin
  end

  def to_celsius
  end

  def to_fahrenheit
  end

  class Celsius < Temperature
    def to_kelvin
      Kelvin(@value + 273.15)
    end

    def to_celsius
      Celsius(@value)
    end

    def to_fahrenheit
      Fahrenheit(@value * 1.8 + 32)
    end
  end

  class Fahrenheit < Temperature

    def to_kelvin
      Kelvin((@value - 32) * (5 / 9) + 273.15)
    end

    def to_celsius
      Celsius((@value - 32) * (5 / 9))
    end

    def to_fahrenheit
      Fahrenheit(@value)
    end
  end

  class Kelvin < Temperature

    def to_kelvin
      Kelvin(@value)
    end

    def to_celsius
      Celsius(@value - 273.15)
    end

    def to_fahrenheit
      Fahrenheit((@value * 1.8) - 459)
    end
  end
end