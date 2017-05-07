class GlagolskiArgument
export 
	xS xVP fW
declare
	?xS ?xVP ?fW
{
	<syn>{
		node xS (color = white) [cat = S, bot = [wh = ?fW]]{ % ovo bi trebalo da bude u bot
			node xVP (color = white) [cat = VP]
			}
		}
}


class SlaganjeSubjekatPredikat
export
	xSubKon	xVPKon
declare
	?xSubKon ?xVPKon ?fN ?fP ?fG
{
	<syn>{
		node xSubKon [top=[num=?fN, pers=?fP, gen = fG]]; %da li da imam rod ovde? nije dobro ako je u pitanju neko prosto vreme, ispada da prezent treba da bude u nekom rodu. Obrisala sam rod 26.11.2016, treba ispraviti i u radu
		node xVPKon [top=[num=?fN, pers=?fP, gen = fG]]

		}
}

%%%%%%%%%%%%%%
%% SUBJEKAT %%
%%%%%%%%%%%%%%

class SubjekatRealizovan
import
	GlagolskiArgument[]
	SlaganjeSubjekatPredikat[]
export
	xSub
declare
	?xSub
{
	<syn>{
		node xS {
			node xSub (color=red, mark=subst) [top=[func=sub, case=1, wh = fW]] %obris pro
			node xVP 
			};
		xSub = xSubKon;
		xVP = xVPKon
	}
}

class SubjekatDeklarativniN
import
	SubjekatRealizovan[]
{
	<syn>{
%		node xS {    % zasto mi ne radi ovo...?
			node xSub [cat = N, top = [wh = -]]
%`			}			
	}
}

class SubjekatDeklarativniPro
import
	SubjekatRealizovan[]
{
	<syn>{
%		node xS {    % zasto mi ne radi ovo...?
			node xSub [cat = PRO, top = [wh = -]]
%`			}			
	}
}

class SubjekatDeklarativni
{ SubjekatDeklarativniN[] | SubjekatDeklarativniPro[] }

class SubjekatDeklarativniSlobodan % za subjekat koji ima slobodan red reci (za modele sa logickim subjektom)
import
	GlagolskiArgument[]
	SlaganjeSubjekatPredikat[]
export
	xSub
declare
	?xSub
{
	<syn>{
		node xS;
		node xSub (color = red, mark = subst) [cat = N, top = [wh = fW, func = sub, case = 1]]; % obrisano pro da proverim da li radi parser
		node xVP;

		xS -> xSub;
		xS -> xVP;	
		xSub = xSubKon;
		xVP = xVPKon
	}
}

class SubjekatUpitni
import
	SubjekatRealizovan[]
{
	<syn>{
		node xSub [cat = PRO, top = [wh = +]]
		}
}

class SubjekatNerealizovan
import 
	GlagolskiArgument[]


class SubjekatImperativ
import
	SubjekatNerealizovan[]
{
	<syn>{
		node xVP [top = [mod = Y, pers = 2, func = sub, num = @{s,p}]] %stavila sam samo drugo lice da bih sprecila da imam imperativ u prvom licu jednice
		}
}

class Subjekat
{ SubjekatDeklarativni[] | SubjekatUpitni[] } 

class Subjekat1 % tamo gde subjekat slobodno moze da bude i nerealizovan
{ SubjekatDeklarativni[] | SubjekatUpitni[] | SubjekatNerealizovan[] } % izbacila sam SubjekatImperativ odavde. Stari komentar na subjekatimperativ u ovoj klasi: na ovaj nacin se pravi pasiv od imperativa, sto nije dobro

class SubjekatSlobodan
{ SubjekatDeklarativniSlobodan[] | Subjekat[] } 

class IzricniSubjekat 
import
	GlagolskiArgument[]
