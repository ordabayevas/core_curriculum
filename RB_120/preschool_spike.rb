### Preschool (by Natalie Thompson)

# + Inside a preschool there are 
# + children, 
# + teachers, 
# + class assistants, 
# + a principle, 
# + janitors, 
# + and cafeteria workers. 

# + Both teachers 
# + and assistants 
# + can help a student with schoolwork 
# + and watch them on the playground.

# + A teacher teaches 
# + and an assistant helps kids with any bathroom emergencies.

# + Kids themselves can learn and play. 
# + A teacher and principle can supervise a class.

# + Only the principle has the ability to expel a kid. 
# + Janitors have the ability to clean. 
# + Cafeteria workers have the ability to serve food. 

# + Children, teachers, class assistants, principles, janitors and cafeteria workers 
# + all have the ability to eat lunch.

module LunchEater
  def eat_lunch
  end
end

module Supervisable
  def supervise_class
  end
end

module Helper
  def schoolwork_help
  end
end

module Watcher
  def playground_watch
  end
end

class Preschool
  @children = []
  @teachers = []
  @class_assistants = []
  @principle = []
  @janitors = []
  @cafe_workers = []

  def add_child
    @children << Child.new
  end

  def add_teacher
    @teachers << Teacher.new
  end

  def add_class_assistant
    @class_assistants << ClassAssistant.new
  end

  def add_principle
    @principle << Principle.new
  end

  def add_janitor
    @janitors << Janitor.new
  end

  def add_cafe_workers
    @cafe_workers << CafeteriaWorker
  end
end

class Child
  include LunchEater

  def learn
  end

  def play
  end
end

class Teacher
  include LunchEater
  include Supervisable
  include Helper
  include Watcher

  def teaching
  end
end

class ClassAssistant
  include LunchEater
  include Helper
  include Watcher

  def bathroom_help
  end
end

class Principle
  include LunchEater
  include Supervisable

  def expel_kid
  end
end

class Janitor
  include LunchEater

  def clean
  end
end

class CafeteriaWorker
  include LunchEater

  def serve_food
  end
end

