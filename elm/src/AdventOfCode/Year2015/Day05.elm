module AdventOfCode.Year2015.Day05 exposing
    ( containsPairOfLettersAppearingTwice
    , containsRepeatedCharacter
    , containsThreeVowels
    , containsUnwantedStrings
    , rawInput
    , run
    , runPartTwo
    )

-- IMPORTS

import Utils.List



-- RUN


run : String -> Int
run =
    processInput
        >> filters
        >> List.length


runPartTwo : String -> Int
runPartTwo =
    processInput
        >> filtersForPartTwo
        >> List.length



-- PROCESS INPUT


processInput : String -> List String
processInput input =
    input
        |> String.trim
        |> String.lines
        |> List.map String.trim



-- FILTERS


filters : List String -> List String
filters strings =
    strings
        |> Utils.List.reject containsUnwantedStrings
        |> List.filter containsThreeVowels
        |> List.filter containsRepeatedCharacter


filtersForPartTwo : List String -> List String
filtersForPartTwo strings =
    strings
        |> List.filter containsPairOfLettersAppearingTwice
        |> List.filter containsLetterWhichRepeatsWithLetterBetween



{-
   Contains a pair of any two letters that appears at least twice in the string
   without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa,
   but it overlaps).
-}


containsPairOfLettersAppearingTwice : String -> Bool
containsPairOfLettersAppearingTwice _ =
    -- TODO
    True



{-
   Contains at least one letter which repeats with exactly one letter between
   them, like xyx, abcdefeghi (efe), or even aaa.
-}


containsLetterWhichRepeatsWithLetterBetween : String -> Bool
containsLetterWhichRepeatsWithLetterBetween _ =
    -- TODO
    True



{-
   Contains any of the strings ab, cd, pq, or xy.
-}


containsUnwantedStrings : String -> Bool
containsUnwantedStrings string =
    List.any (\s -> String.contains s string) [ "ab", "cd", "pq", "xy" ]



{-
   Contains at least three vowels.
-}


containsThreeVowels : String -> Bool
containsThreeVowels string =
    string
        |> countVowelsInString
        |> reduceVowelCountToBool


type alias VowelCounts =
    { a : Int
    , e : Int
    , i : Int
    , o : Int
    , u : Int
    }


countVowelsInString : String -> VowelCounts
countVowelsInString string =
    let
        vowelCounts : VowelCounts
        vowelCounts =
            { a = 0
            , e = 0
            , i = 0
            , o = 0
            , u = 0
            }
    in
    string
        |> String.split ""
        |> List.foldl updateVowelCounts vowelCounts


updateVowelCounts : String -> VowelCounts -> VowelCounts
updateVowelCounts character vowelCounts =
    case character of
        "a" ->
            { vowelCounts | a = vowelCounts.a + 1 }

        "e" ->
            { vowelCounts | e = vowelCounts.e + 1 }

        "i" ->
            { vowelCounts | i = vowelCounts.i + 1 }

        "o" ->
            { vowelCounts | o = vowelCounts.o + 1 }

        "u" ->
            { vowelCounts | u = vowelCounts.u + 1 }

        _ ->
            vowelCounts


reduceVowelCountToBool : VowelCounts -> Bool
reduceVowelCountToBool vowelCounts =
    let
        vowelsUsed =
            [ vowelCounts.a
            , vowelCounts.e
            , vowelCounts.i
            , vowelCounts.o
            , vowelCounts.u
            ]
                |> List.sum
    in
    vowelsUsed >= 3



{-
   Contains at least one letter that appears twice in a row.
-}


containsRepeatedCharacter : String -> Bool
containsRepeatedCharacter string =
    let
        repeatedCharactersToCheck : List String
        repeatedCharactersToCheck =
            string
                |> String.split ""
                |> List.map (\character -> String.repeat 2 character)
    in
    List.any (\repeatedCharacters -> String.contains repeatedCharacters string) repeatedCharactersToCheck



-- INPUT


