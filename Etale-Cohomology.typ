#set text(
  lang: "ja",
  font: ("CMU Serif", "Harano Aji Mincho"),
  size: 11pt
)
#set par(leading: 0.8em)
#show link: underline
#show link: set text(fill: blue)
#import "@preview/scienceicons:0.1.0": *
#import "@preview/hydra:0.6.2": hydra
#import "@preview/showybox:2.0.4": *
#import "@preview/fletcher:0.5.8": *
#let current-chapter = state("chapter", "")
#let bg-color = rgb("#ffffff")

#set page(
  fill: bg-color,
  numbering: "1 / 1",
  paper: "a4",
  header: context [
    #let page-num = counter(page).get().last()
    #if page-num > 1 [
      #rect(width: 100%, height: 100%, stroke: (bottom: 1pt))[
        #if calc.even(page-num) [
          // 偶数ページ: 左にChapter(1階層目)、中央にGitHub、右は空
          #grid(
            columns: (1fr, 1fr, 1fr),
            align(left)[#hydra(1, skip-starting: false)], 
            align(center)[#link("https://github.com/Riley719/Etale-Cohomology")[#github-icon() ノート置き場]],
            align(right)[]
          )
        ] else [
          // 奇数ページ: 左は空、中央にGitHub、右にSection(2階層目)
          #grid(
            columns: (1fr, 1fr, 1fr),
            align(left)[], 
            align(center)[#link("https://github.com/Riley719/Etale-Cohomology")[#github-icon() ノート置き場]],
            align(right)[#hydra(2, skip-starting: false)]
          )
        ]
      ]
    ]
  ],
  footer: context [
    #let page-num = counter(page).get().last()
    #if page-num > 1 [
      #rect(width: 100%, height: 100%, stroke: (top: 1pt))[
        #grid(
          columns: (1fr, 1fr, 1fr),
          align(left)[#link(<outline>)[目次へジャンプ]], 
          align(center)[#counter(page).display("— 1/1 —", both: true)],
          align(right)[\@Riley]
        )
      ]
    ]
  ]
)

#import "@preview/showybox:2.0.3": showybox

#let becausebox(body) = showybox(
  frame: (
    border-color: blue,
    radius: 8pt,
    thickness: 1pt,
  ),
  [
    // 本文の冒頭にアイコンをインラインで配置
    #box(baseline: 25%, circle(radius: 0.8em, stroke: 1pt + blue)[
      #set align(center + horizon)
      #text(fill: blue, size: 1.6em)[$because$]
    ])
    #h(0.1em) // アイコンと本文の間のスペース
    #body
  ]
)

#show heading.where(level: 1): it => {
    current-chapter.update(it.body)  // 状態を更新
    it  // 見出しをそのまま表示
}
#set par(justify: true)
#let title = "Étale Cohomology 入門スペシャル"
#show title: set align(center)
#show title: set text(weight: "black", size: 2em, font: ("CMU Serif", "Harano Aji Mincho"))
#let author = "Riley @Na2COOH_2"
#show author: set align(center)
#show author: set text(size: 1em, font: ("CMU Serif", "Harano Aji Mincho"))
#set heading(numbering: (..args) => {
  let nums = args.pos() // 引数の位置引数を`array`として取得
  if nums.len() == 1 { // 階層総数が1しかない、即ち最高階層
    return "Chapter " + numbering("I. ", ..nums)
  } else {
    return numbering("§ 1", ..nums.slice(1))
  }
})
#let heading_font(body) = {
  // font: (日本語文字を含まないフォント, 日本語文字を含むフォント)
  set text(font: ("CMU Serif", "Harano Aji Mincho"))
  body
}
#show heading: heading_font
#show strong: set text(font: ("CMU Serif", "Harano Aji Mincho"))
#import "@preview/rubby:0.10.2": get-ruby
#let ruby = get-ruby(
  size: 0.5em,         // Ruby font size
  dy: 0pt,             // Vertical offset of the ruby
  pos: top,            // Ruby position (top or bottom)
  alignment: "center", // Ruby alignment ("center", "start", "between", "around")
  delimiter: "|",      // The delimiter between words
  auto-spacing: true,  // Automatically add necessary space around words
)

