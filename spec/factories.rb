Factory.define :user do |user|
  user.sequence(:email){|n| "email#{n}@mail.com" }
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :project do |project|
  project.name             "foobar"
end

Factory.define :task do |task|
  task.name             "foobar"
  task.association :project
end