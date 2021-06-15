class Post < ApplicationRecord
  validates_presence_of :title, :presence=>true, :message=>"Заголовок не должен быть пустым"
  validates_presence_of :body, :presence=>true, :message=>"Содержание не должно быть пустым"
  validates_length_of :body, :minimum => 10, :message=>"Содержание не должно быть меньше 10 символов"
  # validates :title, presence: true
  # validates :body, presence: true, length: { minimum: 10 }
end
