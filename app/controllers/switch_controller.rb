class SerialConnection
  def self.connection
    @connection ||= establish_connection
  end

  def self.establish_connection
    Kernel::require 'serialport.so'

    #params for serial port

    #port_str = '/dev/tty.usbserial-A600dgPA'  #may be different for you
    port_str = '/dev/ttyUSB0'
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

class SwitchController < ApplicationController
  def index 
    
   #lounge 
   if params['on1']
      write "CMD:C011"
      flash[:notice] = write("1 on")
    end
    if params['off1']
      write "CMD:C010"
      flash[:notice] = write("1 off")
    end
   #topside
    if params['on2']
      write "CMD:C021"
      flash[:notice] = write("2 on")
    end
    if params['off2']
      write "CMD:C020"
      flash[:notice] = write("2 off")
    end
    #bedroom
     if params['on3']
        write "CMD:C031"
        flash[:notice] = write("3 on")
    end
    if params['off3']
      write "CMD:C030"
      flash[:notice] = write("3 off")
    end
    #bedroom
   if params['on4']
      write "CMD:C041"
      flash[:notice] = write("4 on")
    end
    if params['off4']
      write "CMD:C040"
      flash[:notice] = write("4 off")
    end
    

  end 

  def write(cmd)
    SerialConnection.send cmd
  end

  def exit 
  render :text => "Thanks" 
  end 
end

#sp = SerialPort.new("/dev/ttyUSB0",9600,8,1,SerialPort::NONE)