#let Ker = "Ker"
#let Spec = "Spec"
#let ovl(math) = $overline(math)$
#let cong = $tilde.equiv$
#let Max = "Max"
#let Hom = "Hom"
#let ht = "ht"
#let coht = "coht" 
#let tensor = $times.o$
#let gldim = "gl.dim"
#let Der = "Der"
#let Reg = "Reg"
#set math.mat(delim: "[")
#let Etale = "Étale"
#let etale = "étale"
#let Psh = "Psh"
#let Sh = "Sh"
#let Sch = "Sch"
#let colim = math.op("colim", limits: true)
#let Cov = "Cov"

#import "@preview/statementsp:0.1.1": *
#show heading: reset-counter(statementnum, levels: 1)
#newstatementsp(
  box-name: "axiom",
  box-display: "Axiom",
  title-color: black,
  box-color: rgb("#FFCCCC")
)
#newstatementsp(
  box-name: "def",
  box-display: "Def",
  title-color: black,
  box-color: rgb("#FFCCCC")
)
#newstatementsp(
  box-name: "th",
  box-display: "Th",
  title-color: black,
  box-color: rgb("#B380FF")
)
#newstatementsp(
  box-name: "prop",
  box-display: "Prop",
  title-color: black,
  box-color: rgb("#CCCCFF")
)
#newstatementsp(
  box-name: "lem",
  box-display: "Lem",
  title-color: black,
  box-color: rgb("#CCCCFF")
)
#newstatementsp(
  box-name: "cor",
  box-display: "Cor",
  title-color: black,
  box-color: rgb("#CCCCFF")
)
#newstatementsp(
  box-name: "rem",
  box-display: "Rem",
  title-color: black,
  box-color: rgb("#FFFF99")
)
#newstatementsp(
  box-name: "ex",
  box-display: "Example",
  title-color: black,
  box-color: rgb("#CCCCCC")
)
#newstatementsp(
  box-name: "exer",
  box-display: "Exercise",
  title-color: black,
  box-color: rgb("#CCCCCC")
)

#let pfsp(
  title: "(" + text[$p r o o f$] + ")",
  body
) = [
  #title \ #body #h(1fr) $suit.spade.filled$
]

#title
#author

このノートは#Etale Cohomologyの定義とその性質をまとめるノートである。

#figure(
  image("Grothendieck.jpeg", width: 25em),
  numbering: none,
  caption: [A. Grothendieck \ https://csg.igrothendieck.org/photogallery/ より]
)

#figure(
  image("to-git.png", width: 25em),
  numbering: none,
  caption: [ノートのソース（GitHub） \ https://github.com/Na2COOH_2/Etale-Cohomology]
)

#pagebreak()

#show outline: set text(fill: blue)
#set outline.entry(
  fill: text(fill: black)[#repeat([$dot$], gap: 0.1em)]
)
#text(font: ("CMU Serif", "Harano Aji Mincho"), size: 2em, weight: "black")[目次#label("outline")]
#columns(2, gutter: 0em)[
  #outline(title: none, indent: 2em)
]

#pagebreak()

#heading(numbering: none)[概要]
Weil 予想の証明のためにGrothendieckが導入した#Etale Cohomologyの理論であるが，その定義に至るまでの道のりは長い。Sheaf, Scheme, Site, Site Cohomology, #Etale morphism, etc. といった道のりを踏む必要がある。さてこれを学習しようとすると参考文献が豊富ではある。EGA @Gro60, J.Milne @Mil80, Lei.Fu @Fu11, Stacks Project @SPAut18, など。しかし，#Etale Cohomologyの定義まで一直線に進む本は少ない。#Etale Cohomologyの応用が広いだけあって，定義に至るまでの古典理論の観察，ガロアコホモロジーとの比較のための準備，などなど。そこで，このノートは#Etale Cohomologyの定義までなるべく一直線に進むことを目指す。ただし，最低限必要な動機の確保のために，少しの余談は入るかもしれない。

#pagebreak()

= Site to Sheaf
このチャプターではSiteの定義から，それを用いたSheafの定義，および簡単な性質を述べる。普通Sheafといったら位相空間$X$の開集合系（を包含が大きい方に矢印を向けて圏とみなしたもの）から別の圏（例えばアーベル圏や環の圏）に向かう反変関手であって，張り合わせの条件を満たすものとして定義するだろう。幾何的な直感や歴史を踏まえるなどの教育的な流れとしては正解だが，どうせ#Etale Cohomologyを定義する段階で位相空間から逸脱したSite上の層を定式化しなおすことになる。したがって，まずはいきなりSiteを定義してしまう。

== Site

Siteとは，乱暴に言えば「圏の位相構造」を定式化したものだ。