declare
	?xS0 ?xC ?xS00
{
	<syn>{
		node xS{
			node xVP
			node xS0 (color = red, mark = nadj) [cat = S, top = [func = sub]] {
				node xC (color = red, mark = subst) [cat = C]	% 17.12. stavila sam mark = subst samo da bi radilo parsiranje
				node xS00 (color = red, mark = foot) [cat = S, top = [mod = I, wh = -]] 
				}
		}
	}
}
		

class SubjekatInfinitiv
import 
	SubjekatNerealizovan[]
declare
	?xS0
{
	<syn>{
		node xS{
			node xS0 (color = red, mark = subst) [cat = S, top = [func = sub, mod = W, wh = -]] 
			node xVP 
			}
		}
}

class RecenicniSubjekat
{SubjekatInfinitiv[] | IzricniSubjekat[] }



class NeSubjekat
import
	GlagolskiArgument[]
export 
	?xX1
declare
	?xX1 ?fF ?fWh % ubacila sam drugaciju oznaku da ne bi ispalo da S koji nosi oznaku fW treba da bude isti kao ova vrednost, jer to stvara problem kod upitnih recenica s upitnim subjektom 
{
	<syn>{
		node xS{
			node xVP
			 ,,,+node xX1 (color=red) [top = [wh = fWh, func = ?fF]] %ovde bih mogla i da stavim wh=- jer je uvek -
			}
		}
}

%%%%%%%%%%%%%%%%%%%
%% PRAVI OBJEKAT %%
%%%%%%%%%%%%%%%%%%%

class PraviObjekatRealizovanN
import
	NeSubjekat[]

{
	<syn>{
		node xX1 (mark=subst) [cat = N, top = [func = dir, case = @{2,4}, wh = -]]
		}
}

class PraviObjekatRealizovanPro
import
	NeSubjekat[]

{
	<syn>{
		node xX1 (mark=subst) [cat = PRO, top = [func = dir, case = @{2,4}, wh = -]]
		}
}

class PraviObjekatRealizovan
{ PraviObjekatRealizovanN[] | PraviObjekatRealizovanPro[] }

class PraviObjekatNerealizovan
import
	GlagolskiArgument[] 

class PraviObjekat
{ PraviObjekatRealizovan[] | IzmestenPraviObjekat[] | ObjekatskaEnklitika[] } % ovo je eklitika koja dolazi levo od glagola pa nije tacna u vecini slucajeva - sa realizovanim subjektom

class ObjekatPlusNerealizovan
{ ObjekatImenickiRealizovanN[] | ObjekatImenickiRealizovanPro[] | IzmestenPraviObjekat[] | ObjekatskaEnklitika[] | PraviObjekatNerealizovan[] }

class RecenicniNeSubjekatKomp % Opsta klasa za izricne recenice s vrednoscu dopune
import
	NeSubjekat[]
export
	?xC ?xXX1
declare
	?xC ?xXX1 ?fX
{
	<syn>{
		node xX1 [cat = S, top = [mod = I, wh = ?fW]] {
			node xC (color = red, mark = flex) [top = [wh = ?fW]]
			node xXX1 (color = red) [cat = S, top = [mod = I, wh = ?fX]] 
				}
	}
}

class ObjekatRecenicniKomp % Objekat sa komplementizatorom
import
	RecenicniNeSubjekatKomp[]
{
	<syn>{
		node xX1 [top = [func = dir]] {
				}
	}
}

class ObjekatRecenicniKompZamena
import
	ObjekatRecenicniKomp[]
{
	<syn>{
		node xXX1 (mark = subst)
				}
	}


class ObjekatRecenicniKompZamenaDeklarativni
import
	ObjekatRecenicniKompZamena[]
{
	<syn>{
		node xX1 [top = [wh = -]] {
			node xC [cat = da] %vrednost wh sa xX1 se ovde automatski prenosi
			node xXX1 [top = [wh = -]] 
			}
		}	
}

class ObjekatRecenicniKompZamenaUpitni
import
	ObjekatRecenicniKompZamena[]
{
	<syn>{
		node xX1 [top = [wh = +]] {
			node xC [cat = C] %vrednost wh sa xX1 se ovde automatski prenosi
			node xXX1 [top = [wh = -]] 
			}
		}	
}


