class ApplicationController < ActionController::Base
  protect_from_forgery
end

class SerialConnection
  def self.connection
    @connection ||= establish_connection
  end

  def self.establish_connection
    Kernel::require 'serialport.so'

    #params for serial port

    port_str = '/dev/tty.usbserial-A600dgPA'  #may be different for you
    #port_str = '/dev/ttyUSB0'
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    
    SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity).tap{ |conn|
      #conn.write "\r\n"
      #conn.flush
      sleep 2     
    }
  end
  
  def self.send(data)
    connection.write(data)
    #while (received = connection.gets.strip) != data
      #sleep 0.5
    #end
    #received
    data
  end
end