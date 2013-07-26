class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :revision
  validates :message, :presence => {:message => 'Name cannot be blank, Task not saved'}
  validates :user, :presence => {:message => 'Name cannot be blank, Task not saved'}
  validates :revision, :presence => {:message => 'Name cannot be blank, Task not saved'}
end
