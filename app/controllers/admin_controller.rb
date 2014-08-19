class AdminController < ApplicationController

  autocomplete :enquiry, :proj_name
  
  def admin_home
    #@project = Enquiry.find(session[:project_id])
  end

  def enquired_proj
    @project = Enquiry.find_by_sql("select * from enquiries where status = 0 GROUP BY proj_name")
  end

  def enq_proj_details
    @project = Enquiry.find(params[:project_id])
  end

  def user_needs
    @project = Enquiry.find(params[:project_id])
    @pcost = @project.cost     
    @category = ["Web Based Project", "Window based application", "Window based distributed application", "Application model software with database", "Application model software without database", "Embedded systems", "Flash games", "Advanced games"]
      c1 = params[:c1].to_s
      c2 = params[:c2].to_s
      c3 = params[:c3].to_s
      c4 = params[:c4].to_s
      c5 = params[:c5].to_s
      c6 = params[:c6].to_s
      c7 = params[:c7].to_s
      c8 = params[:c8].to_s
      c9 = params[:c9].to_s
      c0 = params[:c0].to_s
      c11 = params[:c11].to_s
      c12 = params[:c12].to_s
      c13 = params[:c13].to_s
      c14 = params[:c14].to_s
    cost1 = c1.to_i+c2.to_i+c3.to_i+c4.to_i+c5.to_i+c6.to_i+c7.to_i+c8.to_i+c9.to_i+c0.to_i+c11.to_i+c12.to_i+c13.to_i+c14.to_i   
    app = params[:new]   
    cat = params[:category]
        case cat
          when "Web Based Project"
            cate = 1.5
          when "Window based stanadalone application"
            cate = 0.75
          when "Window based distributed application"
            cate = 1.5
          when "Application model software with database"
            cate = 0.75
          when "Application model software without database"
            cate = 1.75
          when "Embedded systems"
            cate = 2
          when "Flash games"
            cate = 0.5
          when "Advanced games"
            cate = 2.25
        end
     est_cost = cost1.to_i + app.to_i + cate.to_f
       case est_cost
         when 1..20
           ecost = 1000
         when 20..35
           ecost = 20000
         when 35..50
           ecost = 30000
         when 50..60
           ecost = 50000
         else
           ecost = 1729
       end

    if(ecost < @pcost)
      @runproj = Project.new(:proj_name => @project.proj_name, :status => '0', :enquiry_id => @project.id, :duration => @project.duration)
      unless (params[:commit].nil?)
        if(@runproj.save)
          flash[:notice] = "Project Accepted"
          @project.update_attributes(:status => '1')
        end
      end
    else
      flash[:notice] = "Project rejected!"
      @project.update_attributes(:status => 'N')
    end
  end
  def runnning_proj
    
    #@runproj = Project.find_by_sql("select * from projects GROUP BY proj_name")
    @runproj = Project.paginate(:page => params[:page]).order('id DESC')       
   end

  def block_user
    uname = params[:name]    
    @user = User.find(:all, :conditions => ["name IN (?)", uname])
    block = params[:block]    
    if block == 'block'    
      User.update_all(["status = ?", 1],["name = ?", uname])
      flash[:notice] = uname " blocked!"
    elsif block == 'unblock'    
      User.update_all(["status = ?", 0],["name = ?", uname])
      flash[:notice] = uname " unblocked!"
    end
  end  

  def add_employee
    @emp = Employee.new(params[:admin])
    unless params[:commit].nil?
      if(@emp.save)
        flash[:notice] = "New Employee added successfully"
        render :action => "add_employee"
      end
      @user = User.new(:name => @emp.lastname, :email => @emp.email, :phone => @emp.phone, :status => "0", :version => "emp", :username => @emp.emp_ID, :password => @emp.emp_ID, :password_confirmation => @emp.emp_ID)
      @user.save
    end
  end

  def proj_status
    @projstat = Project.find_by_sql("select * from projects GROUP BY proj_name")
  end

  def team_creation
    @team = Team.new(params[:admin])
    unless params[:commit].nil?
      if(@team.save)
        flash[:notice] = "Team created successfully"
        render :action => "team_creation"
      end
    end
  end

  def team_details    
    @project = Project.find(params[:project_id])
    @team = Team.find_by_sql("select * from teams")
  end
  
  def assign_proj
    @project = Project.find(params[:project_id])
    @team = Team.find(params[:team_id])    
    @project.update_attributes(:team_id => @team.id, :start_date => params[:start_date], :end_date => params[:end_date])
    @team.update_attributes(:status => '1', :proj_name => @project.proj_name)    
    flash[:notice] = "Project Sheduled..."
    unless params[:commit].nil?   
      render :action => "assign_proj"           
    end
  end
  
end
