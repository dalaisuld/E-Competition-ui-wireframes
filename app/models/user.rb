class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  has_and_belongs_to_many :confs
  #has_many :users_confs
  #as_many :confs, :through => :users_confs
end
