%% Punoznacni glagoli %%

class GlagolskiPredikat
export
	xS xVP xV
declare
	?xS ?xVP ?xV ?fNeg
{
	<syn>{
		node xS (color = black) [cat = S] [bot = [neg = fNeg]] {
			node xVP (color = black) [cat = VP] [top = [neg = fNeg]]{
				node xV (mark = anchor, color = black) [cat = V] [top = [neg = fNeg]]
			}
		}
	}
}

class AktivniGlagol
import
	GlagolskiPredikat[]
declare
	?fN ?fP ?fF ?fM
{
	<syn>{
		node xVP [top = [mod = fM, form = fF, num = fN, pers = fP]] { % 23.12. dodala sam obelezje neg da bi se lepo spojilo sa Neg u Ostalo.mg. Na cvor V nisam stavila nista, tu ce se samo preneti vrednost iz leksikona
			node xV [top = [mod = fM, form = fF, num = fN, pers = fP]]
		}
	}
}

class BezlicniAktivniGlagol
import
	AktivniGlagol[]
{
	<syn>{
		node xVP [top = [num = s, pers = z, gen = n]] {
			node xV [top = [num = s, pers = z, gen = n]]
		}
	}
}
	

class AktivniGlagolParticip % 19.12. ubacila sam ovu klasu za slozena vremena kada mod nije isti u vp i v
import
	GlagolskiPredikat[]
declare
	?fN ?fG ?fP ?fF
{
	<syn>{
		node xVP [top = [mod = I, form = fF, num = fN, pers = fP, gen = fG], bot = [mod = G, num = fN, gen = fG, gen = fG]] {
			node xV [top = [mod = G, num = fN, gen = fG]]
		}
	}
}

%class AktivniGlagol % 19.12. napravila sam ovu klasu da moze da obuhvati i klasu za slozena vremena
%{ AktivniGlagolInd[] | AktivniGlagolParticip[] } % 19.12. AktivniGlagolInd je AktivniGlagol od iznad

class PasivniGlagol
import
	GlagolskiPredikat[]
export 
	xVPcop xVcop
declare
	?xVPcop ?xVcop ?fT ?fF ?fN ?fG ?fP
{
	<syn>{
		node xS {
			node xVPcop (color = black) [cat = VP, top = [mod = fT, form = fF, num = fN, gen = fG, pers = fP]] 
				{
				node xVcop (color = black, mark = subst) [cat = V, top = [mod = fT, form = fF, num = fN, gen = fG, pers = fP, cop = +]]
					}				
			node xVP [bot = [mod = T, num = fN, gen = fG]] {
				node xV [top = [mod = T, num = fN, gen = fG, pasiv = +]] 
				}
		
			}
		}
	}

class Refleksivnost % stavila sam da se yove ovako zato sto je nasledjuje i klasa obe
import
	GlagolskiPredikat[]
export
	?xCl
declare
	?xCl ?fN ?fP %?fM ?fF
{
	<syn>{
		node xVP [top = [num = ?fN, pers = ?fP]]; % obrisala sam gen i mod
		node xCl (name = se, color = red, rank = 4) [cat = Cl, top = [ref = +]];				
		node xV [top = [num = ?fN, pers = ?fP]]; % obrisala sam form

		xVP -> xCl;
		xVP -> xV; 
		}
}


class RefleksivniGlagolLevi
import
	Refleksivnost[]
{
	<syn>{
		node xVP;
		node xCl (name = se, mark = coanchor); 
		node xV;

		xVP -> xCl;
		xVP -> xV;
		xCl >>+ xV % prethodjenje 
		}
}

class RefleksivniGlagolLeviSubst
import
	Refleksivnost[]
{
	<syn>{
		node xVP;
		node xCl (name = se, mark = subst); 
		node xV;

		xVP -> xCl;
		xVP -> xV;
		xCl >>+ xV % prethodjenje 
	}
}	


class RefleksivniGlagolDesni
import
	Refleksivnost[]
{
	<syn>{
		node xVP; 
		node xCl (name = se, mark = coanchor); 
		node xV; 

		xVP -> xCl;
		xVP -> xV;
		xV >>+ xCl % prethodjenje 
		}
}

class RefleksivniGlagolDesniSubst
import
	Refleksivnost[]
{
	<syn>{
		node xVP; 
		node xCl (name = se, mark = subst); 					
		node xV; 

		xVP -> xCl;
		xVP -> xV;
		xV >>+ xCl % prethodjenje 
		}
}



% treba da napravim jos jedan refl glagol za obezlicene glagole - videti leksicko pravilo za obezlicavanje - uradjeno, evo ga iznad.

%% ovo su mi stare klase, vise ne vaze, u doktoratu sam ih zamenila sa BezlicniDesni i BezlicniLevi
% 
%class ObezliceniDesni % definisano da je glagol uvek u 3 licu jednine srednjeg roda. Trebalo bi da je %predefinisem da import radi iz klase RefleksicvniGlagolDesni
%import
%	Refleksivnost[]
%{
%	<syn>{
%		node xVP; 
%		node xCl (name = se, mark = coanchor);				
%		node xV [top = [pers = z, num = s]]; 
%
%		xVP -> xCl;
%		xVP -> xV;
%		xV >>+ xCl % prethodjenje 
%		}
%}

