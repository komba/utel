module Utel
  class Operator
    def self.name
      new.name
    end

    def name
      File.open(Utel::DEVICE, "w+") do |f|
        f.write "AT+COPS?\r\n"
        out = ''
        while (s = f.gets) do
          if s.slice(0, 5) == "+COPS"
            out << s.strip.slice(12..-4)
            break
          end
        end
        out
        "Utel 3G" if out =~ /25507/
      end
    end
  end
end
