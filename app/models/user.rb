class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todo_users
  has_many :todos, through: :todo_users

  after_create :add_todos

  def add_todos
      @todos = Todo.find(params[:todo_id])
      @todos.each do |todo|
          self.todos << todo
      end
  end
end
