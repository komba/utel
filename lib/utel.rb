require "utel/version"
require "utel/balance"
require "utel/operator"
require "utel/pdu"
require "utel/sms"
require "utel/device"

module Utel
  # usb modem by default
  DEVICE = "/dev/ttyUSB2"
  # default pin code
  PIN_CODE = "0000"
end
