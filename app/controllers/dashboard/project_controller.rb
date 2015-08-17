class Dashboard::ProjectController < Dashboard::DashboardController
  
  def index
    @projects = Project.all
  end
  
  def show
  end
  
  def new
    @project = Project.new
  end
  
  def create
      @project = Project.new(project_params)
      if @project.save
          redirect_to dashboard_root_path,  notice: "Your project was saved successfully"
      else
          render "new"
      end
  end
  
  def destroy
    Project.find(params[:id]).destroy
    redirect_to admin_general_messages_path, notice: 'General message deleted !'
  end

  protected
  def project_params
    params.require(:project).permit(:name, :project_duration, :description, :technos, :screenshots)
  end
  
end