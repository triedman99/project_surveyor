# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Survey.delete_all
Question.delete_all
Option.delete_all
Answer.delete_all

5.times do
  Survey.create(title: Faker::Book.title, description: Faker::Hipster.sentence)
end

Survey.all.each do |s|
  s.questions << Question.new(question_type: ['multiple', 'num_range'].sample, body: Faker::Hipster.sentence(5), survey_id: s.id, required: [true, false].sample, multi_select: false)
  s.questions << Question.new(question_type: ['multiple', 'num_range'].sample, body: Faker::Hipster.sentence(5), survey_id: s.id, required: [true, false].sample, multi_select: true)
  s.questions << Question.new(question_type: ['multiple', 'num_range'].sample, body: Faker::Hipster.sentence(5), survey_id: s.id, required: [true, false].sample, multi_select: false)
end

Question.all.each do |q|
  if q.question_type == 'multiple'
    4.times do
      Option.create(body: Faker::Beer.name, question_id: q.id)
    end
  end
end