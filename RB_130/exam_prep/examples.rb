# source: https://fine-ocean-68c.notion.site/Working-With-Blocks-ae6e08717074433f879a15801c287d74
# EX1 - IMPLEMENTATION, IMPLICIT BLOCK ARGUMENT WITH YIELD
def a_method
  yield
end

p a_method {"I'm a block in Example 1" }

# EX2 - IMPLEMENTATION, BLOCK PARAMETER, EXPLICIT BLOCK
def a_method(&expecting_a_block)
  expecting_a_block.call
end

p a_method {"I'm a block in Example 2" }

# EX3 - IMPLEMENTATION, BLOCK PARAMETER, EXPLICIT BLOCK, HOW TO PASS IN A PROC OBJECT WHEN EXPECTING A BLOCK
def b_method(&expecting_a_block)
  expecting_a_block.call
end

b_proc = proc {"I'm a block" }
p b_method(&b_proc)

# EX4 - IMPLEMENTATION, expecting_a_proc as a PARAMETER, PROC ARGUMENT, INVOKING Proc#call on ARGUMENT c_proc IN METHOD BODY
def c_method(expecting_a_proc)
  expecting_a_proc.call
end
  
c_proc = proc {"I'm a proc" }
p c_method(c_proc)