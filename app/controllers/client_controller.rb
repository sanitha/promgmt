class ClientController < ApplicationController
  def user_home
    unless (session[:user_id].nil?)
      @name = User.find(session[:user_id])
      session[:user_name]= @name.name 
    end
  end

  def proj_enquiry
    @category = ["Web Based Project", "Window based application", "Application model software", "Embedded systems", "Flash games", "Advanced games"]
    @user_id = session[:user_id]
    @project = Enquiry.new(params[:client])
    unless (params[:commit].nil?)
      if (@project.save)
        session[:project_id] = @project.id
         flash[:notice] = "Please notice your Project-id - #{@project.id}"
        render :action => "proj_enquiry"
        #Usermailer.send_projectid(@user).deliver
      end      
      @project.update_attributes(:status => "0", :user_id => @user_id, :todays_date => Date.today)
    end    
  end

  def view_status
    projid = []
    projid = params[:pid]
    @stat = Enquiry.find(:all, :conditions => ["id IN (?)", projid])   
    @project = Project.find(:all, :conditions => ["id IN (?)", projid])     
    @status = "Sorry, Your project rejected!"
    
  end

end
