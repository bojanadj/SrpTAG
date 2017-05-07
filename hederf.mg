use color with () dims (syn)
use rank with () dims (syn)
use unicity with (rank=1) dims (syn)
use unicity with (rank=2) dims (syn)
use unicity with (rank=3) dims (syn)
use unicity with (rank=4) dims (syn)
use unicity with (rank=5) dims (syn)

type CAT={S,VP,V,N,P,ADV,ADVP,se,NEG,Cl,da,li,PRO,NP,PP,C,clp,aux,od,NUMP,NUM,A,AP,PAR} %% da sam dodala zbog clase Question, c je comp, clp je clitic phrase
type BOOL={+,-}
type MARK={flex,subst,foot,nadj,anchor,coanchor}
type CASE={1,2,3,5,6,7}
type RANK=[1 .. 5]
type PERSON={x,y,z}
type GENDER={m,f,n,MG,NG,FG}
type NUMBER={s,p,PL}
type FORM={P,R,F,A,I,C,L,D}
type COLOR={red,black,white}
type FUNC={sub,dir,indir,lsub,pdop}
type ASPECT={perf,imperf}
type NAME={se}
%type TENSE={pre,pas,fut,fut2,pot,aor,ipf,ppf}
%type AUX={biti,hteti}
type MOD={W,I,Y,G,T,S,X}
type ATOMIC=[
	form : FORM,
	num : NUMBER,
	gen : GENDER,
	pers : PERSON,
	ref : BOOL,
	cop : BOOL,
	aux-ref : BOOL,
	pos : BOOL,
	func : FUNC,
	cl : BOOL,
%	tense : TENSE,
	case : CASE,
	wh : BOOL,
	neg : BOOL,
	aux : BOOL,
	pasiv : BOOL,
	mod : MOD,
	subg : GENDER,
	subp : PERSON,
	subn : NUMBER, 
	def : BOOL,
	asp : ASPECT
]

feature cat : CAT 
feature case : CASE % vidi da li i ovo i naredna obelezja treba da stavim pod top i bot
feature imp : BOOL
feature trans : BOOL
feature prec : BOOL
feature leftadj : BOOL
feature top : ATOMIC
feature bot : ATOMIC
feature func : FUNC
feature cl : BOOL
feature neg : BOOL
feature aux : BOOL

property mark : MARK
property rank : RANK {
	i_ = 1,
	ii_ = 2,
	iii_ = 3,
	iv_ = 4,
	v_ = 5}
property name : NAME
property pers : PERSON
property gen : GENDER
property num : NUMBER
property color : COLOR
