# Bouncing Balls
=begin
A child is playing with a ball on the nth floor of a tall building. 
The height of this floor, h, is known.

He drops the ball out of the window. The ball bounces (for example), 
to two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window 
(including when it's falling and bouncing?

Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, 
otherwise return -1.

Note:
The ball can only be seen if the height of the rebounding ball is strictly greater 
than the window parameter.

Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3

- h = 3, bounce = 1, window = 1.5, result is -1 
(Condition 2) not fulfilled).
=end

=begin
P
Input: 3 nums -> height of ball fall, bounce power, mother's window
Output: integer -> num of times when mother able to see the ball

Rules:
- find all times when mother saw the ball, including falling and bouncing
- calculate times of bounce
- return integer

E
3, 0.66, 1.5 -> 3 * 0.66 = 1.98, 1.98 * 0.66 = 1.32 which is less than 1.5
1 time bounce on mother's height, 2 times fall

30, 0.75, 1.5 -> 
30 * 0.75 = 22.5, down and up to 22.5
22.5 * 0.75 = 16.875, down and up 
16.875* 0.75 = 12.65625, down and up
12.65625* 0.75 = 9.4921875, down and up
9.4921875 * 0.75 = 7.119140625, down and up
7.119140625 * 0.75 = 5.33935546875, down and up
5.33935546875 * 0.75 = 4.0045166015625, down and up
4.0045166015625 * 0.75 = 3.003387451171875, down and up
3.003387451171875 * 0.75 = 2.2525405883789062, down and up
2.2525405883789062 * 0.75 = 1.6894054412841797, down and up and down

10
1.6894054412841797 * 0.75 = 1.2670540809631348 lower than mother's window


1, 0.66, 0.66 -> 1*0.66 = 0.66

D
integer

A
- CALCULATE the number of bouncing
  - height multiply by bounce power till height is become smaller than mother's window
  - create a counter variable
  - add +2 by every bounce
- ADD times of falling
  - add 1
- RETURN the total num
=end

# C
def bouncingBall(height, bounce, mother)
  if bounce >= 1 || bounce < 0 || height <= 0 || mother <= 0 || (height * bounce ) < mother
    return -1
  end
  
  counter = 0
  height = height * bounce
  loop do
    break if height <= mother
    height = height * bounce
    counter += 2
  end
  counter + 1
end

p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
