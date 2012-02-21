Factory.define :user do |user|
	user.name  "Harrison Greene"
	user.email  "hbrando81@yahoo.com"
	user.password  "Patches"
	user.password_confirmation "Patches"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
micropost.content "Foo bar"
micropost.association :user
end