#statementsp(
  box-name: "def",
  box-title: "Site",
  box-label: "site",
  number: true
)[
  $cal(X)$を圏とする。各$cal(X)$の対象$U$につき，とある$U$に射が向かうような射の族のあつまり$Cov(U)$が与えられているとする。つまり次のようである。
  $
  Cov(U) = { (U_i stretch(->)^(phi_i) U)_(i in I) | I in cal(I) }
  $
  集合ではないかもしれないが集合論的な操作は行わないのであまり気にしない。ただし次の条件を満たしているとする。

  + 任意の$U$に対して$V stretch(arrow.r.tilde)^phi U$:同型射のみをもつ集合${phi}$については${phi} in Cov(U)$
  + 任意の$U$と任意の${U_i -> U | i in I} in Cov(U)$に対して，もし各$i in I$につき \ ${U_(i j) -> U_i | j in J_i} in Cov(U_i)$があれば，${U_(i j) -> U | i in I, j in J_i} in Cov(U)$である。ただし$U_(i j) -> U_i -> U$という合成射を$U_(i j) -> U$と書いている。
  + 任意の$U$と任意の${U_i -> U | i in I} in Cov(U)$に対して，もし$V -> U$という射があれば，ファイバー積$U_i times_U V$が存在し，${U_i times_U V -> V | i in I} in Cov(V)$である。\ ただし$U_i times_U V -> V$はファイバー積の射影。

  $Cov(U)$の要素を$U$の*covering*とよぶ。圏$cal(X)$と，これらcoveringすべてのあつまり$(Cov(U))_U$の組$(cal(X), (Cov(U))_U)$を*Site*と呼ぶ。
]

そこまで酷いことは言っていない。次の例を見よう。クラシカルな位相空間の一般化のような概念であることがわかる。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofsite",
  number: true
)[
  $X$を位相空間，$"Op"(X)$を素の開集合系とする。$"Op"(X)$を$U subset V$であるときに限り$U -> V$という射があると思うことで圏をなす。$U in "Op"(X)$に対して$Cov(U)$を次のように定義する。
  $
    Cov(U) = { (U_i stretch(->)^(phi_i) U)_(i in I) mid(|) U = union.big_(i in I) U_i }
  $
  いわゆる$U$の被覆を全部集めることと等価なことをやっている。$"Op"(X)$のファイバー積とは$U_i times_U V = U_i inter V$である。これに注意すれば$("Op"(X), (Cov(U))_U)$はSiteの定義を満たすことがわかる。
]

以後，被覆が暗黙のうちにわかるときには単に圏$cal(X)$のことをSiteと呼ぶことにする。位相空間$X$というのと同じノリだ。

ちなみにSiteの概念はGrothendieckによる。日本語で「場所」という意味のフランス語である。Siteを定義するとこの先でCohomology論を展開することができる。最低限のCohomologyが備わった幾何ができる「場所」ということなんじゃないかと思う。

#Etale cohomologyの定義に至るまでの次のチャプターからの道筋を大雑把に述べる。

まず，Schemeを定義する。その後少しより道として，上で述べたようにSite上のCohomologyを展開できることを見る。次にSchemeの間の射が#Etale であることの定義をする。射が#Etale になっているようなSchemeの圏を上の$cal(X)$に相当するものとし，coveringは#Etale 射によって定義することになる。そしてこの件にもSiteの一般論からCohomology論を展開することができる。これが#Etale Cohomologyである。まとめると次の通り。

+ Schemeを定義
+ Site上のCohomologyを定義
+ #Etale 射を定義
+ #Etale 射をcoveringとするSiteを定義
+ #Etale SiteとしてのCohomology，すなわち#Etale Cohomologyを定義

ということである。SiteのCohomologyはScheme論とは独立に語られるが，Scheme論を通してSheafの扱いに慣れたほうがいいと思うのでこの順序で行く。

#pagebreak()

== Sheaves to locally ringed spaces
Schemeを定義したいが，それにはSheafが必要なのでそこを抑える。早速Sheafの定義を行いたいが，SheafとはPresheafのうち，張り合わせの条件という制約を設けたものをいうので，まずはPresheafの定義を行う。

#statementsp(
  box-name: "def",
  box-title: "Presheaf",
  box-label: "presheaf",
  number: true
)[
  $cal(X)$をSiteとする。ここで別に圏$cal(C)$をとる。
  
  Site $cal(X)$上の$cal(C)$に値をとる*Presheaf*とは，反変関手$cal(F) colon cal(X)^("op") -> cal(C)$のことである。
]

