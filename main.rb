# -*- coding: utf-8 -*-
require 'dxruby'
require_relative 'player'
require_relative 'make_block'
#背景準備
bg_img = Image.load("image/bg.png")
sub = 0
#音楽準備
#ステージごとの音楽を代入　音楽：魔王魂
sounds = [Sound.new("sound/theme.wav"),Sound.new("sound/mura.wav"),Sound.new("sound/battle.wav"),Sound.new("sound/last.wav"),Sound.new("sound/clear.wav"),Sound.new("sound/over.wav")]
sound = sounds[0]
#主人公準備
jake_img = Image.load("jake.png")
jake = Jake.new(jake_img)
#母準備
mammy_img = Image.load("image/mammy.png")
mammy = Mammy.new(mammy_img)
#ブロック準備
m_block = Make_block.new("block.png")
block = m_block.make
#フレームのカウント
count = 0
#背景の速さ
speed = 0
#画面初期設定 デバック用
fream = 0
#ブロック処理
 block.each do |b|
   b.move_x(fream)
 end
font = Font.new(32)

#画面指定（オープニング(0)、ゲーム(1)、エンディング(2)）
view = 0
#１フレーム前のjakeのx座標保持
j_x = jake.get_x
j_x_test = j_x
#1フレーム前の画面移動保持
w_x = sub

 start_image = Image.load("image/tittle.png")
 clear_image = Image.load("image/clear.png")
 over_image = Image.load("image/over.png")
 opening_count = 0

Window.loop do

 #オープニング

if view == 0
   if opening_count==0
	sound.stop
	sound.play
   end
   if Input.key_push?(K_ESCAPE) || Input.keyPush?(K_F) || opening_count == 1000
	view = 1
    	speed = 2 #ステージ1の背景の速さ
 	sound.stop
	sub = -1*fream
 	sound = sounds[1]
 	sound.play
   end
   Window.draw(0,0,start_image)
   opening_count += 1
end

if view == 1
 #ゲーム開始
 # j_x_test += speed
 # p j_x_test #デバック用 jakeの位置
  view = 2 if jake.get_x<=50||(sub+7600)+(320-jake.get_x)<=0#ゲーム終了
#背景処理
  sub -= speed
#主人公処理
  jake.subs_y if (Input.keyPush?(K_SPACE)||Input.keyPush?(K_F))&&jake.jump==false
#  jake.move_x #ドゥクシテスト用
  jake.move_y if jake.jump==true && count % 2 == 0#2フレームに一度行う
#ブロック処理
 block.each do |b|
   b.move_x(speed)
 end
#衝突処理
 jake.hits(block)
#後半音楽
if(sub<=-4550&&w_x>-4550&&j_x>=180)
 sound.stop
 sound = sounds[2]
 sound.play
end
#ピンチ曲挿入
if(j_x>=180&&jake.get_x<180)
 sound.stop
 sound = sounds[3]
 sound.play
end
j_x = jake.get_x
w_x = sub

count += 1

  #描画
  Window.draw(sub,0,bg_img)
  jake.draw
  Sprite.draw(block)
  mammy.draw
  #マウスで座標を求める
=begin
  	Window.draw_font(
	 		100,
			100,
			"x: #{Input.mouse_x}",
			font
			)
	Window.draw_font(100,150,"y : #{Input.mouse_y}",font)
=end
 end
 #エンディング
 if view==2
  if jake.get_x>50#ゲームクリア
    sound.stop
    sound = sounds[4]
    sound.play
  else #ゲームオーバー
    sound.stop
    sound = sounds[5]
    sound.play
  end
 view = 3 
 end
 if view==3
  if jake.get_x>50#ゲームクリア
    Window.draw(0,0,clear_image)
  else #ゲームオーバー
    Window.draw(0,0,over_image)
  end
 end
 #エンディング終了

  # エスケープキーで終了
  break if Input.key_push?(K_ESCAPE)
end