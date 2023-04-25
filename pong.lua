-- title:   Pong
-- author:  Alejok0
-- desc:    Pequeño juego de pong
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

x=96
y=120

xp=116
yp=115
vxp=0
vyp=0

function TIC()
	movimientoJugador()
	movimientoPelota()
	cls(13)

	--jugador
	rect(x,y,40,8,2)

	--pelota
	circ(xp,yp,3,2)

	print("x: "..xp.."y:"..yp.."vxp:"..vxp.."vyp:"..vyp,0,0)
end

function movimientoJugador()
	if keyp(48) then vyp=vyp-1 end
	if btn(2) then x=x-1 end
	if btn(3) then x=x+1 end
end

function movimientoPelota()
	if (xp <=0 or xp >= 239) then
		vxp=vxp*-1
		if xp <=0 then xp = 1 else xp = 238 end
	elseif (yp <= 3) then
		vyp=vyp*-1
		yp=4
	elseif (xp>=x and xp<=(x+40)) and (yp>=y) then
		vyp=vyp*-1
		vxp=vxp+math.random(-2,2)
		yp=y-2
	elseif (yp>=135) then
	trace("Perdio!")
		vxp=0
		vyp=0
	else
		if vxp > 3 then vxp=3 end
		if vxp < -3 then vxp=-3 end
		xp=xp+vxp
		yp=yp+vyp
	end
end

-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