ラフに言えば，Site $cal(X)$上のPresheafとは$cal(X)$の対象$U$に対して，なにかしらの$cal(C)$の対象$cal(F)(U)$を割り当てる操作であり，$U -> V$なら$cal(F)(U) <- cal(F)(V)$という$cal(C)$の射が存在するということになる。向きに注意。ちなみにPresheafの定義だけなら$cal(X)$はもはやSiteである必要はない。単なる圏で十分である。わざわざcoveringを備えたSiteを定義したのはSheafの定義のためである。

この圏$cal(C)$としては，単に集合の圏をとることもあるし，アーベル圏をとることもある。Schemeのときには$cal(C)$は単位的可換環の圏をとることになる。

二つの$cal(X)$上のPresheaf $cal(F), cal(G)$の間の射というのを，自然変換$cal(F) -> cal(G)$のことであると定義する。これにより$cal(X)$上の圏$cal(C)$に値をとるPresheaf全体は圏をなすことになる。これを$Psh(cal(X), cal(C))$と書く。

次にSheafの定義を行う。

#statementsp(
  box-name: "def",
  box-title: "Sheaf",
  box-label: "sheaf",
  number: true
)[
  $cal(C)$を完備な圏とする。直積とイコライザが存在する圏を考えたいということ。
  
  Site $cal(X)$上の$cal(C)$に値をとる*Sheaf*とは，Presheaf $cal(F) in Psh(cal(X), cal(C))$という対象であって，任意の$U in cal(X)$とそのcovering $(U_i -> U)_(i in I)$に対して次の図式が圏$cal(C)$のイコライザの図式になるようなものである。

  #align(center, diagram({
	node((-1, -1), [$cal(F)(U)$])
	node((0, -1), [$product_(i in I) cal(F)(U_i)$])
	node((1, -1), [$product_(i,j in I) cal(F)(U_i times_U U_j)$])
	edge((-1, -1), (0, -1), "->")
	edge((0, -1), (1, -1), shift: 0.05, "->")
	edge((0, -1), (1, -1), shift: -0.05, "->")
  }))
]

$cal(C)$が具体圏，つまり集合の圏に向かう忘却関手が存在する場合には，この定義は次のように書き換えることができる。$cal(F)$がSheafであるとは，任意の$U in cal(X)$とそのcovering $(U_i -> U)_(i in I)$に対して，もし元のあつまり$(s_i)_(i in I)$で$s_i in cal(F)(U_i)$となっているもので$s_i|_(U_i times_U U_j) = s_j|_(U_i times_U U_j)$となるようなものがあれば，ある$s in cal(F)(U)$がただひとつ存在して，任意の$i$に対して$s|_(U_i) = s_i$となるようなものをとれる，となる。ここで$cal(X)$にて$U -> V$となっているとき，$cal(F)(V) -> cal(F)(U)$となるから$s in cal(F)(V)$をこの射で送って$cal(F)(U)$の元を得る。これを$s|_U$と書いている。とても抽象的で何言ってるかわからないと思うが，すぐあとの#linksp(<ex:exofsheaf>)で例を出すのでもう少し我慢しよう。

sheafの間の射はPresheafのときと同様に自然変換である。Sheaf全体も圏をなすことになる。これを$Sh(cal(X), cal(C))$と書く。

さて，schemeの定義に近づくため，次はringed spaceの定義を行う。

次の定義では位相空間$X$をとり，その上の開集合系$"Op"(X)$を#linksp(<ex:exofsite>)と同じ方法で圏とみなす。その圏上のSheafを$cal(O)_X$と書いている。

#statementsp(
  box-name: "def",
  box-title: "Ringed Space",
  box-label: "ringed-space",
  number: true
)[
  位相空間$X$とその上のSheaf $cal(O)_X$の組$(X, cal(O)_X)$が*ringed space*であるとは，任意の開集合$U$に対して$cal(O)_X (U)$が単位的可換環になるようなものである。
]
つまり，何も難しいことは無く，位相空間$X$の上の単位的可換環に値をもつSheafというだけの話である。#linksp(<def:sheaf>)において$cal(C)$として単位的可換環の圏をとっただけ。

