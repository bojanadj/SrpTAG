%%%%%%%%%%% SUBJEKATSKO-PREDIKATSKI MODELI %%%%%%%%%%%%%%%

%%% 1 %%%%
% subjekat-predikat

% alternative

class n0Vaktiv  % Zoran spava.
{ Subjekat1[]; AktivniGlagol[] } % zamenila sam aktivni glagol s aktivni predikat da bih ukljucila i pomocni glagol 12.12. opet sam stavila aktivni glagol, ubacila sam Subjekat1 koji ima i nerealizovan subjekat u sebi

class n0Vobezl % Spava se.
{ SubjekatNerealizovan[]; BezlicniDesni[] }

% porodice

class n0V
{n0Vaktiv[] | n0Vobezl[] }

class n0ClVSub % Ti se salis.
{ Subjekat[]; RefleksivniGlagolLevi[] }

class n0ClVNesub % Ti se salis.
{ SubjekatNerealizovan[]; RefleksivniGlagolDesni[] }

class n0ClV
{ n0ClVSub[] | n0ClVNesub[] }

%%% 2 i 3 %%%
% subjekat-predikat-pravi objekat

class n0Vn1diraktiv % Jasna kupuje knjigu.
{ n0Vaktiv[]; PraviObjekat[] }

class n0Vn1dirpasiv % Knjiga je kupljena.
{Subjekat[]; PasivniGlagol[] }

class n0Vn1dirrefpas % Knjige se kupuju.
{ Subjekat[]; RefleksivniGlagolLevi[] }

class n0Vn1dirref % Marija se ceslja.
{ Subjekat[]; RefleksivniGlagolLeviSubst[] }

class n0Vn1dir
{n0Vn1diraktiv[] | n0Vn1dirpasiv[] | n0Vn1dirrefpas[] | n0Vn1dirref[] }

%class n0Vn1dirref % klasa ubacena 10.1. za glagole koji mogu da se refleksivizuju Marija ceslja lutku - Marija se ceslja
%{ n0Vn1diraktiv[] | n0Vn1ref[] }

class n0Vn1dirNer % Jasna cita.
{n0Vaktiv[]; PraviObjekatNerealizovan[] } % 12.12. umesto klase ObjekatPlusRealizovan ovde sam stavila samo PraviObjekatNerealizovan

class n0Vsinf1dir  % Jasna zeli citati. 25.12. - dodala sam dir
{ n0Vaktiv[]; ObjekatInfinitiv[] }

class n0Vdas1dir  % Marko pokusava da nadje karte za utakmicu. 25.12. - ako je da ovde sidro, treba kao takvo da stoji u modelu, izmenila sam umesto c da stoji da
{ n0Vaktiv[]; ObjekatRecenicniKompZamenaDeklarativni[] } 

class n0Vsup1dir  % Marko zna da li ima hleba. 25.12. dodala sam dir
{ n0Vaktiv[]; ObjekatRecenicniKompZamenaUpitni[] }


%%% 4 %%%
% subjekat-predikat-nepravi objekat

% alternative

class n0Vn1indaktiv % Otac pomaze sinu.
{ n0Vaktiv[]; NepraviObjekatIm[] } 

class n0Vn1indpasiv % Sinu je pomagano.
{ LogickiSubjekat[]; PasivniGlagol[] }

class n0Vn1indobezl % Sinu se pomaze. 
{ LogickiSubjekat[]; SubjekatNerealizovan[]; BezlicniLevi[] } 

% porodice

class n0Vn1ind
{ n0Vn1indaktiv[] | n0Vn1indpasiv[] | n0Vn1indobezl[] }

class n0Vpn1ind % Marko je odustao od svoje ideje.
{ n0Vaktiv[]; NepraviObjekatPredloski[] }

class n0Vdasind % Ivan je razmisljao da se upise na prava. 25.12. stavila sam da umesto c i dodala ind na s
{ n0Vaktiv[]; RecenicniNepraviObjekatKompDeklarativni[] }

class n0ClVn1ind % Ivan se stidi brata.
{ n0ClV[]; NepraviObjekatIm[]}

class n0ClVpn1ind % Marko se zaljubio u Tanju.
{ n0ClV[]; NepraviObjekatPredloski[] }

% nisam unela zasebne klase za regirane predloge

class n0ClVdasind % Ivan se pomirio da nece ici na skijanje. 25.12. stavila sam da umesto c i dodala ind na s
{ n0ClV[]; RecenicniNepraviObjekatKompDeklarativni[] }

% sta je sa upitnim deklarativnim recenicama

class n0VindTotal
{ n0Vn1ind[] | n0ClVn1ind[] | n0Vpn1ind[] | n0ClVpn1ind[] | n0Vcs[] | n0ClVcs[] }

class n0VindPitanje
{ n0VindTotal[]; Pitanje[] } % sa Cl primerima daje nepravilan red reci

%%% 5 %%% 
% subjekat-predikat-priloska dopuna

class n0Vad1 % Ja stanujem ovde. % ubaciti obezlicenu verziju - obezlicena verzija je sadrzana u ovoj klasi
{ n0V[]; PriloskaDopunaOsnovna[]}

class n0Vpn1pril % Torba lezi na klupi. 25.12. dodala sam pril
{ n0V[]; PriloskaDopunaPP[] }

class n0Vnumn1 % Racun iznosi 10.000 dinara. 25.12. ubacila sam n u model, pre je stajalo samo num, ali posto pp razbijamo na p i n, i ovde treba razbiti na num i n
{ n0Vaktiv[]; BrojnaDopuna[] }

