class ConfsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @conf = Conf.find(params[:id])
  end
  def new
    @conf = Conf.new
  end
  def join
    @conf = Confs_Posts.new(conf_params.merge(post_id: 1)) 
  end
  def index
     @confs = Conf.all
     if params[:search]
      @confs = Conf.search(params[:search]).order('title')
     else
      @confs = Conf.order('title')
  end
  if params[:order] == 'create_at'
        @records = Conf.all.order('created_at')
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