次に，locally ringed spaceをやりたいが，その前にひとつだけringed spaceの例を出そう。この例こそがsheafの導入の動機であり，今後の幾何的直観を支える。のちのstalkの定義の動機のためにもやった方がいい。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofsheaf",
  number: true
)[
  $X = CC$を複素数とし，普通の位相を入れる。この上のsheaf $cal(O)_X$を次のように定める。
  $
  cal(O)_X (U) = { f : U -> CC | f"は"U"上の正則関数" }
  $
  値域の$CC$は環なのだから，自然な方法で$cal(O)_X (U)$も環になる。まずこれがPresheafなことはすぐにわかる。$U subset V$ならば$cal(O)_X (U) <- cal(O)_X (V)$という射として$f |-> f|_U$と，制限写像にするという射にするのである。次にSheafであることもわかる。$U = union.big_(i in I) U_i$と開被覆があって，$f_i in cal(O)_X (U_i)$であって，$f_i|_(U_i inter U_j) = f_j|_(U_i inter U_j)$となっているとする。すると，$f : U -> CC$を$f(z) = f_i (z)$と定めれば，これはwell-definedであるし，$f|_(U_i) = f_i$も満たす。さらにこのような$f$はただひとつしかない。正則関数なこともいいだろう。

  次のstalkの話につなげるために少しお話をする。任意に$x in X$という点を取ろう。正則関数を調べたいが，今取った$x in X$の周りについてだけ調べたいと考えよう。そこで，$x$を含む開集合$U$に対して$cal(O)_X (U)$を見ていくことになる。しかし，$U$だと大きすぎないだろうか？$U$よりもっと小さい開集合$x in V subset U$に取り換えて$cal(O)_X (V)$を調べてもいいはずだ。$V$では大きすぎないか？...と繰り返したい。そこで，いったん次のような集合を考える。
  $
    {(f, U) | x in U subset X, f in cal(O)_X (U)}
  $
  全部集めてしまえ，ということ。もちろん集めただけなので$x$の周りだけを見たいという要請にはまだ届いていない。ここで次のようにして上の集合に同値関係を入れる。
  $
    (f, U) tilde (g, V) :<=> exists W "s.t." x in W subset U inter V,  f|_W = g|_W
  $
  $W$は開集合。つまり，二つの正則関数は$x$の周りのある開集合で一致するなら同じものとみなす，ということ。これで同値関係を入れた集合を考えると，この集合は環になる。(和や積がwell-definedになる。)それをsheaf $cal(O)_X$の点$x$でのstalkといって
  $
    cal(O)_(X, x) = {(f, U) | x in U subset X, f in cal(O)_X (U)} \/ tilde
  $
  と書くのである。
]

ということでringed spaceに対してstalkを定義する。locally ringed spaceはこのstalkが局所環になるようなringed spaceのことであると定義されるのでstalkの話は回避できない。

#statementsp(
  box-name: "def",
  box-title: "stalk",
  box-label: "stalk",
  number: true
)[
  $(X, cal(O)_X)$をringed spaceとする。$x in X$を点とする。$cal(O)_X$のstalk $cal(O)_(X, x)$とは
  $
    cal(O)_(X, x) = colim_(x in U) cal(O)_X (U)
  $
  のことをいう。
]
$colim$といってるがどんな順極限なのかというと，圏において極限をとるときは共変関手を取って考えるので$cal(O)_X colon "Op"(X)^(op) -> "Ring"$という共変関手と思うと$U <-- V$という射があるとき，つまり$U subset V$のときに$cal(O)_X (U) -> cal(O)_X (V)$という射を考えることになる。このような射の族は順系をなす。というのは$cal(O)_X (U), cal(O)_X (V)$があったときに，とある$W$をとって$U,V --> W$かつ
$
  #align(center, diagram({
	node((0, -1), [$cal(O)_X (W)$])
	node((-1, -2), [$cal(O)_X (U)$])
	node((-1, 0), [$cal(O)_X (V)$])
	edge((-1, 0), (0, -1), "->")
	edge((-1, -2), (0, -1), "->")
  }))
$
という射を作れるからである。(矢印が向かっていく方を大きいと表現するとして)$U,V$より大きい$W$をとってより大きい$cal(O)_X (W)$をとれたので順系。具体的には$W = U inter V$とすればよい。

