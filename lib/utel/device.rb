module Utel
  class Device
    def self.send_at
      new.send_at
    end

    def self.pin(*args)
      new.pin(*args)
    end

    def pin(code=PIN_CODE)
      puts code
    end

    def send_at
      File.open(Utel::DEVICE, 'w+') do |f|
        f.write("AT\r\n")
        while (s = f.gets) do
          break if s.slice(0,2) == "OK"
        end
      end
    end
  end
end
