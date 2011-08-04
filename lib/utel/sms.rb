module Utel
  class SMS
    def self.send *args
      new.send(*args)
    end

    def send number, message
      out = ''
      File.open(Utel::DEVICE, "w+") do |f|
        f.write "AT+CMGF=1\r\n"
        f.write "AT+CMGS=\"#{number}\"\r\n"
        f.write "#{message}\x1A"

        while(s = f.gets) do
          if s.slice(0, 2) == "OK"
            out << s
            break if out.scan(/OK/).count == 2
          else
            if (s.slice(0, 10) == "+CMS ERROR")
              out << s
              break
            end
          end
        end
      end
      parse_response(out)
    end

    private
      def parse_response output
        output =~ /ERROR/ ? false : true
      end
  end
end
