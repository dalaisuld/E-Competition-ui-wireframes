class Confs_user < ActiveRecord::Base
	# validates :title, presence:true
	# validates :descreption, presence:true
	# validates :evaluation, presence:true
	#Confs_user.create([{:user_id => 888,:conf_id => 888}])
	belongs_to :users
  	belongs_to :confs
end