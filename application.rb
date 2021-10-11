require_relative 'temperature.rb'

class Application

  def run
    type_of_degrees = ""
    temperature_amount = ""

    loop do
      IOAdapter.write("Enter type of degrees (F,C,K): ")
      type_of_degrees = IOAdapter.read

      if check_degrees_type(type_of_degrees)
        break
      else
        puts "Incorrect type"
      end
    end

    loop do
      puts "Enter temperature amount: "
      temperature_amount = gets

      if is_number(temperature_amount)
        break
      else
        puts "Incorrect number"
      end
    end

    temperature = create_class(type_of_degrees, temperature_amount.to_f)

    loop do
      puts "Convert to (F, C, K), Q for exit: "
      to_type = gets

      if check_type_of_converter(to_type)
        if to_type[/^[Qq]$/]
          break
        else
          puts convert(temperature, to_type)
        end
      end
    end
  end

  private def check_degrees_type(degrees_type)
    return false unless degrees_type[/^[FfKkCc]/]
    true
  end

  private def is_number(number)
    return false unless number[/^-?[1-9][0-9]*\.?[0-9]*$/]
    true
  end

  private def create_class(type, temperature)
    case
    when type[/^[Cc]$/]
      Temperature::Celsius.new(temperature)
    when type[/^[Kk]$/]
      Temperature::Kelvin.new(temperature)
    when type[/^[Ff]$/]
      Temperature::Fahrenheit.new(temperature)
    end
  end

  private def check_type_of_converter(to_type)
    return false unless to_type[/^[FfKkCcQq]/]
    true
  end

  private def convert(from, to)
    case
    when to[/^[Cc]$/]
      from.to_celsius
    when to[/^[Kk]$/]
      from.to_kelvin
    when to[/^[Ff]$/]
      from.to_fahrenheit
    end
  end
end