%class ObezliceniLevi % definisano da je glagol uvek u 3 licu jednine srednjeg roda. Trebalo bi da je %predefinisem da import radi iz klase RefleksicvniGlagolDesni
%import
%	Refleksivnost[]
%{
%	<syn>{
%		node xVP; 
%		node xCl (name = se, mark = coanchor);				
%		node xV [top = [pers = z, num = s]]; 
%
%		xVP -> xCl;
%		xVP -> xV;
%		xV >>+ xCl % prethodjenje 
%		}
%}

class BezlicniDesni
import
	RefleksivniGlagolDesni[]
{
	<syn>{
		node xCl (name = se);
		node xV [top = [pers = z, num = s, gen = n]] %ovde mi je ostala tacka zapeta u doktoratu na kraju reda
	}
}

class BezlicniLevi
import
	RefleksivniGlagolLevi[]
{
	<syn>{
		node xCl (name = se);
		node xV [top = [pers = z, num = s, gen = n]] %ovde mi je ostala tacka zapeta u doktoratu na kraju reda
	}
}

class Refleksivni
{ RefleksivniGlagolLevi[] | RefleksivniGlagolDesni[] }

class RefleksivniSubst
{ RefleksivniGlagolLeviSubst[] | RefleksivniGlagolDesniSubst[] }




class KopulativniPredikat
export
	xS xPred xVP xV
declare
	?xS ?xPred ?xVP ?xV ?fN ?fP ?fG

{
	<syn>{
		node xS (color = black) [cat = S, bot = [mod = I]]{
			node xVP (color = black) [cat = VP, top = [cop = +, num = fN, pers = fP, gen = fG]] {
				node xV (color = black, mark = subst) [cat = V, top = [cop = +, num = fN, pers = fP, gen = fG]]
				}
			node xPred (color = black, mark = anchor) [top = [num = fN, pers = fP, gen = fG]]			
			};
		
		}
}

class KopulativniPredikatLevi
export
	xS xPred xVP xV
declare
	?xS ?xPred ?xVP ?xV ?fW

{
	<syn>{
		node xS (color = black) [cat = S, bot = [mod = I, wh = fW]]{
			node xPred (color = black, mark = anchor) [top = [wh = fW]]
			node xVP (color = black) [cat = VP, top = [cop = +]] {
				node xV (color = black, mark = subst) [cat = V, top = [cop = +]]
				}
						
			}
		}
}

class ImenickiPredikatN 
import
	KopulativniPredikat[]
%declare
%	?fG ?fN ?fP % 18.12. obrisala sam i gen i i num nize, jer ih vec ima u KopulativniPredikat
{
	<syn>{		
		node xPred (mark = anchor) [cat = N, top = [case = 1, pers = z]]
		}
}

class ImenickiPredikatPro 
import
	KopulativniPredikat[]
%declare
%	?fG ?fN ?fP % obrisala sam ovo kako ih ima u klasi KopulativniPredikat
{
	<syn>{
		node xPred (mark = anchor) [cat = PRO, top = [case = 1]]
		}
}

class ImenickiPredikat 
{ ImenickiPredikatN[] | ImenickiPredikatPro[] }

class PridevskiPredikat
import
	KopulativniPredikat[]
%declare
%	?fG ?fN
{
	<syn>{
		node xPred (mark = anchor) [cat = A, top = [case = 1, pers = z, def = +]]
		}
}

class PriloskiPredikatAd
import
	KopulativniPredikat[]
{
	<syn>{
		node xPred (mark = anchor) [cat = ADV]
		}
}

class PriloskiPredikatAdLevi
import
	KopulativniPredikatLevi[]
{
	<syn>{
		node xPred (mark = anchor) [cat = ADV]
		}
}

class PriloskiPredikatPP % NE RADI
import
	KopulativniPredikat[]
export
	xPrep xXO
declare
	?xPrep ?xXO ?fC
{
	<syn>{
		node xPred [cat = PP]{
			node xPrep (color = red, mark = subst) [cat = PREP, top = [case = ?fC]]
			node xXO (color = red, mark = subst) [cat = @{N,PRO}, top = [case = ?fC]]
			}
		}
}

class PriloskiPredikatNum % ne radi
import
	KopulativniPredikat[]
export
	xNUM xNP
declare
	?xNUM ?xNP 
{
	<syn>{
		node xPred [cat = NUMP] {
			node xNUM (color = red, mark = subst) [cat = NUM]
			node xNP (color = red, mark = subst) [cat = N]
			}
		}
}

class PriloskiPredikat
{ PriloskiPredikatAd[] | PriloskiPredikatPP[] | PriloskiPredikatNum[] }

% definisanje klasa za predikativ kao predlosku frazu i brojnufrazu


