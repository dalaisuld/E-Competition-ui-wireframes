class Conf < ApplicationRecord
	validates :title, presence:true
	validates :descreption, presence:true
	validates :evaluation, presence:true
  devise :database_authenticatable, :registerable
  has_and_belongs_to_many :users
  #has_many :users_confs
  #as_many :confs, :through => :users_confs
end
