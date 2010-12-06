class SwitchController < ApplicationController
  def index 
    require 'rubygems'
    Kernel::require 'serialport'

    #params for serial port

    #port_str = '/dev/tty.usbserial-A600dgPA'  #may be different for you
    port_str = '/dev/ttyUSB0'
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
   #lounge 
   if params['on1']
      sp.write "CMD:C011"
    end
    if params['off1']
      sp.write "CMD:C010"
    end
   #topside
    if params['on2']
      sp.write "CMD:C021"
    end
    if params['off2']
      sp.write "CMD:C020"
    end
    #bedroom
     if params['on3']
        sp.write "CMD:C031"
    end
    if params['off3']
      sp.write "CMD:C030"
    end
    #bedroom
   if params['on4']
      sp.write "CMD:C041"
    end
    if params['off4']
      sp.write "CMD:C040"
    end
  end 

  def exit 
  render :text => "Thanks" 
  end 
end

#sp = SerialPort.new("/dev/ttyUSB0",9600,8,1,SerialPort::NONE)