class Infinitiv
export
	xKontrolisani
declare
	?xKontrolisani
{
	<syn>{
		node xKontrolisani [top = [mod = W, wh = -]]
		}
}


class SubjekatskaKontrola
import
	Infinitiv[]
export
	xVPKontroler
declare
	?xVPKontroler ?fN ?fG ?fP
{
	<syn>{
		node xKontrolisani [top = [subn = ?fN, subg = ?fG, subp = ?fP]];
		node xVPKontroler [top = [subn = ?fN, subg = ?fG, subp = ?fP]]
		}
}

class ZavisneReceniceBezKomp
import
	NeSubjekat[]
{
	<syn>{
		node xX1 (color = red, mark = foot) [cat = S, top = [mod = W, wh = -, func = ?fF]]
		}
}


class ObjekatInfinitiv
import
	ZavisneReceniceBezKomp[]
	SubjekatskaKontrola[]
{
	<syn>{
		node xX1 [top = [wh = -, func = dir]];
%		xKontrolisani = xX1;
%		xVPKontroler = xVP
	}
}

class RecenicniObjekat
{ ObjekatRecenicniKompZamenaDeklarativni[] | ObjekatRecenicniKompZamenaUpitni[] | ObjekatInfinitiv[] }


class Izmestanje 
import
	GlagolskiArgument[]
export
	xSizm xIzm
declare 
	?xSizm ?xIzm ?fF
{
	<syn>{
		node xSizm (color = red) [cat = S, bot = [wh = +]] { 
			node xIzm (color = red, mark = subst) [top = [func = ?fF, wh = +]]
			node xS [top = [wh = -]]
			}
		}
}

class IzmestanjeFraze
import
	Izmestanje[]
export
	xIzm2
declare 
	?xIzm2
{
	<syn>{
		node xSizm { 
			node xIzm {
				node xIzm2
				}
			node xS
			}
		}
}


class IzmestenPraviObjekat %iskljucivo upitan
import
	Izmestanje[]
{
	<syn>{
		node xIzm [cat = PRO, top = [func = dir, case = 4]] 
		}
}


%%%%%%%%%%%%%%%%%%%%%
%% NEPRAVI OBJEKAT %%
%%%%%%%%%%%%%%%%%%%%%

class NepraviObjekatN
import
	NeSubjekat[]

{
	<syn>{
		node xX1 (mark = subst) [cat = N, top = [func = indir, wh = -]] %14.12.obrisala sam case = 3 ovde
			}
}

% case = @{2, 3, 6}

class NepraviObjekatPro
import
	NeSubjekat[]

{
	<syn>{
		node xX1 (color=red, mark = subst) [cat = PRO, top = [func = indir, wh = -]] % 12.14. obrisala sam case = case = @{2, 3, 6}
			}
}

class IzmestenNepraviObjekat
import
	Izmestanje[]
{
	<syn>{
		node xIzm [cat = PRO, top = [func = indir]]
		}
}

class NepraviObjekatIm
{ NepraviObjekatN[] | NepraviObjekatPro[] | IzmestenNepraviObjekat[] }


class PP
import 
	NeSubjekat[]
export
	xPREP xX
declare
	?xPREP ?xX ?fK ?fG ?fN ?fP
{
	<syn>{
		node xX1 [cat = PP, top = [wh = -]]{
			node xPREP (color = red) [cat = P, top = [case = fK]] % 14.12. obrisala sam oznaku flex 
			node xX (color = red, mark = subst) [cat = @{N,PRO}, top = [case = ?fK, gen = fG, num = fN, pers = fP]]
			}
		}
}

class NepraviObjekatPPN
import 
	PP[]