class n0Vsinf1pril % namerna recenica u obliku infinitiva. treba definisati posebnu klasu za njih, da ne bude da su iste kao objekat? Ubacila sam ad, i dalje treba definsati u uputstvu za kategorije 25.12. umesto ad dodala sam pril Marko odlazi vecerati.
{ n0V[]; PrilogInfinitiv[] }

class n0Vs1pril % namerna recenica sa da - isti komentar kao u prethodnom primeru. Ubacila sam ad, i dalje treba definsati u uputstvu za kategorije 25.12. ubacila sam pril
{ n0V[]; PrilogInfinitiv[] }

class n0ClVad1 % Nikola se ponasa cudno.
{ n0ClV[]; PriloskaDopunaOsnovna[]} % priloska dopuna sadrzi i brojnu i priloski infinitiv. treba izbaciti brojnu

class n0ClVpn1pril % Knjiga se nalazi na stolu. 25.12. dodala sam pril
{ n0ClV[]; PriloskaDopunaPP[] }

%%% 6 %%%
% logicki subjekat-predikat-gramaticki subjekat

class n1lsubVn0 % Jasnu boli zub.
{ LogickiSubjekat[]; AktivniGlagol[]; SubjekatSlobodan[] }

class n1lsubVs0 % Marku odgovara da dodju.
{ LogickiSubjekat[]; AktivniGlagol[]; IzricniSubjekat[] } % definisanje slobodnog reda reci za izricnisubjekat?

class n1lsubClVn0 % Marku se svidja Marija.
{ LogickiSubjekat[]; Refleksivni[]; SubjekatSlobodan[] }

class n1lsubClVs0 % Marku se svidja da pusta muziku.
{ LogickiSubjekat[]; Refleksivni[]; IzricniSubjekat[] } % definisanje slobodnog reda reci za izricnisubjekat?

%%% 7 %%%
% subjekat-predikat-nepravi objekat-pravi objekat

class n0Vn1dirn2ind % Tanja je vratila knjigu Zoranu.
{ n0Vn1dir[]; NepraviObjekatIm[] } % 17.12. stavila sam NepraviObjekatIm umesto NepraviObjekat[] da bih videla da li radi. Sa NepraviObjekat[] nije prepoznavao recenicu Sonja daje glavu Marku

class n0Vn2indcs1dir % Marko je porucio Ivanu da mu vrati ploce. 25.12. dodala sam ind i dir
{ n0Vn1ind[]; ObjekatRecenicniKompZamenaDeklarativni[] }

class n0Vn2indsup1dir % Marko pita Milana sta imaju za rucak. 25.12. dodala sam ind i dir
{ n0Vn1ind[]; ObjekatRecenicniKompZamenaUpitni[] }

% vidi alternative za nepravi objekat i ostale

%%% 8 %%%
% subjekat-predikat-pravi objekat-priloska dopuna

class n0Vn1dirad2 % Marko stavlja kameru blizu.   % zar ne bi svi ovi tipovi trebali da udju u jedan koji se zove kao ovaj?
{ n0Vn1dir[]; PriloskaDopunaOsnovna[] }

class n0Vn1dirpn2pril % Marko stavlja kameru na krevet.
{ n0Vn1dir[]; PriloskaDopunaPP[] } % 17.12. umesto PP ovde sam stavila PriloskaDopunaPP

class n0Vn1dirnumn2 % Marko je platio knjigu 200 dinara.
{ n0Vn1dir[]; BrojnaDopuna[] }

% da li obrisati dir iza n1 ako je to njegova tipicna vrednost, treba uskladiti to.

%%% 9 %%%
% subjekat-kopula-imenski predikativ
 
class n0vN % Ovo je Marija.
{Subjekat[]; ImenickiPredikat[] }

class n0vA % Jasna je pametna.
{Subjekat[]; PridevskiPredikat[] } % treba da napravim slaganje izmedju subjekta, kopule i predikativa, kopulu i predikativ bi mozda trebalo da stavim zajedno u jednu klasu

%%% 10 %%%
% subjekat-kopula-priloski predikativ

class n0vAd  % Stanica je daleko.
{ Subjekat[]; PriloskiPredikat[] }

class n0vPn % Ivan je u skoli. % 25.12. ovaj model sam zasad izbrisala kako nije jasno sta treba da bude sidro
{ Subjekat[]; PriloskiPredikatPP[] }

class n0vNUMn % Hleb je 50 dinara. 25.12. dodala sam n
{ Subjekat[]; BrojnaDopuna[] }

% nemam definisan priloski predikativ za poslednje 2 klase

%%%%%%%% BEZLICNI MODELI %%%%%%%%%%%%%%%%%%%%%%%%%

%%% 1 %%%
% predikat

class V % Seva.
{ BezlicniAktivniGlagol[] }

class VCl % Smrkava se.
{ BezlicniDesni[] }

%%% 2 %%%
% kopula-priloski deo predikata

class Adv % Sparno je.
{ PriloskiPredikatAdLevi[] }

%%% 3 %%%
% logicki subjekat-predikat

class n0lsubV % Marku je pozlilo.
{ LogickiSubjekat[]; BezlicniAktivniGlagol[] }

% treba mi poseban raspored za primer "Ima nastave"

class n0lsubClV % Marku se slosilo.
{ LogickiSubjekat[]; BezlicniLevi[] }

%%% 4 %%%
% logicki subjekat-priloski predikat

class n0lsubvAd % Marku je dobro.
{ LogickiSubjekat[]; PriloskiPredikatAd[] }