ちなみに逆系もなしているので逆極限をとることもできる。しかしそれはあまり意味をなさない。なぜならば$cal(O)_X (U), cal(O)_X (V)$に対して$cal(O)_X (X)$をとってしまえば$X --> U,V$かつ
$
  #align(center, diagram({
	node((0, -1), [$cal(O)_X (X)$])
	node((-1, -2), [$cal(O)_X (U)$])
	node((-1, 0), [$cal(O)_X (V)$])
	edge((-1, 0), (0, -1), "<-")
	edge((-1, -2), (0, -1), "<-")
  }))
$
となり，たしかに逆系をなす。一般に，逆有向添字圏による逆極限を考える際，最小元がある場合は，逆極限は最小元の添え字による対象と等しい。ちゃんと書くと，逆有向添字圏$I$から圏$cal(C)$への共変関手$cal(F) colon I -> cal(C)$によって極限をとることを考える。ただし$i_0 in I$であって，任意の$i in I$に対して$i_0 -> i$となるようなものがあるとする。すると，このとき逆極限$lim_(i in I) cal(F)$は$cal(F)(i_0)$と等しい。これは$cal(F)(i_0)$が逆極限の普遍性を満たすことを確かめれば示せる。

ところで，ringed spaceの間の射というものを定義する。ringed space $(X, cal(O)_X), (Y, cal(O)_Y)$の間の射とは，位相空間の間の連続写像$f colon X -> Y$と，sheafの間の射$f^sharp colon O_Y -> f_* cal(O)_X$の組$(f, f^sharp)$のことである。ここで$f_* cal(O)_X$は$cal(O)_X$を$f$でpush forwardしたものである。つまり，これは$Y$上のsheafであって，$U in "Op"(Y)$に対して$f_* cal(O)_X (U) = cal(O)_X (f^(-1)(U))$と定めるものである。これもちゃんとsheafになる。この$f^sharp$からstalkに誘導される射を作れる。つまり
$
  #align(center, diagram({
	node((-1, -1), [$display(colim_(f(x) in V) cal(O)_Y (V))$])
	node((-2, -2), [$cal(O)_Y (V)$])
	node((0, -2), [$cal(O)_Y (V')$])
	node((-1, 0), [$display(colim_(x in U) cal(O)_X (U))$])
	edge((-2, -2), (0, -2), "->")
	edge((-2, -2), (-1, -1), "->", bend: -24deg)
	edge((0, -2), (-1, -1), "->", bend: 24deg)
	edge((-1, -1), (-1, 0), "-->")
	edge((-2, -2), (-1, 0), "->", bend: -36deg)
	edge((0, -2), (-1, 0), "->", bend: 36deg)
  }))
$

という射を作れる。ただし$cal(O)_Y (V) -> colim cal(O)_X (U)$の部分は$f^sharp_V colon cal(O)_Y (V) -> f_* cal(O)_X (V)$のことである。これにより$cal(O)_(Y, f(x)) -> cal(O)_(X, x)$という射が得られる。

#statementsp(
  box-name: "def",
  box-title: "Locally Ringed Space",
  box-label: "locally-ring-space",
  number: true
)[
  $(X, cal(O)_X)$をringed spaceとする。任意の点$x in X$に対して，そのstalk $cal(O)_(X, x)$が局所環になるとき，$(X, cal(O)_X)$は*locally ringed space*であるという。

  stalk $cal(O)_(X, x)$の唯一の極大イデアルを$frak(m)_(X, x)$とかく。その剰余体を$k_X (x) = cal(O)_(X, x) \/ frak(m)_(X, x)$と書く。
]

Locally ringed spaceの間の射は単なるringed spaceの間の射ではない。ringed spaceの間の射であって，さらにstalkの間の射$cal(O)_(X, x) -> cal(O)_(Y, f(x))$が局所環の間の射になるようなものである。一般に局所環$(R, frak(m))$と$(S, frak(n))$の間の環準同型$phi colon R -> S$が局所環の射であるとは$phi(frak(m)) subset frak(n)$となるもののことを言う。

さて，これで準備が整った。Schemeの定義に入ることができる。

#pagebreak()

= Scheme

SchemeとはAffine Schemeを張り合わせたものである。Affine Schemeとは，locally ringed space $(X, cal(O)_X)$で，ある単位的可換環$A$があって，$(X, cal(O)_X) cong (Spec(A), cal(O)_(Spec(A)))$となるようなもののことである。ここで$Spec(A)$は単位的可換環$A$の素イデアルにZariski 位相を備えた位相空間であって，$cal(O)_(Spec A)$はその上のstructure sheafとよばれる特殊なsheafである。

