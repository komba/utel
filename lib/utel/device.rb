module Utel
  class Device
    [:send_at, :pin].each{|method| define_method(method) {|*args| new.send(method, *args) }}

    def pin(code=PIN_CODE)
      File.open(Utel::DEVICE, 'w+') do |f|
        f.write "AT+CPIN=\"code\"\r\n"
        while (s = f.gets) do
          break if s.slice(0,2) == "OK"
        end
      end
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
