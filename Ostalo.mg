class N
declare
	?xN ?fG ?fN ?fC ?fF
{
	<syn>{
		node xN (color = red, mark = anchor) [cat = N, bot = [pers = z, wh = -, gen = fG, num = fN, case = fC, func = fF]]
		}
}

class PRO
declare
	?xPRO ?fP ?fW ?fG ?fN ?fC ?fF
{
	<syn>{
		node xPRO (color = red, mark = anchor) [cat = PRO, bot = [pers = fP, wh = fW, gen = fG, num = fN, case = fC, func = fF]]
		}
}

class Se
declare
	?xCl
{
	<syn>{
		node xCl (name = se, color = red, mark = anchor, rank = 4) [cat = Cl, bot = [ref = +]]
		}
}

class Cop
declare
	?xVcop ?fM ?fF ?fP ?fN
{
	<syn>{
		node xVcop (color = red, mark = anchor) [cat = V, bot = [mod = fM, form = fF, pers = fP, num = fN, cop = +]]
		}
}

class P
declare
	?xP ?fC
{
	<syn>{
		node xP (color = red, mark = anchor) [cat = P, bot = [case = fC]]
		}
}

class ADV
declare
	?xADV
{
	<syn>{
		node xADV (color = red, mark = anchor) [cat = ADV]
		}
}

class NUM
declare
	?xNUM
{
	<syn>{
		node xNUM (color = red, mark = anchor) [cat = NUM]
		}
}

class C
declare
	?xC
{
	<syn>{
		node xC (color = red, mark = anchor) [cat = C]
		}
}

class AuxProslo
export
	xTop xL xR
declare
	?xTop ?xL ?xR ?fM ?fP ?fN ?fG
{
	<syn>{
		node xTop (color = red, mark = nadj) [cat = V, bot = [mod = I, form = R, num = fN, pers = fP, gen = fG]] {
			node xL (mark = anchor, color = red) [cat = V, top = [mod = I, form = P, num = fN, pers = fP, aux = +]] % 19.12. uskladiti sa tekstom doktorata gde je kategorija cl ponegde
			node xR (mark = foot, color = red) [cat = V, top = [mod = G, num = fN, gen = fG]]
			}
		}
}

class AuxBuduce
export
	xTop xL xR
declare
	?xTop ?xL ?xR ?fM ?fP ?fN
{
	<syn>{
		node xTop (color = red, mark = nadj) [cat = V, bot = [mod = I, form = F, num = fN, pers = fP]] {
			node xL (mark = anchor, color = red) [cat = V, top = [mod = I, form = P, num = fN, pers = fP, aux = +]] % 19.12. u originalnom francuskom fajlu stoji da je cat v, uskladiti sa tekstom doktorata gde je cl ponegde
			node xR (mark = foot, color = red) [cat = V, top = [mod = W, num = fN]]
			}
		}
}

class Neg
export
	xTop xNeg xR
declare
	?xTop ?xNeg ?xR ?fM ?fP ?fN
{
	<syn>{
		node xTop (color = red, mark = nadj) [cat = V, bot = [neg = +]] { % ne radi
			node xNeg (mark = anchor, color = red) [cat = NEG, top = [neg = +]]
			node xR (mark = foot, color = red) [cat = V, top = [mod = I]]
			}
		}
}

class ZavisnaKomp %7.5.2017. ova klasa trenutno nema namenu
export
	xTop xC xSfoot
declare
	?xTop ?xC ?xSfoot ?fM ?fP ?fN
{
	<syn>{
		node xTop (color = red, mark = nadj) [cat = S, bot = [mod = I, wh = fW]] { % ne radi
			node xC (color = red, mark = subst) [cat = C, top = [wh = fW]]
			node xSfoot (color = red) [cat = S, top = [mod = I]] % obrisala sam mark = foot samo da probam
			}
		}
}



