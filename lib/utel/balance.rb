module Utel
  class Balance
    class << self
      [:summary, :vas].each{|method| define_method(method) { new.send(method) }}
    end

    def summary
      call_ussd "*100#"
    end

    def vas
      call_ussd "*121#"
    end

    private
      # @param [String] number USSD number service
      def call_ussd number
        File.open(Utel::DEVICE, "w+") do |f|
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
        out
      end
  end
end
