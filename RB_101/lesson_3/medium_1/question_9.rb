def foo(param = "no")
  "yes" # => return value is 'yes'
end

def bar(param = "no") # = def bar('yes')
  param == "no" ? "yes" : "no" # 'yes' == 'no' ? => 'no'
end

