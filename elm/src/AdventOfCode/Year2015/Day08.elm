module AdventOfCode.Year2015.Day08 exposing
    ( countStringCharacters
    , countTotalCharacters
    , rawInput
    , run
    )

-- MODEL


type alias Model =
    { totalCharacters : Int
    , stringCharacters : Int
    }


initialModel : Model
initialModel =
    { totalCharacters = 0
    , stringCharacters = 0
    }



-- RUN


run : String -> Int
run =
    processInput
        >> processLines initialModel
        >> getResult


getResult : Model -> Int
getResult model =
    model.totalCharacters - model.stringCharacters



-- PROCESS INPUT


processInput : String -> List String
processInput =
    String.trim
        >> String.lines



-- PROCESS LINES


processLines : Model -> List String -> Model
processLines model =
    List.foldl processLine model


processLine : String -> Model -> Model
processLine line model =
    { model
        | totalCharacters = countTotalCharacters line
        , stringCharacters = countStringCharacters line
    }



-- COUNT


countTotalCharacters : String -> Int
countTotalCharacters string =
    let
        quotationMarks =
            2

        stringLength =
            String.length string

        escapeCharacters =
            countEscapeCharacters string
    in
    stringLength + quotationMarks + escapeCharacters


countEscapeCharacters : String -> Int
countEscapeCharacters string =
    let
        backslashes =
            string
                |> String.indexes "\\"
                |> List.length

        doubleQuotes =
            string
                |> String.indexes "\""
                |> List.length
    in
    backslashes + doubleQuotes


countStringCharacters : String -> Int
countStringCharacters =
    String.length



-- INPUT


