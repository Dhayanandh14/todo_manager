class Todo < ActiveRecord::Base

  validates:todo_text, presence: true, length:{minimum:2}
  validates:due_date, presence: true

  belongs_to:user

  def self.overdue
    where("due_date < ? and (not completed)", Date.today).order!(:due_date)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  # def self.of_user(user)
  #   all.where(user_id: user.id)
  # end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed:true)
  end
end
