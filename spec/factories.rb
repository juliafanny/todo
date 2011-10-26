Factory.define :user do |user|
  user.sequence(:email){|n| "email#{n}@mail.com" }
  user.password              "foobar"
  user.password_confirmation "foobar"
end