rawInput : String
rawInput =
    """
sszojmmrrkwuftyv
isaljhemltsdzlum
fujcyucsrxgatisb
qiqqlmcgnhzparyg
oijbmduquhfactbc
jqzuvtggpdqcekgk
zwqadogmpjmmxijf
uilzxjythsqhwndh
gtssqejjknzkkpvw
wrggegukhhatygfi
vhtcgqzerxonhsye
tedlwzdjfppbmtdx
iuvrelxiapllaxbg
feybgiimfthtplui
qxmmcnirvkzfrjwd
vfarmltinsriqxpu
oanqfyqirkraesfq
xilodxfuxphuiiii
yukhnchvjkfwcbiq
bdaibcbzeuxqplop
ivegnnpbiyxqsion
ybahkbzpditgwdgt
dmebdomwabxgtctu
ibtvimgfaeonknoh
jsqraroxudetmfyw
dqdbcwtpintfcvuz
tiyphjunlxddenpj
fgqwjgntxagidhah
nwenhxmakxqkeehg
zdoheaxqpcnlhnen
tfetfqojqcdzlpbm
qpnxkuldeiituggg
xwttlbdwxohahwar
hjkwzadmtrkegzye
koksqrqcfwcaxeof
wulwmrptktliyxeq
gyufbedqhhyqgqzj
txpunzodohikzlmj
jloqfuejfkemcrvu
amnflshcheuddqtc
pdvcsduggcogbiia
yrioavgfmeafjpcz
uyhbtmbutozzqfvq
mwhgfwsgyuwcdzik
auqylgxhmullxpaa
lgelzivplaeoivzh
uyvcepielfcmswoa
qhirixgwkkccuzlp
zoonniyosmkeejfg
iayfetpixkedyana
ictqeyzyqswdskiy
ejsgqteafvmorwxe
lhaiqrlqqwfbrqdx
ydjyboqwhfpqfydc
dwhttezyanrnbybv
edgzkqeqkyojowvr
rmjfdwsqamjqehdq
ozminkgnkwqctrxz
bztjhxpjthchhfcd
vrtioawyxkivrpiq
dpbcsznkpkaaclyy
vpoypksymdwttpvz
hhdlruwclartkyap
bqkrcbrksbzcggbo
jerbbbnxlwfvlaiw
dwkasufidwjrjfbf
kkfxtjhbnmqbmfwf
vmnfziwqxmioukmj
rqxvcultipkecdtu
fhmfdibhtjzkiqsd
hdpjbuzzbyafqrpd
emszboysjuvwwvts
msyigmwcuybfiooq
druyksfnbluvnwoh
fvgstvynnfbvxhsx
bmzalvducnqtuune
lzwkzfzttsvpllei
olmplpvjamynfyfd
padcwfkhystsvyfb
wjhbvxkwtbfqdilb
hruaqjwphonnterf
bufjobjtvxtzjpmj
oiedrjvmlbtwyyuy
sgiemafwfztwsyju
nsoqqfudrtwszyqf
vonbxquiiwxnazyl
yvnmjxtptujwqudn
rrnybqhvrcgwvrkq
taktoxzgotzxntfu
quffzywzpxyaepxa
rfvjebfiddcfgmwv
iaeozntougqwnzoh
scdqyrhoqmljhoil
bfmqticltmfhxwld
brbuktbyqlyfpsdl
oidnyhjkeqenjlhd
kujsaiqojopvrygg
vebzobmdbzvjnjtk
uunoygzqjopwgmbg
piljqxgicjzgifso
ikgptwcjzywswqnw
pujqsixoisvhdvwi
trtuxbgigogfsbbk
mplstsqclhhdyaqk
gzcwflvmstogdpvo
tfjywbkmimyyqcjd
gijutvhruqcsiznq
ibxkhjvzzxgavkha
btnxeqvznkxjsgmq
tjgofgauxaelmjoq
sokshvyhlkxerjrv
ltogbivktqmtezta
uduwytzvqvfluyuf
msuckpthtgzhdxan
fqmcglidvhvpirzr
gwztkqpcwnutvfga
bsjfgsrntdhlpqbx
xloczbqybxmiopwt
orvevzyjliomkkgu
mzjbhmfjjvaziget
tlsdxuhwdmghdyjb
atoecyjhwmznaewi
pyxpyvvipbqibiox
ajbfmpqqobfsmesj
siknbzefjblnohgd
eqfhgewbblwdfkmc
opylbscrotckkrbk
lbwxbofgjkzdxkle
ceixfjstaptdomvm
hnkrqxifjmmjktie
aqykzeuzvvetoygd
fouahjimfcisxima
prkzhutbqsyrhjzx
qqwliakathnsbzne
sayhgqtlcqqidqhj
ygduolbysehdudra
zricvxhdzznuxuce
ucvzakslykpgsixd
udirhgcttmyspgsb
yuwzppjzfsjhhdzi
gtqergjiuwookwre
xvxexbjyjkxovvwf
mlpaqhnnkqxrmwmm
ezuqbrjozwuqafhb
mcarusdthcbsonoq
weeguqeheeiigrue
pngtfugozxofaqxv
copphvbjcmfspenv
jiyahihykjjkdaya
gdqnmesvptuyrfwp
vbdscfywqmfxbohh
crtrfuxyjypzubrg
seihvevtxywxhflp
fvvpmgttnapklwou
qmqaqsajmqwhetpk
zetxvrgjmblxvakr
kpvwblrizaabmnhz
mwpvvzaaicntrkcp
clqyjiegtdsswqfm
ymrcnqgcpldgfwtm
nzyqpdenetncgnwq
cmkzevgacnmdkqro
kzfdsnamjqbeirhi
kpxrvgvvxapqlued
rzskbnfobevzrtqu
vjoahbfwtydugzap
ykbbldkoijlvicbl
mfdmroiztsgjlasb
quoigfyxwtwprmdr
ekxjqafwudgwfqjm
obtvyjkiycxfcdpb
lhoihfnbuqelthof
eydwzitgxryktddt
rxsihfybacnpoyny
bsncccxlplqgygtw
rvmlaudsifnzhcqh
huxwsyjyebckcsnn
gtuqzyihwhqvjtes
zreeyomtngvztveq
nwddzjingsarhkxb
nuqxqtctpoldrlsh
wkvnrwqgjooovhpf
kwgueyiyffudtbyg
tpkzapnjxefqnmew
ludwccvkihagvxal
lfdtzhfadvabghna
njqmlsnrkcfhtvbb
cajzbqleghhnlgap
vmitdcozzvqvzatp
eelzefwqwjiywbcz
uyztcuptfqvymjpi
aorhnrpkjqqtgnfo
lfrxfdrduoeqmwwp
vszpjvbctblplinh
zexhadgpqfifcqrz
ueirfnshekpemqua
qfremlntihbwabtb
nwznunammfexltjc
zkyieokaaogjehwt
vlrxgkpclzeslqkq
xrqrwfsuacywczhs
olghlnfjdiwgdbqc
difnlxnedpqcsrdf
dgpuhiisybjpidsj
vlwmwrikmitmoxbt
sazpcmcnviynoktm
pratafauetiknhln
ilgteekhzwlsfwcn
ywvwhrwhkaubvkbl
qlaxivzwxyhvrxcf
hbtlwjdriizqvjfb
nrmsononytuwslsa
mpxqgdthpoipyhjc
mcdiwmiqeidwcglk
vfbaeavmjjemfrmo
qzcbzmisnynzibrc
shzmpgxhehhcejhb
wirtjadsqzydtyxd
qjlrnjfokkqvnpue
dxawdvjntlbxtuqc
wttfmnrievfestog
eamjfvsjhvzzaobg
pbvfcwzjgxahlrag
omvmjkqqnobvnzkn
lcwmeibxhhlxnkzv
uiaeroqfbvlazegs
twniyldyuonfyzqw
wgjkmsbwgfotdabi
hnomamxoxvrzvtew
ycrcfavikkrxxfgw
isieyodknagzhaxy
mgzdqwikzullzyco
mumezgtxjrrejtrs
nwmwjcgrqiwgfqel
wjgxmebfmyjnxyyp
durpspyljdykvzxf
zuslbrpooyetgafh
kuzrhcjwbdouhyme
wyxuvbciodscbvfm
kbnpvuqwmxwfqtqe
zddzercqogdpxmft
sigrdchxtgavzzjh
lznjolnorbuddgcs
ycnqabxlcajagwbt
bnaudeaexahdgxsj
rlnykxvoctfwanms
jngyetkoplrstfzt
tdpxknwacksotdub
yutqgssfoptvizgr
lzmqnxeqjfnsxmsa
iqpgfsfmukovsdgu
qywreehbidowtjyz
iozamtgusdctvnkw
ielmujhtmynlwcfd
hzxnhtbnmmejlkyf
ftbslbzmiqkzebtd
bcwdqgiiizmohack
dqhfkzeddjzbdlxu
mxopokqffisxosci
vciatxhtuechbylk
khtkhcvelidjdena
blatarwzfqcapkdt
elamngegnczctcck
xeicefdbwrxhuxuf
sawvdhjoeahlgcdr
kmdcimzsfkdfpnir
axjayzqlosrduajb
mfhzreuzzumvoggr
iqlbkbhrkptquldb
xcvztvlshiefuhgb
pkvwyqmyoazocrio
ajsxkdnerbmhyxaj
tudibgsbnpnizvsi
cxuiydkgdccrqvkh
cyztpjesdzmbcpot
nnazphxpanegwitx
uphymczbmjalmsct
yyxiwnlrogyzwqmg
gmqwnahjvvdyhnfa
utolskxpuoheugyl
mseszdhyzoyavepd
ycqknvbuvcjfgmlc
sknrxhxbfpvpeorn
zqxqjetooqcodwml
sesylkpvbndrdhsy
fryuxvjnsvnjrxlw
mfxusewqurscujnu
mbitdjjtgzchvkfv
ozwlyxtaalxofovd
wdqcduaykxbunpie
rlnhykxiraileysk
wgoqfrygttlamobg
kflxzgxvcblkpsbz
tmkisflhativzhde
owsdrfgkaamogjzd
gaupjkvkzavhfnes
wknkurddcknbdleg
lltviwincmbtduap
qwzvspgbcksyzzmb
ydzzkumecryfjgnk
jzvmwgjutxoysaam
icrwpyhxllbardkr
jdopyntshmvltrve
afgkigxcuvmdbqou
mfzzudntmvuyhjzt
duxhgtwafcgrpihc
tsnhrkvponudumeb
sqtvnbeiigdzbjgv
eczmkqwvnsrracuo
mhehsgqwiczaiaxv
kaudmfvifovrimpd
lupikgivechdbwfr
mwaaysrndiutuiqx
aacuiiwgaannunmm
tjqjbftaqitukwzp
lrcqyskykbjpaekn
lirrvofbcqpjzxmr
jurorvzpplyelfml
qonbllojmloykjqe
sllkzqujfnbauuqp
auexjwsvphvikali
usuelbssqmbrkxyc
wyuokkfjexikptvv
wmfedauwjgbrgytl
sfwvtlzzebxzmuvw
rdhqxuechjsjcvaf
kpavhqkukugocsxu
ovnjtumxowbxduts
zgerpjufauptxgat
pevvnzjfwhjxdoxq
pmmfwxajgfziszcs
difmeqvaghuitjhs
icpwjbzcmlcterwm
ngqpvhajttxuegyh
mosjlqswdngwqsmi
frlvgpxrjolgodlu
eazwgrpcxjgoszeg
bbtsthgkjrpkiiyk
tjonoglufuvsvabe
xhkbcrofytmbzrtk
kqftfzdmpbxjynps
kmeqpocbnikdtfyv
qjjymgqxhnjwxxhp
dmgicrhgbngdtmjt
zdxrhdhbdutlawnc
afvoekuhdboxghvx
hiipezngkqcnihty
bbmqgheidenweeov
suprgwxgxwfsgjnx
adeagikyamgqphrj
zzifqinoeqaorjxg
adhgppljizpaxzld
lvxyieypvvuqjiyc
nljoakatwwwoovzn
fcrkfxclcacshhmx
ownnxqtdhqbgthch
lmfylrcdmdkgpwnj
hlwjfbvlswbzpbjr
mkofhdtljdetcyvp
synyxhifbetzarpo
agnggugngadrcxoc
uhttadmdmhidpyjw
ohfwjfhunalbubpr
pzkkkkwrlvxiuysn
kmidbxmyzkjrwjhu
egtitdydwjxmajnw
civoeoiuwtwgbqqs
dfptsguzfinqoslk
tdfvkreormspprer
zvnvbrmthatzztwi
ffkyddccrrfikjde
hrrmraevdnztiwff
qaeygykcpbtjwjbr
purwhitkmrtybslh
qzziznlswjaussel
dfcxkvdpqccdqqxj
tuotforulrrytgyn
gmtgfofgucjywkev
wkyoxudvdkbgpwhd
qbvktvfvipftztnn
otckgmojziezmojb
inxhvzbtgkjxflay
qvxapbiatuudseno
krpvqosbesnjntut
oqeukkgjsfuqkjbb
prcjnyymnqwqksiz
vuortvjxgckresko
orqlyobvkuwgathr
qnpyxlnazyfuijox
zwlblfkoklqmqzkw
hmwurwtpwnrcsanl
jzvxohuakopuzgpf
sfcpnxrviphhvxmx
qtwdeadudtqhbely
dbmkmloasqphnlgj
olylnjtkxgrubmtk
nxsdbqjuvwrrdbpq
wbabpirnpcsmpipw
hjnkyiuxpqrlvims
enzpntcjnxdpuqch
vvvqhlstzcizyimn
triozhqndbttglhv
fukvgteitwaagpzx
uhcvukfbmrvskpen
tizcyupztftzxdmt
vtkpnbpdzsaluczz
wodfoyhoekidxttm
otqocljrmwfqbxzu
linfbsnfvixlwykn
vxsluutrwskslnye
zbshygtwugixjvsi
zdcqwxvwytmzhvoo
wrseozkkcyctrmei
fblgtvogvkpqzxiy
opueqnuyngegbtnf
qxbovietpacqqxok
zacrdrrkohfygddn
gbnnvjqmkdupwzpq
qgrgmsxeotozvcak
hnppukzvzfmlokid
dzbheurndscrrtcl
wbgdkadtszebbrcw
fdmzppzphhpzyuiz
bukomunhrjrypohj
ohodhelegxootqbj
rsplgzarlrknqjyh
punjjwpsxnhpzgvu
djdfahypfjvpvibm
mlgrqsmhaozatsvy
xwktrgyuhqiquxgn
wvfaoolwtkbrisvf
plttjdmguxjwmeqr
zlvvbwvlhauyjykw
cigwkbyjhmepikej
masmylenrusgtyxs
hviqzufwyetyznze
nzqfuhrooswxxhus
pdbdetaqcrqzzwxf
oehmvziiqwkzhzib
icgpyrukiokmytoy
ooixfvwtiafnwkce
rvnmgqggpjopkihs
wywualssrmaqigqk
pdbvflnwfswsrirl
jeaezptokkccpbuj
mbdwjntysntsaaby
ldlgcawkzcwuxzpz
lwktbgrzswbsweht
ecspepmzarzmgpjm
qmfyvulkmkxjncai
izftypvwngiukrns
zgmnyjfeqffbooww
nyrkhggnprhedows
yykzzrjmlevgffah
mavaemfxhlfejfki
cmegmfjbkvpncqwf
zxidlodrezztcrij
fseasudpgvgnysjv
fupcimjupywzpqzp
iqhgokavirrcvyys
wjmkcareucnmfhui
nftflsqnkgjaexhq
mgklahzlcbapntgw
kfbmeavfxtppnrxn
nuhyvhknlufdynvn
nviogjxbluwrcoec
tyozixxxaqiuvoys
kgwlvmvgtsvxojpr
moeektyhyonfdhrb
kahvevmmfsmiiqex
xcywnqzcdqtvhiwd
fnievhiyltbvtvem
jlmndqufirwgtdxd
muypbfttoeelsnbs
rypxzbnujitfwkou
ubmmjbznskildeoj
ofnmizdeicrmkjxp
rekvectjbmdnfcib
yohrojuvdexbctdh
gwfnfdeibynzjmhz
jfznhfcqdwlpjull
scrinzycfhwkmmso
mskutzossrwoqqsi
rygoebkzgyzushhr
jpjqiycflqkexemx
arbufysjqmgaapnl
dbjerflevtgweeoj
snybnnjlmwjvhois
fszuzplntraprmbj
mkvaatolvuggikvg
zpuzuqygoxesnuyc
wnpxvmxvllxalulm
eivuuafkvudeouwy
rvzckdyixetfuehr
qgmnicdoqhveahyx
miawwngyymshjmpj
pvckyoncpqeqkbmx
llninfenrfjqxurv
kzbjnlgsqjfuzqtp
rveqcmxomvpjcwte
bzotkawzbopkosnx
ktqvpiribpypaymu
wvlzkivbukhnvram
uohntlcoguvjqqdo
ajlsiksjrcnzepkt
xsqatbldqcykwusd
ihbivgzrwpmowkop
vfayesfojmibkjpb
uaqbnijtrhvqxjtb
hhovshsfmvkvymba
jerwmyxrfeyvxcgg
hncafjwrlvdcupma
qyvigggxfylbbrzt
hiiixcyohmvnkpgk
mmitpwopgxuftdfu
iaxderqpceboixoa
zodfmjhuzhnsqfcb
sthtcbadrclrazsi
bkkkkcwegvypbrio
wmpcofuvzemunlhj
gqwebiifvqoeynro
juupusqdsvxcpsgv
rbhdfhthxelolyse
kjimpwnjfrqlqhhz
rcuigrjzarzpjgfq
htxcejfyzhydinks
sxucpdxhvqjxxjwf
omsznfcimbcwaxal
gufmtdlhgrsvcosb
bssshaqujtmluerz
uukotwjkstgwijtr
kbqkneobbrdogrxk
ljqopjcjmelgrakz
rwtfnvnzryujwkfb
dedjjbrndqnilbeh
nzinsxnpptzagwlb
lwqanydfirhnhkxy
hrjuzfumbvfccxno
okismsadkbseumnp
sfkmiaiwlktxqvwa
hauwpjjwowbunbjj
nowkofejwvutcnui
bqzzppwoslaeixro
urpfgufwbtzenkpj
xgeszvuqwxeykhef
yxoldvkyuikwqyeq
onbbhxrnmohzskgg
qcikuxakrqeugpoa
lnudcqbtyzhlpers
nxduvwfrgzaailgl
xniuwvxufzxjjrwz
ljwithcqmgvntjdj
awkftfagrfzywkhs
uedtpzxyubeveuek
bhcqdwidbjkqqhzl
iyneqjdmlhowwzxx
kvshzltcrrururty
zgfpiwajegwezupo
tkrvyanujjwmyyri
ercsefuihcmoaiep
ienjrxpmetinvbos
jnwfutjbgenlipzq
bgohjmrptfuamzbz
rtsyamajrhxbcncw
tfjdssnmztvbnscs
bgaychdlmchngqlp
kfjljiobynhwfkjo
owtdxzcpqleftbvn
ltjtimxwstvzwzjj
wbrvjjjajuombokf
zblpbpuaqbkvsxye
gwgdtbpnlhyqspdi
abipqjihjqfofmkx
nlqymnuvjpvvgova
avngotmhodpoufzn
qmdyivtzitnrjuae
xfwjmqtqdljuerxi
csuellnlcyqaaamq
slqyrcurcyuoxquo
dcjmxyzbzpohzprl
uqfnmjwniyqgsowb
rbmxpqoblyxdocqc
ebjclrdbqjhladem
ainnfhxnsgwqnmyo
eyytjjwhvodtzquf
iabjgmbbhilrcyyp
pqfnehkivuelyccc
xgjbyhfgmtseiimt
jwxyqhdbjiqqqeyy
gxsbrncqkmvaryln
vhjisxjkinaejytk
seexagcdmaedpcvh
lvudfgrcpjxzdpvd
fxtegyrqjzhmqean
dnoiseraqcoossmc
nwrhmwwbykvwmgep
udmzskejvizmtlce
hbzvqhvudfdlegaa
cghmlfqejbxewskv
bntcmjqfwomtbwsb
qezhowyopjdyhzng
todzsocdkgfxanbz
zgjkssrjlwxuhwbk
eibzljqsieriyrzr
wamxvzqyycrxotjp
epzvfkispwqynadu
dwlpfhtrafrxlyie
qhgzujhgdruowoug
girstvkahaemmxvh
baitcrqmxhazyhbl
xyanqcchbhkajdmc
gfvjmmcgfhvgnfdq
tdfdbslwncbnkzyz
jojuselkpmnnbcbb
hatdslkgxtqpmavj
dvelfeddvgjcyxkj
gnsofhkfepgwltse
mdngnobasfpewlno
qssnbcyjgmkyuoga
glvcmmjytmprqwvn
gwrixumjbcdffsdl
lozravlzvfqtsuiq
sicaflbqdxbmdlch
inwfjkyyqbwpmqlq
cuvszfotxywuzhzi
igfxyoaacoarlvay
ucjfhgdmnjvgvuni
rvvkzjsytqgiposh
jduinhjjntrmqroz
yparkxbgsfnueyll
lyeqqeisxzfsqzuj
woncskbibjnumydm
lltucklragtjmxtl
ubiyvmyhlesfxotj
uecjseeicldqrqww
xxlxkbcthufnjbnm
lhqijovvhlffpxga
fzdgqpzijitlogjz
efzzjqvwphomxdpd
jvgzvuyzobeazssc
hejfycgxywfjgbfw
yhjjmvkqfbnbliks
sffvfyywtlntsdsz
dwmxqudvxqdenrur
asnukgppdemxrzaz
nwqfnumblwvdpphx
kqsmkkspqvxzuket
cpnraovljzqiquaz
qrzgrdlyyzbyykhg
opoahcbiydyhsmqe
hjknnfdauidjeydr
hczdjjlygoezadow
rtflowzqycimllfv
sfsrgrerzlnychhq
bpahuvlblcolpjmj
albgnjkgmcrlaicl
pijyqdhfxpaxzdex
eeymiddvcwkpbpux
rqwkqoabywgggnln
vckbollyhgbgmgwh
ylzlgvnuvpynybkm
hpmbxtpfosbsjixt
ocebeihnhvkhjfqz
tvctyxoujdgwayze
efvhwxtuhapqxjen
rusksgefyidldmpo
nkmtjvddfmhirmzz
whvtsuadwofzmvrt
iiwjqvsdxudhdzzk
gucirgxaxgcassyo
rmhfasfzexeykwmr
hynlxcvsbgosjbis
huregszrcaocueen
pifezpoolrnbdqtv
unatnixzvdbqeyox
xtawlpduxgacchfe
bdvdbflqfphndduf
xtdsnjnmzccfptyt
nkhsdkhqtzqbphhg
aqcubmfkczlaxiyb
moziflxpsfubucmv
srdgnnjtfehiimqx
pwfalehdfyykrohf
sysxssmvewyfjrve
brsemdzosgqvvlxe
bimbjoshuvflkiat
hkgjasmljkpkwwku
sbnmwjvodygobpqc
bbbqycejueruihhd
corawswvlvneipyc
gcyhknmwsczcxedh
kppakbffdhntmcqp
ynulzwkfaemkcefp
pyroowjekeurlbii
iwksighrswdcnmxf
glokrdmugreygnsg
xkmvvumnfzckryop
aesviofpufygschi
csloawlirnegsssq
fkqdqqmlzuxbkzbc
uzlhzcfenxdfjdzp
poaaidrktteusvyf
zrlyfzmjzfvivcfr
qwjulskbniitgqtx
gjeszjksbfsuejki
vczdejdbfixbduaq
knjdrjthitjxluth
jweydeginrnicirl
bottrfgccqhyycsl
eiquffofoadmbuhk
lbqfutmzoksscswf
xfmdvnvfcnzjprba
uvugkjbkhlaoxmyx
wadlgtpczgvcaqqv
inzrszbtossflsxk
dbzbtashaartczrj
qbjiqpccefcfkvod
hluujmokjywotvzy
thwlliksfztcmwzh
arahybspdaqdexrq
nuojrmsgyipdvwyx
hnajdwjwmzattvst
sulcgaxezkprjbgu
rjowuugwdpkjtypw
oeugzwuhnrgiaqga
wvxnyymwftfoswij
pqxklzkjpcqscvde
tuymjzknntekglqj
odteewktugcwlhln
exsptotlfecmgehc
eeswfcijtvzgrqel
vjhrkiwmunuiwqau
zhlixepkeijoemne
pavfsmwesuvebzdd
jzovbklnngfdmyws
nbajyohtzfeoiixz
ciozmhrsjzrwxvhz
gwucrxieqbaqfjuv
uayrxrltnohexawc
flmrbhwsfbcquffm
gjyabmngkitawlxc
rwwtggvaygfbovhg
xquiegaisynictjq
oudzwuhexrwwdbyy
lengxmguyrwhrebb
uklxpglldbgqsjls
dbmvlfeyguydfsxq
zspdwdqcrmtmdtsc
mqfnzwbfqlauvrgc
amcrkzptgacywvhv
ndxmskrwrqysrndf
mwjyhsufeqhwisju
srlrukoaenyevykt
tnpjtpwawrxbikct
geczalxmgxejulcv
tvkcbqdhmuwcxqci
tiovluvwezwwgaox
zrjhtbgajkjqzmfo
vcrywduwsklepirs
lofequdigsszuioy
wxsdzomkjqymlzat
iabaczqtrfbmypuy
ibdlmudbajikcncr
rqcvkzsbwmavdwnv
ypxoyjelhllhbeog
fdnszbkezyjbttbg
uxnhrldastpdjkdz
xfrjbehtxnlyzcka
omjyfhbibqwgcpbv
eguucnoxaoprszmp
xfpypldgcmcllyzz
aypnmgqjxjqceelv
mgzharymejlafvgf
tzowgwsubbaigdok
ilsehjqpcjwmylxc
pfmouwntfhfnmrwk
csgokybgdqwnduwp
eaxwvxvvwbrovypz
nmluqvobbbmdiwwb
lnkminvfjjzqbmio
mjiiqzycqdhfietz
towlrzriicyraevq
obiloewdvbrsfwjo
lmeooaajlthsfltw
ichygipzpykkesrw
gfysloxmqdsfskvt
saqzntehjldvwtsx
pqddoemaufpfcaew
mjrxvbvwcreaybwe
ngfbrwfqnxqosoai
nesyewxreiqvhald
kqhqdlquywotcyfy
liliptyoqujensfi
nsahsaxvaepzneqq
zaickulfjajhctye
gxjzahtgbgbabtht
koxbuopaqhlsyhrp
jhzejdjidqqtjnwe
dekrkdvprfqpcqki
linwlombdqtdeyop
dvckqqbnigdcmwmx
yaxygbjpzkvnnebv
rlzkdkgaagmcpxah
cfzuyxivtknirqvt
obivkajhsjnrxxhn
lmjhayymgpseuynn
bbjyewkwadaipyju
lmzyhwomfypoftuu
gtzhqlgltvatxack
jfflcfaqqkrrltgq
txoummmnzfrlrmcg
ohemsbfuqqpucups
imsfvowcbieotlok
tcnsnccdszxfcyde
qkcdtkwuaquajazz
arcfnhmdjezdbqku
srnocgyqrlcvlhkb
mppbzvfmcdirbyfw
xiuarktilpldwgwd
ypufwmhrvzqmexpc
itpdnsfkwgrdujmj
cmpxnodtsswkyxkr
wayyxtjklfrmvbfp
mfaxphcnjczhbbwy
sjxhgwdnqcofbdra
pnxmujuylqccjvjm
ivamtjbvairwjqwl
deijtmzgpfxrclss
bzkqcaqagsynlaer
tycefobvxcvwaulz
ctbhnywezxkdsswf
urrxxebxrthtjvib
fpfelcigwqwdjucv
ngfcyyqpqulwcphb
rltkzsiipkpzlgpw
qfdsymzwhqqdkykc
balrhhxipoqzmihj
rnwalxgigswxomga
ghqnxeogckshphgr
lyyaentdizaumnla
exriodwfzosbeoib
speswfggibijfejk
yxmxgfhvmshqszrq
hcqhngvahzgawjga
qmhlsrfpesmeksur
eviafjejygakodla
kvcfeiqhynqadbzv
fusvyhowslfzqttg
girqmvwmcvntrwau
yuavizroykfkdekz
jmcwohvmzvowrhxf
kzimlcpavapynfue
wjudcdtrewfabppq
yqpteuxqgbmqfgxh
xdgiszbuhdognniu
jsguxfwhpftlcjoh
whakkvspssgjzxre
ggvnvjurlyhhijgm
krvbhjybnpemeptr
pqedgfojyjybfbzr
jzhcrsgmnkwwtpdo
yyscxoxwofslncmp
gzjhnxytmyntzths
iteigbnqbtpvqumi
zjevfzusnjukqpfw
xippcyhkfuounxqk
mcnhrcfonfdgpkyh
pinkcyuhjkexbmzj
lotxrswlxbxlxufs
fmqajrtoabpckbnu
wfkwsgmcffdgaqxg
qfrsiwnohoyfbidr
czfqbsbmiuyusaqs
ieknnjeecucghpoo
cevdgqnugupvmsge
gjkajcyjnxdrtuvr
udzhrargnujxiclq
zqqrhhmjwermjssg
ggdivtmgoqajydzz
wnpfsgtxowkjiivl
afbhqawjbotxnqpd
xjpkifkhfjeqifdn
oyfggzsstfhvticp
kercaetahymeawxy
khphblhcgmbupmzt
iggoqtqpvaebtiol
ofknifysuasshoya
qxuewroccsbogrbv
apsbnbkiopopytgu
zyahfroovfjlythh
bxhjwfgeuxlviydq
uvbhdtvaypasaswa
qamcjzrmesqgqdiz
hjnjyzrxntiycyel
wkcrwqwniczwdxgq
hibxlvkqakusswkx
mzjyuenepwdgrkty
tvywsoqslfsulses
jqwcwuuisrclircv
xanwaoebfrzhurct
ykriratovsvxxasf
qyebvtqqxbjuuwuo
telrvlwvriylnder
acksrrptgnhkeiaa
yemwfjhiqlzsvdxf
banrornfkcymmkcc
ytbhxvaeiigjpcgm
crepyazgxquposkn
xlqwdrytzwnxzwzv
xtrbfbwopxscftps
kwbytzukgseeyjla
qtfdvavvjogybxjg
ytbmvmrcxwfkgvzw
nbscbdskdeocnfzr
sqquwjbdxsxhcseg
ewqxhigqcgszfsuw
cvkyfcyfmubzwsee
dcoawetekigxgygd
ohgqnqhfimyuqhvi
otisopzzpvnhctte
bauieohjejamzien
ewnnopzkujbvhwce
aeyqlskpaehagdiv
pncudvivwnnqspxy
ytugesilgveokxcg
zoidxeelqdjesxpr
ducjccsuaygfchzj
smhgllqqqcjfubfc
nlbyyywergronmir
prdawpbjhrzsbsvj
nmgzhnjhlpcplmui
eflaogtjghdjmxxz
qolvpngucbkprrdc
ixywxcienveltgho
mwnpqtocagenkxut
iskrfbwxonkguywx
ouhtbvcaczqzmpua
srewprgddfgmdbao
dyufrltacelchlvu
czmzcbrkecixuwzz
dtbeojcztzauofuk
prrgoehpqhngfgmw
baolzvfrrevxsyke
zqadgxshwiarkzwh
vsackherluvurqqj
surbpxdulvcvgjbd
wqxytarcxzgxhvtx
vbcubqvejcfsgrac
zqnjfeapshjowzja
hekvbhtainkvbynx
knnugxoktxpvoxnh
knoaalcefpgtvlwm
qoakaunowmsuvkus
ypkvlzcduzlezqcb
ujhcagawtyepyogh
wsilcrxncnffaxjf
gbbycjuscquaycrk
aduojapeaqwivnly
ceafyxrakviagcjy
nntajnghicgnrlst
vdodpeherjmmvbje
wyyhrnegblwvdobn
xlfurpghkpbzhhif
xyppnjiljvirmqjo
kglzqahipnddanpi
omjateouxikwxowr
ocifnoopfglmndcx
emudcukfbadyijev
ooktviixetfddfmh
wtvrhloyjewdeycg
cgjncqykgutfjhvb
nkwvpswppeffmwad
hqbcmfhzkxmnrivg
mdskbvzguxvieilr
anjcvqpavhdloaqh
erksespdevjylenq
fadxwbmisazyegup
iyuiffjmcaahowhj
ygkdezmynmltodbv
fytneukxqkjattvh
woerxfadbfrvdcnz
iwsljvkyfastccoa
movylhjranlorofe
drdmicdaiwukemep
knfgtsmuhfcvvshg
ibstpbevqmdlhajn
tstwsswswrxlzrqs
estyydmzothggudf
jezogwvymvikszwa
izmqcwdyggibliet
nzpxbegurwnwrnca
kzkojelnvkwfublh
xqcssgozuxfqtiwi
tcdoigumjrgvczfv
ikcjyubjmylkwlwq
kqfivwystpqzvhan
bzukgvyoqewniivj
iduapzclhhyfladn
fbpyzxdfmkrtfaeg
yzsmlbnftftgwadz
    """
