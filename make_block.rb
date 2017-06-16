# -*- coding: utf-8 -*-
class Make_block

def initialize(image)
 @block = []
 @img = Image.load(image)
 @x = 600
 @y = 420
end

def make


    tobitobi(3,5)
    dandan(3)
    tobitobi(2,4)
    up(2)
    tate(6)
    space(4)
    up(4)
    yoko(2)
    down(2)
    tate(6)
    h_reset
    migi
    migi
    migi
    migi
    migi



    oku
    migi
    ue
    tate(2)
    migi
    ue
    ue
    ue
    tate(3)
    migi
    ue
    ue
    ue
    tate(3)


    migi
    migi
    ue
    ue
    ue
    oku
    migi
    migi
    sita
    tate(3)
    ue
    ue
    ue
    ue
    @x += 35
    oku


    @x += 35
    migi
    ue
    ue
    ue
    ue
    oku
    h_reset
    @x += 35
    ue
    @y -= 60
    oku
    h_reset
    migi
    migi
    ue
    ue
    tate(3)


    migi
    migi
    ue
    ue
    ue
    up_yoko(2, 1)
    sita
    yoko(5)
    @x -= 70*5
    ue
    up_yoko(2, 1)
    sita
    migi
    down(2)
    sita
    sita
    sita
    @x -= 35
    hidari
    hidari
    hidari
    hidari
    oku
    migi
    oku
    migi
    oku
    migi
    oku
    migi
    oku
    migi
    oku
    @y -= 35
    ue
    ue
    ue
    ue
    ue
    oku
    h_reset


  	migi
  	yoko(8)
  	@x -= 70*6
  	ue
  	yoko(6)
  	@x -= 70*5
  	ue
  	yoko(5)
  	@x -= 70*4
  	ue
  	yoko(4)
  	h_reset

  	migi
  	migi
  	migi
  	migi

  	yoko(5)
  	@x -= 70*4
  	ue
  	yoko(4)
  	@x -= 70*3
  	ue
  	yoko(3)
  	@x -= 70*2
  	ue
  	yoko(2)
  	@x -= 70*1
  	ue
  	yoko(1)
  	migi
  	tobitobi(2, 4)

  	sita
  	sita
  	@x -= 70*5
  	tobitobi(2, 4)

  	migi
  	@y -= 60*4
  	oku
  	sita
  	sita
  	tate(3)
  	migi
  	migi

  	@y -= 60*3
  	tate(3)
  	migi
  	ue
  	oku
  	ue
  	ue
  	oku
  	migi
  	tate(3)
  	ue
  	migi
  	oku

  	migi
 	migi
 	ue
 	ue
 	tate(3)
 	migi
 	ue
 	ue
 	oku
 	ue
 	migi
 	oku
 	sita
 	sita
 	oku

 	migi
 	migi
 	migi
 	oku
 	ue
 	ue
 	oku
 	ue
 	ue
 	oku
 	hidari
 	tate(5)
 	h_reset
 	hidari







@block
end

def up(dan)
  dan.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
    @y = @y-60
 }  	
end

def yoko(kosuu)
  kosuu.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
  }  
end

def up_yoko(dan,kosuu)
 dan.times{
   (kosuu-1).times{
     @block.push(Block.new(@x,@y,@img))
     @x = @x+70
   }  
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
    @y = @y-60
 }  
end

def dandan(dan)
 count = dan - 1
 dan.times{
  count.times{
     @block.push(Block.new(@x,@y,@img))
     @x = @x+70
  }
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
    @y = @y-60
 count -= 1
 }
end

def tate(kosuu)
  kosuu.times{
    @block.push(Block.new(@x,@y,@img))
    @y = @y+60
  }  
end

def down(dan)
  dan.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70
    @y = @y+60
 }
end

 def space(kosuu)
  kosuu.times{
    @x = @x+70
    @y = 420
  }  
end 

 def tobitobi(aki,kosuu)
  kosuu.times{
    @block.push(Block.new(@x,@y,@img))
    @x = @x+70*aki
  }
  @x = @x-70*aki
end

def h_reset()
  @y = 420
end

def oku()
	@block.push(Block.new(@x,@y,@img))
end

def migi
	@x += 70
end

def hidari
	@x -= 70
end

def ue
	@y -= 60
end

def sita
	@y +=60
end

end