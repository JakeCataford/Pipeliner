namespace :dev do
  task :populate => :environment do
    puts("Generating Mock Data...")

    puts("-- Generating Users.")
    (1..10).each do
      user = User.new
      user.name = Faker::Name.name
      user.email = Faker::Internet.email(user.name)
      user.uid = rand(0..1000)
      if user.save!
        puts("  * new: #{user.name} ")
      else 
        puts("  ! ERROR: #{user.name} could not be saved.")
      end
    end
    puts("  - done.")

    puts("-- Generating Models.")
    User.all.each do |u|
      (1...rand(3) + 1)
      model = Model.new
      model.user = u
      model.name = Faker::Company.bs
      if model.save!
        puts("  * new: #{model.name} ")
      else 
        puts("  ! ERROR: #{model.name} could not be saved.")
      end
    end
    puts("  - done.")

    puts("-- Generating Revisions.")
    Model.all.each do |m|
      (1..rand(10) + 1).each do
        rev = Revision.new
        rev.model = m
        if rev.save!
          puts("  * new revision for #{m.name} ")
        else 
          puts("  ! ERROR: revision could not be saved")
        end
      end
    end
    puts("  - done.")

    puts("-- Generating Comments.")
    Revision.all.each do |r|
      (1..rand(10) + 1).each do
        com = Comment.new
        com.message = Faker::Company.catch_phrase
        com.user = User.find(rand(1..User.all.length))
        com.revision = r
        if com.save!
          puts("  * new comment for revision on #{r.model.name} ")
        else 
          puts("  ! ERROR: comment could not be saved")
        end
      end
    end
    puts("  - done.")

    puts("-- Generating Tasks.")
    Revision.all.each do |r|
      (1..rand(5) + 1).each do
        task = Task.new
        task.title = Faker::Company.catch_phrase
        task.user = User.find(rand(1..User.all.length))
        task.completed = [true, false].sample
        task.revision = r
        if task.save!
          puts("  * new task for revision on #{r.model.name} ")
        else 
          puts("  ! ERROR: task could not be saved")
        end
      end
    end
    puts("  - done.")

    puts("-- Fnished! --")
  end


end