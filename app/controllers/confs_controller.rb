class ConfsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_direction
  def show
    @conf = Conf.find(params[:id])
    @shows = Conf.joins(:confs_users,:users).select("confs_users.conf_id,users.name,confs.title").where(:confs => {:id => @conf.id}).group("users.name")
  #   sql = "Insert into confs_users (conf_id,user_id,answer) values(#{@conf.id},#{current_user.id},13)";
  #   records_array = ActiveRecord::Base.connection.execute(sql)
  end
  def button
     sql = "Insert into confs_users (conf_id,user_id,answer) values(#{@conf.id},#{current_user.id},13)";
     records_array = ActiveRecord::Base.connection.execute(sql)
  end
  def new
    @conf = Conf.new
  end
  def shows
    answer = ''
    sql = "Insert into confs_users (conf_id,user_id,answer) values(7,#{current_user.id},17)";
    records_array = ActiveRecord::Base.connection.execute(sql)
    @conf = Conf.all
  end
  def admin_show
    @shows = Conf.joins(:confs_users,:users).select("confs_users.conf_id,users.name,confs.title").where(:confs => {:id => 10}).group("users.name")
  end
  def index
     @confs = Conf.all
     if params[:order]
      @confs = Conf.order('created_at DESC')
     else
      @confs = Conf.order('title')
      end 
      if params[:search]
      @confs = Conf.search(params[:search]).order('title')
      end
end
  def create
    #render plain: params[:conf].inspect
    # @conf = Conf.new(conf_param.merge(users:current_user.id))
    @conf = Conf.new(conf_param);

    if(@conf.save)
        redirect_to @conf
      else
        render 'new'
      end
    end
    protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to '/users/sign_in'
      end
     end
     private def conf_param
        params.require(:conf).permit(:title,:max,:descreption,:evaluation)
     end
end
