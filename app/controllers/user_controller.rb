class UserController < ApplicationController
  
  def login
    
    @user_id = params[:user_id]
    
  end

  def new_user_reg
    @location = [" United Arab Emirates ", "United States", "India",  "England", "Australea", "Singapoore", "Caneda", "Switzerland"]
    @existing_user_id = session[:user_id]
    if(@existing_user_id.nil?)
      @user = User.new(params[:user])
      user_saving(@user)
#       unless (params[:commit].nil?)
#          if(@user.save)
#              session[:user_id] = @user.id
#              
#              render :action => "new_user_reg"
#          end
           @user.update_attributes(:status => "0", :version => "user")
           flash[:notice] = "Your details saved successfully"
       #end
    else
      @user = User.find(@existing_user_id)
      @user.update_attributes(params[:user])
      user_saving(@user)
      flash[:notice] = "Your details updated successfully"
    end
  end

  def user_saving(user)
    unless (params[:commit].nil?)
          if(@user.save)
              session[:user_id] = @user.id
              redirect_to :action => "user_home", :controller => "client"
              Usermailer.welcome_email(@user).deliver
          end
    end
  end

  def selection
    @user_id = session[:user_id]
    if(@user_id.nil?)
      @user = User.where("username=? AND password=?", params[:username], params[:password]).first
      if @user.nil?
        flash[:notice] = "Wrong User!"
        redirect_to :controller => "user", :action => "login"
      elsif(@user.version == "user" && @user.status == "0")
        redirect_to :controller => "client", :action => "user_home"
        session[:user_id] = @user.id
        session[:user_version] = @user.version
      elsif(@user.version == "admin" && @user.status == "0")
        redirect_to :controller => "admin", :action => "admin_home"       
        session[:user_id] = @user.id
        session[:user_version] = @user.version
      elsif(@user.version == "emp" && @user.status == "0")
        redirect_to :controller => "user", :action => "employee"
        session[:user_id] = @user.id
        session[:user_version] = @user.version
      else
        flash[:notice] = "Sorry! Access Denied!"
      end      
    end
  end
   
  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    session[:project_id] = nil
    session[:user_version] = nil
    redirect_to :controller => "user", :action => "login"
  end

end