rawInput : String
rawInput =
    """
"ઋr\u{008B}jr""
"nq"
"zjrfcpbktjmrzgszÊqsc\u{0003}n"huqab"
"daz\\zyyxddpwk"
"draes¢n\\gɾk"lj"\\viqych"
"nnx\\krnrfomdnt/lblÒxpo"cp"k"
"kwdaapalq"
"u"ptk"
"ckhorczuiudfjmmcc\\u"wozqxibsfjma"
"ydctdrxat"pd"lwi"bjesevfwè"
"v"¨rrzep""r"
"nbydghkfvmq\\à"lfsrsvlsj"ialiif"
"jsas"u"
"odipikxlo"
""rnubsgwltqkbsu"pcpcs"
"eitk\\f\\mhcqqoym\\ji"
"vnedc"
""lhcaurdqzyjyu"
"haxzsa"zcn"y"foclgtjfcnv"mhkrc"
""eoeggg"tmiydvcay"vfavc"
"snqvyqoncwxcvwbdktoywch"
"rnfgjsyrÕwacy"
"ik"hebrpvsts"
"txw"
"\u{0015}pxtdkogd"urbm"gevhh"nxr>rxtk"
"cetqtcy"
"inleep\\mgl"
"uflwbxvww,xzezqnaply"yh"qlllzk"
"eepak"xqtedzt"
"naaqzfieafvyrsnwkssznohjmc"
"yceaonylzÁ\\jrlbbkzwsidfi"
"ybqafngkcqpbp"
"¯t"
"yidjpaobqydso"
"ju\\ldxig\\lrdrhjcmmwrc"
"tylacqeslnwjҍs"tjxa"
"efbfm"
"\\fxkgoprgdcjgyajykg\\dtbrz"
"eujvva"
"hެwfpikme\\vwthyvrqdnx""
"rbpbrxm\\\"\"\"voxx"
"ykiw"tkb\\lforu"rsf\\tf"x"rqti"
"e\\whݺqeugiq\\ihhfqfuaij"
"g"t\\o"
"nxzo"hf\\xp"
"dxiaqfoê"
"kali\\zczhiqkqzybjj"fgdjnik"
"zdkgrqmdv"
"bimxim¶lrwsaj"ui"a"
""rrznitibgx\\olpsjmjqzctxaubdifsq"
"zb"khzixaacmhuzmlymoformipdzml"
"qfwi"
"hjwsxfpphttjy""zixais»lgnqfto"
"puj\\qmyu"nqgaqfthbwjokbmrpbhpi"
"cyxdpkh\\""
"q"
"m"
"tbxdzzllarlo"
"gbtys"
"gytilk\\vlqxvcuutjunrqc"
"uugkvcuzan\\eyhb"
"yaxr"genlbgw"\\uc"
"nrgecjeip\\sjdvgqaqxwsqactopu"
"pu"r"txpyrkfny\\zmwfneyvwmnkkdipv"
"jm\u{0A3B}hwvq"
"qxojmnml"w\u{009A}irr"
"xbzsuihs\u{4DCED}y¬lrhgii\\""
"drgjirusrekrwmvxllwdm"
"(hfxnfpycmpnkku"csufªrxlqyg"x"
""zvz\\rmg"\\sxxoifffyqfyn"iq"ps"
""z"
"zbwkmk"sgzos\u{0093}gtc""
"bvm⢪\\\\"pywuhaniox\\z\\hbp×mold"
"aszgvsyna"
"qf"vdwuss"
"lnohni"qwiacjsjegstlbfq\\kyjhyd"
"c\\naawulxlqplnacvytspryõytxxqq"
"razwqmsqgbaaxcd\\f"
"radggyrjrg"zx"
""pu\u{0011}t\\ajcjuieinlkvya"
"veggiskh"
"eglfhjxiet"kouqfskwsy"hpthsldel"
"mvఛ"f\\shrssnjwcpmurepdxdlcj"
"dlayjd"suvzotgdtc"
"©pvxeopn"
"lpplsaxy"oiwaq"
"hqwh\\lusv"
"hykykwlx"ਗ਼tkgh\\d\u{63DFF}"
"vfktanpjy"xxetc"
"dnhwkgjnsmsswfuelvihvjl"jtf"
"x"dwvzra"nbbsewftehczgbvfzd"rau"
"csfi"mzejnjqkqupwadrgti"von"
"xckf÷xsm\\pgvlpetjndpyblais\\z"
"yecyouj\u{058B}wpgeuiw"mdu"
"fgb"
"c\\lxϯthet\u{0FDE}lgvwvpem"
"kgyrmarvfwjinlowt"
"yzte"
"vc"z"
"sxevqfzmmdwsuu""
"fxbaercmcy¶md"
"f"
"mDgqbcppho\\b"
"gtafrWm\u{0011}jy""erwmmpiwjkbckuw"
"ufdjt"kssprzxqixzxmqXq"
"yzbyo"lfdbyaxexyfbnyv\\èxmre"
"uCntr\\\\byyfjr"iveujvnwsqbnpuvrta"
"us\u{F6BA}i"
"c\\edh"
"tzckolphexfq\\#\u{0FBD}qv\\"m"
"yjafhbvhhj\u{001B}"bplb"
""o"
"rubahvmp""
"qmkukrnrmqumh"
"wdpxyvyidhwjf\\nabbijwhr\u{0C5B}ksvy"p"
"u"prlpg""
"nsvcquyxbwilsxxemfÙleq"
"yÎtxuafl"
"it"
"kwdlysf\\xjpelae"
"viwhXwpjjlnvryuti,hngrx\\nhtkui"
"vhn\u{009E}hreÃncsqbozms"nl"
"ytc£mgeeogjcqavmmmd"
"xzlexlitseozoxtpzzutfq"
"cish\u{0007}lmovj"
"ekbflwqzaiivdr"pq\\azrfbntqwkn"
"uc"xdbegmlmhksofzohavtrnxf"
"xfdnrdqdrcjzbe"
"ndg"ckgrpisib"rg"p\\lmpfzlssnvk"
"witfjwpbyyzlop"
"zonlww"emrbcsgdtrg"rjzydzqntlw"
"dvgb"zn\\vrbzema"ckmd"
"\\vdlmxhlvldk"pmzazeip"
\"\"\"r"
"rsntinv"
"iy"
"lr⃯h"
"csgexlb"zqdavlxxhtdbh""\u{000F}kpvhiphm"
"ouwhp"ogbft"
"cm\\ckltng"dw\u{008B}rf༎ppgckd"
"zmnlsgalhpkejsizfsbtnfliu"nhc"
"pnrkaayqvwpdjbhcrbb"yfeq"aq"
"ozh\\hoxow,srtr\\r""
"bqxabj"u\\s"
"cpsjti"gy"
"aa"p\\nki\\ajijkqev"
"q""lfdentjgd\\"
"bmokvpoebutfki"
"pielvcbne\u{F6EF}vzxn"
"kx"
"zlgmqagcrbhrwtwtmmg"
"aiyhmntcqjbpvµhhswxbryoedvos"
"tdpaxrb"
"fu"}ttkyvhrlwko"
"oirc\\"cqlnqffjqt\\k"
"edxlia\\tcyby"
"jpeybgwfayerfrfbvfog"ol"
"ysr"
"bzwzilgwfugjk"
"tlccunukvwjgftetjcs૬wc"
"dsqssa"vzrf"sewbp\\ahhlmhbeihlh"
"qtgmjck"n"guki"gmdivwqxismqj"
""f"
"wuorvlovucngbzdszqpikyk"
"dfrdsacoukmgvhbq""iwto"
""ey"ch\\wcgioe\\"ouvligmsw"
"ciqlszzgs"
"\\tzyrkaoi"sopjaq"
"lmtnv"
"ar"fqoroigiertjjlm"ymgi\\kkjewsxd"
"wehcimlvudpxtamdn"rwy"
"hr"zvrwthr"vruzqfrldn"b"
"sggekodkiwvym"mhsco"
"ltlkfbrrdvk\\"
"uut"sfjnz"\\ef"
"hxilg\\"
"zsredsiwlzrpedibn"
"vtfi"
"\\h"
"qekfrcöwduodbwrguqcng\\n"
""lljlfdrxftwidn\\pkvÙij"
"mrvgqynpehkliuijlpp"
"gikjph"
"yoxcdrdt"wbaurnyhoyxoihu"
"onmomwuxuammbzxe"
"rnrr\\twvizagqaljr\u{000D}mtw"
"r"vupaoi"
"l"
"sei"
"jwxtdtbkd\\kxd"
""v\\"
"ahd"
"j"bjqxs"
"\\i$gglxub\\nzsajokt"
"lviwpu"uxdlh\\zuy"xqy"ytdzlx"r"
"kptfmys"
"fwxzikfhczkjwyjszqdbkepaeellc"
"nlqpsvbrbd\\ns"
"qryuwkjiodw""vaqyq"dmyifm"
"tw\u{0015}kdmaudjl\\zorhp"alwh"
"aatrvczesykekkjfyb"kb"
"usqcutbqbxxhucwxoÁltb"j"bghjcvws"
"ilhsrnzxkz"
"bianqfdfdhvw"
"hqibqszx"qoxqoaqtcsz"
"htxtoojbbauztwxuiq\\ngyfy\\obzc"
"rxn\\moxlj"
"mtusࡎrh"dbe"
"asxPhuvsitcxadt"
""bugggtnrc""kl"hmpu\u{0083}hqrvhpo"
"ewisbp""vuzf\\w_valszdhl"
"scusplpwxfnxuW"zynpn\u{0099}xerc\\ri"
"m\\kinmkke\u{000C}l"
"xhuzit߽"
"kfbo\u{0004}Pruqirn"
"t""xpbdscmdoug"
"punvpsgnbgyxe"sptmpz"
"bxukkazijr"
"nxyrcdaoo"rjkk"wntehcvcip"vrd"
"rdpvqskmihqaw"
"p\\gwdhtqnpgthod"
"nwnuf""yebycearom"nqym"ÔsiiÌle"
"alda"ptspo"wkkv"zoi"hkb"vnntyd"
"ixpgpfzbqv"
"znui"\\fzn\u{0003}qozabh"rva"pvg"
"e"zswmwuk"
"hcccygwfa"
"ngmace\\rtyllolr"ڋw"
"\\c"jyufbry"ryo"xpo⛬ninfeckh\\s"
"hdnpngtuc"dzbvvosn̟wtpzbrt"
"hesbpdÔ"
"dsdbstuzrdfmrnyntufs"dmv"
"dîibcwhcvkt"
"fvzwrsfjdqdmy""v"
"ns"dqafz\\lkyoflnazv"mn7"o"yj"e"
"dypilgbwzccayxa"bnmuernx"
"q©ztqrhreb""kxfeyodqb"
"iz¥qjxqulaawuwz"rqmpcj\\yel"
"z"\\pq""ygzpjtn"
"ifxqvivp"kiiftdoe"
"jxzebj"5"qr"ecglcutuoyywqumcs"kk"
"q"
"yob\u{0085}qmpuwexptczbkrl"
"cjiavv"uudpozvibyycnmxhxpxmpjoz"
"xro\\uiqyrcid"
"nod\\k"
"d"neiec"
"tqyrqvwyvmz\\pzgzzcqsqsrgbqbtapoz"
"r"xvocpeuxfxslgueb\u{0005}kzyyie"aoec"
""du\\uirlhcbgv\\cjqhfreqnvn"
"zp\u{0004}\u{0015}"pbjwhrjtmiba"
"\\cv""
"k"rwnb\\hiu"rqd"rc\\nyakrhly"
"klrmafjzandiddodgz"
"xipzhqzhvlpykzcuppx"
"zdvrvnÐmtfvpylbn\\\\sxcznrzugwznl"
"ody\\pvm"kpjiudzhxazirgxzvumeat"o"
"kllvhdp"prjikzrrc"adgpegc\\"gk"
"sqtpug벪uxaamw"
"wegxxrrxdvpivrqievfeokmnojsk"
"\\bo"
"gijhz"
"ylowluvabwrigssdgtxdwsiorxevÝ"
\"\"\"
"ghnsrnsqtxpygikahkrl"
""rcfqkbjf"sgxg"vnd\\rotn"
"ap"smgsuexjrbuqs"mpbstogj"x"
"koaunz\\sgt"opv"
"yialiuzwix"
"yp"ndxgwzml"bt"
"lpcjxmggfsy\\szbxccarjkqzasqkb\u{0CFD}\u{000C}"
"x"
"mgakc"
"vjieunohܿjwx"
"erbvv"qulsd"
"mimycrbfhqkarmz"
"tihfbgcszuej"cûvoqskkhbgpaddioo"
"mziavkwrmekriqghw"
"izk\\tnjd\\ed\\emokvjoc"
"c"nhbqzndro\\g"
"usfngdo"
"aypljdftvptt"
"ym"afvqௌ"
"zabi"wjpvugwhl"
"ebvptcjqjhc"n"p"dxrphegr\\"
"mzlqqxokhyeÙ\\rffhnzs"
"hnipqknwpsjakanuewe"
"rqgbfcjdrmiz"h"
"kzzp\\z\\txmkwaouxictybwx"
"yzmspjkqrteiydswlvb"
"gjpxklgpzv"txri\\hotpuiukzzzd"
"p"rxergtbsxmjmkeeqwvoagnki""
"santipvuiq"
""ihjqlhtwbuy"hdkiv"mtiqacnf\\"
"oliaggtqyyx"
"fwwnpmbb"
"yrtdrieazfxyyneo"
"nywbv\\"
"twc\\ehfqxhgomgrgwpxyzmnkioj"
"qludrkkvljljd\\xvdeumN"
    """
