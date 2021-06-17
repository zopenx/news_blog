class Post < ApplicationRecord
  validates_presence_of :title, :presence=>true, :message=>"Заголовок не должен быть пустым"
  validates_length_of :body, :maximum => 40, :message=>"Заголовок не должно быть больше 40 символов"
  validates_presence_of :body, :presence=>true, :message=>"Содержание не должно быть пустым"
  validates_length_of :body, :minimum => 10, :message=>"Содержание не должно быть меньше 10 символов"
  validates_numericality_of :edit_count, :less_than =>6, :message=>"Достигнуто максимальное число изменений поста равное 5"
  # validates :title, presence: true
  # validates :body, presence: true, length: { minimum: 10 }
end