declare
	?fG
{
	<syn>{
		node xX1 [cat = PP, top = [wh = -, func = indir]]{
			node xPREP (color = red, mark = subst) [cat = P] % 14.12. umemsto mark = flex stavila sam subst, obrisala sam padez jer ga ima u klasi PP (fk da bi se razlikovao od subjekta fC)
			node xX (color = red, mark = subst) [cat = N]
			}
		}
}

class NepraviObjekatPPPro
import 
	PP[]
{
	<syn>{
		node xX1 [cat = PP, top = [wh = -, func = indir]]{
			node xPREP (color = red, mark = subst) [cat = P] % 14.12. umemsto mark = flex stavila sam subst, obrisala sam padez jer ga ima u klasi PP (fk da bi se razlikovao od subjekta fC)
			node xX (color = red, mark = subst) [cat = PRO]
			}
		}
}

class NepraviObjekatPP
{ NepraviObjekatPPN[] | NepraviObjekatPPPro[] | IzmestenaPP[] }

class IzmestenaPP % ne radi, ne mogu iz nekog razloga da dodam predlog xP i dopunu xXP
import
	IzmestanjeFraze[]
export
	 xXP
declare 
	?xXP ?fC

{
	<syn>{	
		node xIzm [cat = PP, top = [func = indir]] {
			node xIzm2 [cat = P, top = [case = fC]]  %treba ubaciti tip cvora i boju, isto vazi i za klasu IzmesanjeFraze
			node xXP (color = red, mark = subst) [cat = N, top = [case = fC]]
			}
		}	
}

% nemam predloske klase za regirane predloge


class RecenicniNepraviObjekatKomp
import
	RecenicniNeSubjekatKomp[]
{
	<syn>{
		node xX1 [top = [func = indir]] 
		}
}

class RecenicniNepraviObjekatKompDeklarativni
import
	RecenicniNepraviObjekatKomp[]
{
	<syn>{
		node xX1 [top = [wh = -]] {
			node xC [cat = da, top = [wh = -]]
			node xXX1 [top = [wh = -]] 
				}
	}
}

class RecenicniNepraviObjekatKompUpitni
import
	RecenicniNepraviObjekatKomp[]
{
	<syn>{
		node xX1 [top = [wh = +]] {
			node xC [cat = C, top = [wh = +]]
			node xXX1 [top = [wh = -]] 
				}
		}
}

class RecenicniNepraviObjekat
{RecenicniNepraviObjekatKompDeklarativni[] | RecenicniNepraviObjekatKompUpitni[] }

class NepraviObjekatPredloski
{ NepraviObjekatPP[] | IzmestenaPP[] }

class NepraviObjekat
{ RecenicniNepraviObjekat[] | NepraviObjekatPredloski[] | NepraviObjekatIm[] }


class EnklitikaRealizovanSubjekat
import
	GlagolskiArgument[]
export
	xCl
declare
	?xCl ?fC ?fR
{
	<syn>{	
		node xS { 
			node xCl (color = red) [cat = Cl, top = [rank = ?fR]]
			node xVP
			}
		}
}


class EnklitikaNerealizovanSubjekat 
import
	GlagolskiArgument[]
export
	xCl
declare
	?xCl ?xCl
{
	<syn>{		
		node xS;
		node xVP;
		node xCl (color = red) [cat = Cl];
		xS -> xVP;
		xS -> xCl;
		xVP >>* xCl
		}
}

class ObjekatskaEnklitika
import
	EnklitikaNerealizovanSubjekat[]
{
	<syn>{
		node xCl (mark = subst, rank = 3) [top = [func = dir, case = 4]] % rank moze biti i 2 ali nisam to ukljucila
		}
}

class NepraviObjekatEnklitika
import
	EnklitikaNerealizovanSubjekat[]
{
	<syn>{
		node xCl (mark = subst, rank = 2) [top = [func = indir, case = 3]]
		}
}

class RefleksivnaEnklitika
import EnklitikaNerealizovanSubjekat[]
{
	<syn>{
		node xCl (mark = flex, rank = 4) [top = [refl = +, case = 4]]
		}
}


