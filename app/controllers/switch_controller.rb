class SwitchController < ApplicationController
  def index 
    
   #lounge 
   if params['form'] == 'on1' && params['on'] == true
      write "CMD:C011"
      sleep 0.5
      write "CMD:C011"
      flash[:notice] = write("1 on")
      render :json => { :result => 'success', :output => "1 on"}
    elsif params['form'] == 'on1' && params['on'] == false
      write "CMD:C010"
      sleep 0.5
      write "CMD:C010"
      flash[:notice] = write("1 off")
      render :json => { :result => 'success', :output => "1 off"}
    end
   #topside
    if params['form'] == 'on2' && params['on'] == true
      write "CMD:C021"
      sleep 0.5
      write "CMD:C021"
      flash[:notice] = write("2 on")
      render :json => { :result => 'success', :output => "2 on"}
    elsif params['form'] == 'on2' && params['on'] == false
      write "CMD:C020"
      sleep 0.5
      write "CMD:C020"
      flash[:notice] = write("2 off")
      render :json => { :result => 'success', :output => "2 off"}
    end
    #bedroom
    if params['form'] == 'on3' && params['on'] == true
      write "CMD:C031"
      sleep 0.5
      write "CMD:C031"
      flash[:notice] = write("3 on")
      render :json => { :result => 'success', :output => "3 on"}
    elsif params['form'] == 'on3' && params['on'] == false
      write "CMD:C030"
      sleep 0.5
      write "CMD:C030"
      flash[:notice] = write("3 off")
      render :json => { :result => 'success', :output => "3 off"}
    end
    #bedroom
   if params['form'] == 'on4' && params['on'] == true
      write "CMD:C041"
      sleep 0.5
      write "CMD:C041"
      flash[:notice] = write("4 on")
      render :json => { :result => 'success', :output => "4 on"}
    elsif params['form'] == 'on4' && params['on'] == false
      write "CMD:C040"
      sleep 0.5
      write "CMD:C040"
      flash[:notice] = write("4 off")
      render :json => { :result => 'success', :output => "4 off"}
    end
    if params['form'] == 'on5' && params['on'] == true
      write "CMD:C051"
      sleep 0.5
      write "CMD:C051"
      flash[:notice] = write("5 on")
      render :json => { :result => 'success', :output => "5 on"}
    elsif params['form'] == 'on5' && params['on'] == false
      write "CMD:C050"
      sleep 0.5
      write "CMD:C050"
      flash[:notice] = write("5 off")
      render :json => { :result => 'success', :output => "5 off"}
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
