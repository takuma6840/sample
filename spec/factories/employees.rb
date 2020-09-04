FactoryBot.define do
  factory :employee do
    name { 'テストユーザー'}
    employee_id { 'testuser'}
    password { 'password'}
  end
end
