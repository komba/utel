module Utel
  class Balance
    def self.summary
      new.summary
    end

    def self.vas
      new.vas
    end

    def summary
      get_balance "*100#"
    end

    def vas
      get_balance "*121#"
    end

    private
      # @param [String] number USSD number service
      def get_balance number
        File.open("/dev/ttyUSB2", "w+") do |f|
          f.write "AT+CUSD=1,#{Utel::Pdu.encode(number)},15\r\n"
          parse_result f
        end
      end

      def parse_result file_link
        out = ''
        while (s = file_link.gets) do
          if s.slice(0, 5) == "+CUSD"
            out << Utel::Pdu.decode(s.strip.slice(10..-5))
            if out.include?("1 - Dalee")
              file_link.write "AT+CUSD=1,#{Utel::Pdu.encode('1')},15\r\n"
            else
              break
            end
          end
        end
      end
  end
end
