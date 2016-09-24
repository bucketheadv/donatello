# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [{
  id: 1,
  username: '宋江',
  partment: '框架开发',
  tel: '19012341234',
  email: 'test1@123.com',
  password: '123123123'
},{
  id: 2,
  username: '卢俊义',
  partment: '框架开发',
  tel: '19031321231',
  email: 'test2@123.com',
  password: '123123123'
}]

users.each { |user| User.create(user) }

messages = [{
  id: 1,
  message: "欢迎新同学，卢俊义。",
  user_id: 1
}]

Message.create(messages)
