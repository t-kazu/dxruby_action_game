# -*- coding: utf-8 -*-
require 'dxruby'

#主人公JAKEのクラス
class Jake < Sprite
attr_accessor :sub_y
attr_accessor :jump

def initialize(image)
 super(Window.width/2,Window.height-image.height,image)
 @sub_y = 0
 @jump = false
 @sound = Sound.new("sound/jump.wav") #ジャンプした時の効果音
end

def hits(block)
  block.each do |b|
   	if Sprite.check(self,b)==true
	  if self.x-b.get_x>=b.get_image.width-10 #ブロックから降りるとき
		@jump = true
          elsif (b.get_x-self.x>=self.image.width-10) && (b.get_y-self.y<self.image.height-1) #ブロックの左端から当たったとき
		self.x = b.get_x - self.image.width + 2
	  elsif b.get_y - self.y >= self.image.height / 2 #ブロックの上から当たったとき
		@sub_y = 0
		@jump = false
		self.y = b.get_y - self.image.height + 1
	  elsif self.y - b.get_y >= b.get_image.height - 15 #ブロックの下から当たったとき
		self.y = b.get_y + b.get_image.height
		@sub_y  = 1
	  end
        end
  end
end

#@sub_yに代入する値でジャンプする高さが変わる self.yに代入する値で落ちる速さが変わる
def subs_y
 @sound.stop
 @sound.play
 @sub_y = -12
 @jump = true
 self.y -= 5
end

def move_x
 self.x -= 5
end

def move_y
 self.y += @sub_y
 @sub_y += 1
 if self.y >= Window.height-image.height
   self.y = Window.height-image.height
   @sub_y = 0
   @jump = false
 end
end

def get_x
 self.x
end

def get_y
 self.y
end

end

#追っかける母のクラス
class Mammy < Sprite

def initialize(image)
 @image = image
 super(-150,0,image)
end

end

#障害物のブロックのクラス
class Block < Sprite

def initialize(x,y,image)
 @image = image
 super(x,y,image)
end

def move_x(sub)
 self.x -= sub
end

def get_x
 self.x
end

def get_y
 self.y
end

def get_image
 self.image
end

end