= Affine Scheme
ということで，Schemeの定義をする前にAffine Schemeの定義をする必要がある。そのために，まず与えた単位的可換環$A$と$Spec(A)$からstructure sheafを定義する必要がある。まずは次の問題を解こう。ちなみに順に@AM69 の演習3.23, 演習3.24である。

#statementsp(
  box-name: "exer",
  box-title: "",
  box-label: "structure-sheaf",
  number: true
)[
  $A$を環とし，$X = Spec(A)$，$U$を$X$の基本開集合とする（すなわち，ある$f in A$によって$U = X_f$と表されるものである。第１章，演習問題17）。

  #enum(
    numbering: "i)",
    enum.item(1)[$U = X_f$としたとき，環$A(U) = A_f$は$U$のみに依存し，$f$には依存しないことを示せ。],
    enum.item(2)[$U' = X_g$を$U' subset.eq U$を満たす別の基本開集合とする。このとき，ある整数$n > 0$とある元$u in A$が存在して$g^n = u f$なる形の等式が成り立つことを示せ。これを用いて，$a\/f^m$に$a u^m\/g^(m n)$を対応させる準同型写像$rho colon A(U) --> A(U')$（すなわち，$A_f --> A_g$）が定義されることを示せ。さらに，$rho$は$U$と$U'$にのみ依存することを示せ。この準同型を*制限*準同型写像(restriction homomorphism)という。],
    enum.item(3)[$U = U'$のとき，$rho$は恒等写像であることを示せ。],
    enum.item(4)[$U supset.eq U' supset.eq U''$を$X$における基本開集合とするとき，次の図式は可換であることを示せ（この図で矢印は制限準同型写像を表す）。
    $
      #align(center, diagram({
        node((-1, -1), [$A(U)$])
        node((1, -1), [$A(U'')$])
        node((0, 0), [$A(U')$])
        edge((-1, -1), (0, 0), "->")
        edge((-1, -1), (1, -1), "->")
        edge((0, 0), (1, -1), "->")
      }))
    $
    ],
    enum.item(5)[$x (= frak(p))$を$X$の点とする。このとき，次の同型が成り立つことを示せ。
    $
      colim_(U in.rev x) A(U) cong A_frak(p)
    $
    ]
  )

  $X$の任意の基本開集合$U$に対する環$A(U)$と，上の条件iii)とiv)を満たす制限準同型写像$rho$を定めることにより，基本開集合$(X_f)_(f in A)$上の環の*前層*(presheaf)が構成される。v)は，$x in X$におけるこの前層の茎(stalk)が対応している局所環$A_frak(p)$であることを述べている。
]
（解答）

i) $U = X_f = X_g$となっているとして$A_f cong A_g$を示せばいい。$f$が$A_g$の単元であることを示そう。任意に$A_g$の極大イデアル$frak(m)$をとる。$A$の極大イデアルで$g in.not frak(m)$となるものをとることと等価である。よって$frak(m) in X_g = X_f$なので$f in.not frak(m)$である。$f$は$A_g$のどのような極大イデアルにも含まれないので$A_g$の単元である。ここで$f/1 dot.c a/g^m = 1/1$なる$a/g^m$が存在するということになる。(これを整理すると$g^n = f u$となる$n>0$と$u in A$がとれる。)よって$A_f$に関する局所環の普遍性によって$A_f --> A_g colon x/f^l mapsto.long x/1 dot.c (a/g^m)^l$という準同型が一意的に定まる。$f,g$を入れ替えてもいいから$A_g --> A_f colon x'/g^l' mapsto.long x'/1 dot.c (a'/f^m')^l'$という準同型も一意的に定まる。$A_f --> A_g --> A_f$という合成を考えられるが，これも普遍性から一意的で，それは恒等写像でなければならない。ゆえに定めた準同型は同型であった。

ii) すでにi)で示した。制限写像の非依存性は次の図式の可換性を示せという意味だろうが，それは普遍性から明らか。
$
  #align(center, diagram({
	node((-1, 0), [$A_f$])
	node((0, 0), [$A_g$])
	node((-1, 1), [$A_f'$])
	node((0, 1), [$A_g'$])
	edge((-1, 0), (0, 0), [$rho$], label-side: left, "->")
	edge((-1, 1), (0, 1), [$rho$], label-side: right, "->")
	edge((-1, 0), (-1, 1), [$"isom"$], label-side: right, "->")
	edge((0, 0), (0, 1), [$"isom"$], label-side: left, "->")
  }))
$

iii) i)と等価。

