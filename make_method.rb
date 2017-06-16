# -*- coding: utf-8 -*-
class Make_block

def initialize(image)
 @block = []
 @img = Image.load(image)
 @x = 6
 @y = 420
end

def make
@block.push(Block.new(200,100,@img)) #70 * 60

up(@x,@y,5)
down(@x,@y,3)
tobitobi(@x,@y,2,4)
up(@x,@y,3)
tate(@x,@y,6)

space(@x,@y,2)

up(@x,@y,4)
yoko(@x,@y,3)
down(@x,@y,2)
tate(@x,@y,6)

space(@x,@y,4)



@block
#puts @x
#puts @y
end

def up(x,y,dan)
  dan.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
    @y = @y-60
 }  	
end

def yoko(x,y,kosuu)
  kosuu.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
  }  
end

def tate(x,y,kosuu)
  kosuu.times{
    @block.push(Block.new(@x,@y,@img))
    @y = @y+60
  }  
end

def down(x,y,dan)
  dan.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
    @y = @y+60
 }
end

 def space(x,y,kosuu)
  kosuu.times{
    @x = @x+70
    @y = 420
  }  
end 

def tobitobi(x,y,aki,kosuu)
  kosuu.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70*aki
  }
  @x = @x-70*aki
end

def x
 @x
end

def y
  @y
end

end