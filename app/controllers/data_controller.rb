class DataController < ApplicationController

  def index
    sp = SerialPort.new("/dev/ttyACM0",9600,8,1,SerialPort::NONE)
    sp = SerialPort.new("/dev/tty.usbmodem621",9600,8,1,SerialPort::NONE)
    #sp = SerialPort.new("/dev/tty.usbserial-A600dgPA",9600,8,1,SerialPort::NONE)
    #sp = SerialPort.new("/dev/ttyUSB0",9600,8,1,SerialPort::NONE)
    sp_char = sp.gets
    flash[:notice] = sp_char
    #respond to xhr
  end

  def show
  end

end