class AgentivnaOdredba
import
	PP[]
{
	<syn>{
		node xX1{
			node xPREP [cat = od, top = [case = 2]]
			node xX [cat = @{N, PRO}, top = [case = 2]]
			}
		}
}

%%%%%%%%%%%%%%%%%%%%%%
%% LOGICKI SUBJEKAT %%
%%%%%%%%%%%%%%%%%%%%%%

class LogickiSubjekatN
import
	GlagolskiArgument[]
export
	xLog
declare
	?xLog
{
	<syn>{
		node xS;
		node xLog (color = red, mark = subst) [cat = N, top = [func = lsub, wh = -, case = @{2,3,4}]];
		node xVP;
		xS -> xLog;
		xS -> xVP
		}
}

class LogickiSubjekatPro
import
	GlagolskiArgument[]
export
	xLog
declare
	?xLog
{
	<syn>{
		node xS;
		node xLog (color = red, mark = subst) [cat = PRO, top = [func = lsub, wh = -, case = @{2,3,4}]];
		node xVP;
		xS -> xLog;
		xS -> xVP
		}
}

class LogickiSubjekatOpsti
{LogickiSubjekatN[] | LogickiSubjekatPro[] }
			
class IzmestenLogickiSubjekat
import
	Izmestanje[]
{
	<syn>{
		node xIzm [cat = PRO, top = [func = lsub]]
		}
}

class LogickiSubjekat
{ LogickiSubjekatOpsti[] | IzmestenLogickiSubjekat[] }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% PRILOSKA DOPUNA %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class Prilog
import 
	NeSubjekat[]
{
	<syn>{
		node xS{
			node xVP
			 ,,,+node xX1 (color = red, mark = subst) [cat = ADV, top = [func = pdop, wh = -]]
			}
		}
}

class IzmestenPrilog
import
	Izmestanje[]
{
	<syn>{
		node xIzm [cat = ADV, top = [func = pdop, wh = +]]
		}
}

class PriloskaDopunaOsnovna
{ Prilog[] | IzmestenPrilog[] }

class BrojnaDopuna
import 
	NeSubjekat[]
export
	xNUM xNP
declare
	?xNUM ?xNP
{
	<syn>{
		node xX1 [cat = NUMP, top = [func = pdop, wh = -]] {
			node xNUM (color = red, mark = anchor) [cat = NUM]
			node xNP (color = red, mark = subst) [cat = N]
			}
		}
}


class PrilogInfinitiv
import
	ZavisneReceniceBezKomp[]
	SubjekatskaKontrola[]
{
	<syn>{
		node xX1 [top = [mod = W, func = pdop]];
		xKontrolisani = xX1;
		xVPKontroler = xVP
	}
}

class PriloskaDopunaPPN
import
	PP[]

{
	<syn>{
		node xX1 [top = [func = pdop]]{
			node xPREP (mark = subst) % 15.12. stavila sam da je subst da bi program zasad mogao da radi
			node xX [cat = N]
			}
		}
}

class PriloskaDopunaPPPro
import
	PP[]

{
	<syn>{
		node xX1 [top = [func = pdop]]{
			node xPREP (mark = subst) % 15.12. stavila sam da je subst da bi program zasad mogao da radi
			node xX [cat = PRO]
			}
		}
}
		
class PriloskaDopunaPP
{ PriloskaDopunaPPN[] |  PriloskaDopunaPPPro[] }

class PriloskaDopuna % odavde bi trebalo da izbacim BrojnuDopunu
{ PriloskaDopunaOsnovna[] | BrojnaDopuna[] | PrilogInfinitiv[] | PriloskaDopunaPP[] } % 17.12. ubacila sam PriloskaDopunaPP ovde, nije ranije bila tu. Ako cu da je zadrzim, ne trebaju mi odvojene klase za razlicite tipove ovakvih dopuna u modelu 8

		
