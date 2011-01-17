class SwitchController < ApplicationController
  def index 
    
   #lounge 
   if params['on1']
      write "CMD:C011"
      sleep 0.5
      write "CMD:C011"
      flash[:notice] = write("1 on")
    end
    if params['off1']
      write "CMD:C010"
      sleep 0.5
      write "CMD:C010"
      flash[:notice] = write("1 off")
    end
   #topside
    if params['on2']
      write "CMD:C021"
      sleep 0.5
      write "CMD:C021"
      flash[:notice] = write("2 on")
    end
    if params['off2']
      write "CMD:C020"
      sleep 0.5
      write "CMD:C020"
      flash[:notice] = write("2 off")
    end
    #bedroom
     if params['on3']
        write "CMD:C031"
        sleep 0.5
        write "CMD:C031"
        flash[:notice] = write("3 on")
    end
    if params['off3']
      write "CMD:C030"
      sleep 0.5
      write "CMD:C030"
      flash[:notice] = write("3 off")
    end
    #bedroom
   if params['on4']
      write "CMD:C041"
      sleep 0.5
      write "CMD:C041"
      flash[:notice] = write("4 on")
    end
    if params['off4']
      write "CMD:C040"
      sleep 0.5
      write "CMD:C040"
      flash[:notice] = write("4 off")
    end
    if params['off5']
      write "CMD:C051"
      sleep 0.5
      write "CMD:C051"
      flash[:notice] = write("5 on")
    end
    if params['off5']
      write "CMD:C050"
      sleep 0.5
      write "CMD:C050"
      flash[:notice] = write("5 off")
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
#sp = SerialPort.new('/dev/tty.usbserial-A600dgPA',9600,8,1,SerialPort::NONE)