iv) 普遍性から明らか。

v) 気持ちとしては，順極限は和集合みたいなもので$U in.rev x$つまり$f in.not frak(p)$なるものに対して$A_f$のすべての和集合をとりなさい，と言ってるようなものなので$A_frak(p)$に等しくなりそうなものである。しっかり示すため$A_frak(p)$が順極限の普遍性を満たすことを示す。まず，$A(U) = A_f --> A_frak(p) colon x/f^l mapsto.long x/f^l$という射を作れる。$f$が$A_frak(p)$の中の単元であるからである。iv)と同じように考えて次の図式を得る。
$
  #align(center, diagram({
	node((0, -1), [$A_frak(p)$])
	node((-1, -2), [$A_f$])
	node((1, -2), [$A_g$])
	edge((-1, -2), (1, -2), "->")
	edge((-1, -2), (0, -1), "->", bend: -18deg)
	edge((1, -2), (0, -1), "->", bend: 18deg)
  }))
$
この図式の$A_frak(p)$の部分に別の環$B$があって，それも図式になる場合，次の点線のような射であって他囲まれる部分を可換にするようなものがただ一つ作れる。
$
  #align(center, diagram({
	node((0, -1), [$A_frak(p)$])
	node((-1, -2), [$A_f$])
	node((1, -2), [$A_g$])
	node((0, 0), [$B$])
	edge((-1, -2), (1, -2), "->")
	edge((-1, -2), (0, -1), "->", bend: -18deg)
	edge((1, -2), (0, -1), "->", bend: 18deg)
	edge((-1, -2), (0, 0), "->", bend: -18deg)
	edge((1, -2), (0, 0), "->", bend: 18deg)
	edge((0, -1), (0, 0), "-->")
  }))
$
どのようにするかというと，$a/s in A_frak(p)$に対して，$A_s$を考えて，その中で$a/s$を考えることができるがその元を$B$に送った先を考える。それを$a/s$の像とする。これがwell-definedであることや可換性，一意性は簡単に示せる。これで$A_frak(p)$が順極限の普遍性を満たすことが示された。ゆえに$A_frak(p) cong colim_(U in.rev x) A(U)$が示された。

（解答終わり）

Ati-Macが言ってるように，これは$X = Spec(A)$の基本開集合$X_f = D(f) = {frak(p) in Spec(A) | f in.not frak(p)}$に対して$A_f$という環を割り当てる操作で，前層が定まっているということになる。つまり
$
  cal(O)_X colon "Op"(X)^(op) -> "Ring" colon D(f) mapsto A_f
$
ということになる。この対応は大変重要なので覚えるべき。また，Zariski 開集合は$D(f)$以外にもあるが，それは対応先はどうするのか，という話になる。(例えば$CC[x,y]$の$Spec$の開集合$Spec(CC[x,y] \\ {(x,y)})$は$D(f)$の形で表せない。) 実は基本開集合の対応で前層を定められれば，次のようにして前層を定めることができる。
$
  cal(O)_X (U) = lim_(D(f) subset U) A_f
$
極限は逆極限。(実は層でも同じことがいえる。)

次の問題に移る。

#statementsp(
  box-name: "exer",
  box-title: "",
  box-label: "",
  number: true
)[
  演習問題23の前層は次のような性質を持つことを示せ。「$(U_i)_(i in I)$を基本開集合による$X$の被覆とする。任意の$i in I$に対して，$s_i in A(U_i)$を次のような条件を満たすものとする。すなわち，任意の添字の組$i,j$に対して$s_i$と$s_j$の$A(U_i inter U_j)$への像が一致しているものとする。このとき，すべての$i in I$に対して$A(U_i)$における像が$s_i$となる元$s in A (= A(X))$が唯一つ存在する（これは本質的に前層が*層*(sheaf)であることを意味している）。」
]

（解答）

$X$はコンパクトなのと，共通部分で一致しているということからはじめから$I$は有限集合としていい。$U_i = D(f_i)$とする。$s_i in A(U_i) = A_(f_i)$であるから，ある整数$n_i > 0$とある元$a_i in A$が存在して$s_i = a_i / f_i^(n_i)$となる。$s_i$と$s_j$の像が一致しているということは，ある整数$n_(i j) > 0$とある元$a_(i j) in A$が存在して

#pagebreak()

#set text(lang: "en")
#bibliography(
  "ref.bib",
  title: "参考文献",
  style: "alpha.csl"
)