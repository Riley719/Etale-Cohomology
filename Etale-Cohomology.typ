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
#import "@preview/cetz:0.3.2"
#import "@preview/cetz-plot:0.1.1": plot
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
#let AffSch = "AffSch"
#let Sch = "Sch"
#let colim = math.op("colim", limits: true)
#let Cov = "Cov"
#let Supp = "Supp"

#import "statementsp.typ": *
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

次の補題は開集合に対してSheafとしての行き先が定まっていたら，それを一意的にすべての開集合に伸ばしてSheafにすることを保証するものである。@SPAut18 の#link("https://stacks.math.columbia.edu/tag/009N")[009N]を参照。

#statementsp(
  box-name: "lem",
  box-title: "",
  box-label: "openbasis",
  number: true
)[
  $X$を位相空間，$"Op"(X)$をその開集合系，$cal(B)$をとある開基とする。次のように$cal(B)$上の圏$cal(C)$に値をとる層$cal(F)$が定まっていたとする。
  $
    cal(F) : cal(B)^(op) -> cal(C) : U |-> cal(F)(U)
  $
  このとき，$cal(F)$を$"Op"(X)$上のSheafに一意的に伸ばすことができる。つまり，$X$上の層
  $
    cal(F)^("ext") : "Op"(X)^(op) -> cal(C) : U |-> cal(F)^("ext")(U)
  $
  であって，任意の$U in cal(B)$に対して$cal(F)^("ext")(U) cong cal(F)(U)$となるようなものがただひとつ存在する。
]
#pfsp[
  二通りで示す。

  (１つ目:右KAN拡張による定義)\
  KAN拡張については#link("https://alg-d.com/math/kan_extension/kan_extension.pdf")[alg-dのPDF]を参照。\
  次の図式を考える。
  $
    #align(center, diagram({
      node((-1, 0), [$"Op"(X)^("op")$])
      node((-1, 1), [$cal(B)^("op")$])
      node((0, 1), [$cal(C)$])
      edge((-1, 1), (-1, 0), [$i^("op")$], label-side: left, "->")
      edge((-1, 1), (0, 1), [$cal(F)$], label-side: right, "->")
      edge((-1, 0), (0, 1), [$exists cal(F)^("ext")$], label-side: left, "->")
    }))
  $
  $"Op"(X)$や$cal(B)$は小圏なので$i^("op")$に沿った$cal(F)$の右KAN拡張$cal(F)^("ext")$が図式のように存在する。こうしてPreSheafを得た。Sheafの条件は開基だけで判定できるのでこれはSheafである。(具体的な表示，つまり$cal(F)^("ext")(U)$がどうなっているのかは各点右KAN拡張で計算でき，頑張ると2通り目と同じとわかる。)

  (二つ目:直接定義)\
  次のように定める。
  $
    cal(F)^("ext")(U) = lim_(V subset U, V in cal(B)) cal(F)(V)
  $
  index categoryは小圏だからこれは存在する。これがPreSheafになることは極限の普遍性などからよい。貼り合わせの条件を確認する。$"Eq"$は中身の図式のイコライザを表す。適当に$U$の被覆があったとして次の図式の計算ができる。
  $
    "Eq"(product_(i in I) cal(F)^("ext")(U_i) arrows.rr product_(i,j in I) cal(F)^("ext")(U_i inter U_j)) \
    "Eq"(product_(i in I) lim_(V subset U_i, V in cal(B)) cal(F)(V) arrows.rr product_(i,j in I) lim_(U_i inter U_j subset W, W in cal(B)) cal(F)(W)) \
    lim_(V subset U)"Eq"(product_(i in I) cal(F)(U_i inter V) arrows.rr product_(i,j in I) cal(F)(U_i inter U_j inter V))
  $
  ただし，最後の式変形は小圏による極限同士の交換ができることを用いた。詳しくは@松田24 の命題3.9.1を参照。最後の式は$U_i inter V$などのさらに細かい開基による被覆を考えてもいいから，結局
  $
    lim_(V subset U, V in cal(B)) cal(F)(V) = cal(F)^("ext")(U)
  $
  となり，冒頭述べた対応はSheafをなす。
]

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

= Schemes

SchemeとはAffine Schemeを貼り合わせたものである。Affine Schemeとは，locally ringed space $(X, cal(O)_X)$で，ある単位的可換環$A$があって，$(X, cal(O)_X) cong (Spec(A), cal(O)_(Spec(A)))$となるようなもののことである。ここで$Spec(A)$は単位的可換環$A$の素イデアルにZariski 位相を備えた位相空間であって，$cal(O)_(Spec A)$はその上のstructure sheafとよばれる特殊なsheafである。

== Affine Schemes
ということで，Schemeの定義をする前にAffine Schemeの定義をする必要がある。そのために，まず与えた単位的可換環$A$と$Spec(A)$からstructure sheafを定義する必要がある。まずは次の問題を解こう。ちなみに順に@AM69 の演習3.23, 演習3.24である。ちなみに環$A$に対して
$
  D(f) = { frak(p) in Spec(A) | f in.not frak(p) }
$
を基本開集合，principal open subset，standard open subsetなどと呼ぶ。

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

$X$はコンパクトなのと，共通部分で一致しているということからはじめから$I$は有限集合としていい。$U_i = D(f_i)$とする。まず一意性を示す。$s,t in A$であって$s/1 = t/1 in A_(f_i)$であるとすると，$f_i^N_i (s -t) = 0$となる$N_i$をとれる。$N = max{N_i}$とおく。ここで$(f_1, dots, f_n) = A$だから$(f_1^N, dots, f_n^N) = A$でもある。ゆえに
$
  1 = a_1 f_1^N + dots + a_n f_n^N
$
となる$a_i in A$がとれる。これの両辺に$s-t$をかければ$s=t$を得る。\
次に存在を示す。$s_i = h_i / f_i^m_i in A_f_i$とかける。添え字$I$は有限集合なので通分して$s_i = h_i / f_i^m$と，分母は$i$に依存しないとしていい。$s_i = s_j in A_(f_i f_j)$なので，$(f_i f_j)^(K_(i j)) (h_i f_i^m - h_j f_j^m) = 0$とできる。再び有限性から$K_(i j)$は$i j$によらない$K$としてよい。これで整理すると$h_i f_i^K f_j^(m + K) = h_j f_j^K f_i^(m + K)$となる。$x_i = h_i f_i^K, tilde(m) = m + K$とおく。$x_i f_j^tilde(m) = x_j f_i^tilde(m)$に注意。ここで
$
  1 = sum_(i=1)^n c_i f_i^(tilde(m))
$
と表示できる。
$
  s = sum_(i=1)^n c_i x_i
$
とおく。これが求める元であることを示す。両辺に$f_j^tilde(m)$をかけて
$
  s f_j^tilde(m) = sum_(i=1)^n c_i x_i f_j^tilde(m) = sum_(i=1)^n c_i x_j f_i^tilde(m) = x_j = h_j f_j^K
$
ゆえにこの式を$A_f_i$で見れば
$
  s/1 = (h_j f_j^K) / f_j^tilde(m) = h_j / f_j^m = s_j
$
となり$s$は目的を満たす$A$の元である。

（解答終わり）

#linksp(<lem:openbasis>)に注意してまとめると次のようである。

#statementsp(
  box-name: "def",
  box-title: "Affine Scheme",
  box-label: "affine",
  number: true
)[
  単位的可換環$A$とZariski位相を備えた素イデアルの集合$X = Spec(A)$は
  $
    cal(O)_X colon "Op"(X)^(op) --> "Ring" colon U mapsto.long lim_(D(f) subset U) A_f
  $
  という割り当てでsheafをなす。特に基本開集合については$D(f) mapsto.long A_f$という割り当てである。このとき$X$の点$frak(p) in X$におけるstalkは$A_frak(p)$という局所環になる。つまりlocally ringed space $(X, cal(O)_X)$を得た。

  逆に，与えたlocally ringed space $(X, cal(O)_X)$が，とある環をとって$(Spec(A), cal(O)_Spec(A))$とlocally ringed spaceとして同型になるとき，$(X, cal(O)_X)$を*Affine Scheme*と呼ぶ。このときの$cal(O)_X$は*structure sheaf*と呼ばれる。
]

これにより，対象はAffine Schemeであって射はAffine Schemeの間のlocally ringed spaceの射である圏が得られる。これを$AffSch$と書くことにする。

#statementsp(
  box-name: "rem",
  box-title: "Affine Schemeの別の定義",
  box-label: "affine2",
  number: true
)[
  今回は構造ベースで定義を進めた。@Har77 では別の定義をしている。次のようである。$X = Spec(A)$である。
  $
    cal(O)_X (U) = {s : U -> product.co A_frak(p) | &forall frak(p) in U, (s(frak(p)) in A_frak(p)) \ &"and" (exists a, f in A "s.t." frak(p) in D(f) subset U "and" s(frak(p)) = a/f^n in A_frak(p))}
  $
  つまり局所的には$frak(p)$によらないような分数で書けます，という関数の集合として定義する。これは自然な方法で単位的可換環をなす。これがSheafをなすことは計算で示せる。この定義で$cal(O)_X|_(D(f)) cong (Spec(A_f), cal(O)_(Spec(A_f)))$となることや$cal(O)_(X, frak(p)) cong A_frak(p)$となることも計算で示せる。これにより先に構成したAffine Schemeと同じものが得られることがわかる。

  歴史的にはこの定義が先にGrothendieckにより行われたのだと思う。これは突拍子もなく思いついたものではなく，#linksp(<ex:exofsheaf>)で見たような複素数上の正則関数のなす環の層を眺めることで得たものと思われる。
]

環の世界では，単にすべての環をあつめた圏を考えるのではなく，固定した環$R$上の代数の圏を考えることが多い。つまり対象は$R --> S$という射と環$S$の組であって射は$R$代数の間の射（図式の可換性の要件）とする圏を考える。これに対応して，Affine Scheme $(X, cal(O)_X)$を固定し，Affine Scheme $(Y, cal(O)_Y)$であって$(Y, cal(O)_Y) --> (X, cal(O)_X)$という射をもつようなもの全体の圏を考える。この圏を$AffSch_(\/X)$と書くことにする。圏論的にはSchの対象$X$によるスライス圏をとっている。

ここで重要な定理述べる。しっかりした証明は@SPAut18 の#link("https://stacks.math.columbia.edu/tag/01HX")[01HX]を参照されたい。#link("https://www.youtube.com/watch?v=Um5yo0_iZ4E")[昆布氏の動画]もわかりやすい。

#statementsp(
  box-name: "th",
  box-title: "",
  box-label: "affequiv",
  number: true
)[
  環$R$を固定する。
  $
    Spec colon R"-Alg" --> AffSch_(\/Spec(R)) colon A mapsto.long (Spec(A), cal(O)_(Spec(A)))
  $
  という（反変）関手と
  $
    Gamma colon AffSch_(\/Spec(R)) --> R"-Alg" colon (X, cal(O)_X) mapsto.long cal(O)_X (X)
  $
  という関手によって$R"-Alg"$と$AffSch_(\/Spec(R))$は（反変）圏同値である。

  前者をSpec functor, 後者をGlobal section functorと呼ぶ。
]
#pfsp[
  まず，$Spec$がどのような（反変）関手なのか説明する。射の対応は$phi colon A --> B$という$R$代数の射に対して$(Spec(phi), Spec(phi)^sharp) colon (Spec(B), cal(O)_(Spec(B))) --> (Spec(A), cal(O)_(Spec(A)))$という射を与える。ただし$f = Spec(phi)$として
  $
    f colon Spec(B) --> Spec(A) colon frak(q) mapsto.long phi^(-1)(frak(q))\
    f^sharp colon cal(O)_Spec(A) --> f_*cal(O)_Spec(B) colon f^sharp_(D_A (f)) colon A_f --> B_(phi(f))
  $
  である。前者はzariski位相に関する連続写像になる。後者は$f^(-1) (D_A (f)) = D_B (phi(f))$，つまり$Spec(A)$での基本開集合の引き戻しが$Spec(B)$での基本開集合$D_B (phi(f))$になることから，局所化の普遍性により誘導が保証される射である。これらのことからAffine Schemeの間の射が定まる。$Spec$が（反変）関手であることも確認できる。

  次に$Gamma$がどのような（反変）関手なのか説明する。射の対応は$(f, f^sharp) colon (X, cal(O)_X) --> (Y, cal(O)_Y)$というAffine Schemeの射に対して$f^sharp_Y colon cal(O)_Y (Y) --> f_*cal(O)_X (Y) = cal(O)_X (X)$という射を与える。

  これらが（反変）圏同値を与えることは，一般に関手$cal(F) colon cal(C) --> cal(G)$が圏同値なことを示したければ，これがFaithfully FullかつEssentially Surjectiveなことを示せばいい。言い換えれば次の二つを示せばいいのである。
  + （Faithfully Full）任意の$X, Y in cal(C)$に対して
    $
      Hom_(cal(C)) (X, Y) --> Hom_(cal(G)) (cal(F)(X), cal(F)(Y)) colon f mapsto.long cal(F)(f)
    $
    が全単射である。
  + （Essentially Surjective）任意の$Y in cal(G)$に対して，ある$X in cal(C)$が存在して$cal(F)(X) cong Y$となる。

  今回なら次を示せばいい。

  + 任意の$R$-代数 $A, B$に対して
    $
      Hom_(R"-Alg") (A, B) --> Hom_(AffSch_(\/Spec(R))) ((Spec(B), cal(O)_(Spec(B))), (Spec(A), cal(O)_(Spec(A)))) \ phi mapsto.long (Spec(phi), Spec(phi)^sharp)
    $
    が全単射である。
  + 任意の$R$代数$A$に対して，あるAffine Scheme $(X, cal(O)_X)$が存在して$cal(O)_X (X) cong A$となる。

  二つ目はAffine Schemeの定義から明らかなので，一つ目を示すことになるが，それは上で述べた$Spec, Gamma$による射の対応を繰り返して元に戻ることを確認すればいい。
  $
    Phi &colon Hom_(R"-Alg") (A, B) --> Hom_(AffSch_(\/Spec(R))) ((Spec(B), cal(O)_(Spec(B))), (Spec(A), cal(O)_(Spec(A)))) \
    &phi mapsto.long (Spec(phi), Spec(phi)^sharp) \
    Psi &colon Hom_(AffSch_(\/Spec(R))) ((Spec(B), cal(O)_(Spec(B))), (Spec(A), cal(O)_(Spec(A)))) --> Hom_(R"-Alg") (A, B) \
    &(f, f^sharp) mapsto.long f^sharp_Spec(A)
  $
  とおく。\
  ($Psi compose Phi = id$): $phi colon A --> B$を$R$-代数の射とする。$Phi(phi) = (Spec(phi), Spec(phi)^sharp)$である。
  $
    Psi(Phi(phi)) = Spec(phi)^sharp_Spec(A) colon cal(O)_(Spec(A))(Spec(A)) = A  \ 
    --> Spec(phi)_*cal(O)_(Spec(B))(Spec(A)) = cal(O)_(Spec(B))(Spec(phi)^(-1)(Spec(A))) = B
  $
  である。これは上で述べた$Spec(phi)^sharp$の定義から$phi$と同じものであることがわかる。

  ($Phi compose Psi = id$): $(f, f^sharp) colon (Spec(B), cal(O)_(Spec(B))) --> (Spec(A), cal(O)_(Spec(A)))$をAffine Schemeの射とする。$Psi((f, f^sharp)) = f^sharp_Spec(A) colon A --> B$である。$phi = f^sharp_Spec(A)$とおく。
  $
    Phi(Psi((f, f^sharp))) = (Spec(phi), Spec(phi)^sharp)
  $
  である。$Spec(phi)$は$Spec(B) --> Spec(A)$であって，$frak(q) mapsto.long phi^(-1)(frak(q))$である。これが$f$と同じものであることを示す。任意の点$frak(q) in Spec(B)$に対して，そのstalkを考えると，$f^sharp$はlocally ringed spaceの射なので
  $
    f^sharp_frak(q) colon cal(O)_(Spec(A), f(frak(q))) --> cal(O)_(Spec(B), frak(q))
  $
  つまり
  $
    f^sharp_frak(q) colon A_(f(frak(q))) --> B_frak(q)
  $
  は局所環の射。また，次の図式があり，上は$phi$と同じことに注意。
  $
    #align(center, diagram({
      node((-1, -1), [$A$])
      node((-1, 0), [$A_f(frak(q))$])
      node((0, -1), [$B$])
      node((0, 0), [$B_frak(q)$])
      edge((-1, -1), (-1, 0), "->")
      edge((0, -1), (0, 0), "->")
      edge((-1, 0), (0, 0), [$f^sharp_frak(q)$], label-side: right, "->")
      edge((-1, -1), (0, -1), [$f^sharp_Spec(A)$], label-side: left, "->")
    }))
  $
  すると
  $
    a in phi^(-1)(frak(q)) & <==> phi(a) in frak(q) \
    & <==> phi(a)\/1 in frak(q)B_frak(q) \
    & <==> f^sharp_frak(q) (a\/1) in frak(q)B_frak(q) \
    & <==> a\/1 in (f^sharp_frak(q))^(-1) (frak(q)B_frak(q)) \
    & <==> a\/1 in f(frak(q))A_(f(frak(q)))\
    & <==> a in f(frak(q))
  $
  となり$Spec(phi) = f$である。最後に，Sheafの射として$Spec(phi)^sharp = f^sharp$を示す。任意の基本開集合$D(f)$に対して，次の図式がある。$phi = f^sharp_Spec(A)$に注意。
  $
    #align(center, diagram({
      node((-1, -1), [$A$])
      node((0, -1), [$B$])
      node((-1, 0), [$A_f$])
      node((0, 0), [$B_phi(f)$])
      edge((-1, -1), (0, -1), [$phi$], label-side: left, "->")
      edge((-1, -1), (-1, 0), "->")
      edge((0, -1), (0, 0), "->")
      edge((-1, 0), (0, 0), [$f^sharp_D(f)$], label-side: right, "->")
    }))
  $
  $phi$に関して，$Spec(phi)^sharp_(D(f))$は局所化の普遍性を用いて$A_f --> B_phi(f)$という写像を定めるが，これは一意的なのだから$f^sharp_D(f)$と同じものでなければならない。これで$Phi compose Psi = id$も示された。
]

Affine Schemeの圏には終対象$Spec(ZZ)$が存在している。一般に終対象を持つ（ならば同型を除いて一意）圏の，その終対象によるスライス圏は，もとの圏と圏同値になる。同じく環の圏には始対象$ZZ$があり，これのコスライス圏は環の圏と圏同値。ゆえに次を得る。

#statementsp(
  box-name: "cor",
  box-title: "",
  box-label: "",
  number: true
)[
  環の圏$"Ring"$とAffine Schemeの圏$AffSch$は（反変）圏同値である。同値は次の反変関手で与える。
  $
    Spec &colon "Ring" --> AffSch colon A mapsto.long (Spec(A), cal(O)_(Spec(A))) \ 
    Gamma &colon AffSch --> "Ring" colon (X, cal(O)_X) mapsto.long cal(O)_X (X)
  $
  $Spec$をSpec functor，$Gamma$をGlobal section functorと呼ぶ。
]

これにより環を考えることはAffine Schemeを考えることと等価であると分かる。Affine Scheme は#linksp(<ex:exofsheaf>)で見たように幾何的な直感をもって考えられるので，代数を幾何的に考える一歩になる。Vice Versa。

等価ならなぜわざわざAffine Schemeを考えるのか？というと，それは次のSchemeの後に話す。

== Schemes
早速Schemeの定義をする。@Har77 のp.74に同様のことが書いてある。

#statementsp(
  box-name: "def",
  box-title: "Scheme",
  box-label: "scheme",
  number: true
)[
  locally ringed space $(X, cal(O)_X)$が*Scheme*であるとは，任意の$x in X$に対して，ある開近傍$x in U subset X$が存在して，$(U, cal(O)_X|_U)$がAffine Schemeとなることである。ただし$cal(O)_X|_U$は$cal(O)_X$の$U$へのristricted sheafであり
  $
    cal(O)_X|_U (V) = cal(O)_X (V)
  $
  と定めるものである。(restriction mapも$cal(O)_X$の制限準同型写像を用いて定める。)
]

このような$U$をAffine 開近傍という。つまりSchemeとは，局所的に見れば$U = Spec(A)$という位相空間であって，その上のsheafも$cal(O)_U$というstructure sheafであるようなlocally ringed spaceのことである。全体的にはAffine Schemeではないかもしれないが，Affine 開集合を用いて
$
  X = union.big_(i in I) U_i
$
とかけるから，Affine Schemeを貼り合わせたものと考えることができる。SchemeはAffine Schemeの一般化であるといえる。ゆえに，雑に言えばSchemeは環の一般化であるといえる。Schemeの圏を$Sch$と書くことにする。$X$上のSchemeの圏を$Sch_(\/X)$と書くことにする。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofscheme1",
  number: true
)[
  互いに同型ではない体$K,L$をとる。$Spec(K)$と$Spec(L)$はZariski位相としては位相同型である。ともに１点しかないからである。しかし，Scheme（今回はAffine Scheme）としては同型ではない。というのは，例えば$(Spec(K), cal(O)_Spec(K))$の唯一の点でのstalkは$K$である。同様に$(Spec(L), cal(O)_Spec(L))$の唯一の点でのstalkは$L$である。これらは同型ではないから，Schemeとして同型であるはずはない。
]

いくつかSchemeに対する条件や性質を見ていく。もちろんAffineでないSchemeもあるのだが，だからこそAffineにいつなるのか？といったことも重要視される。また，単に環というのではなく整域やネーター環など，いくらか条件を付けることがあるように，Schemeにも条件を考えることができる。このようなとき，たいていは上で述べたようにAffine Schemeの貼り合わせであり，結局は（圏同値なので）環の性質から引っ張てくる性質が多い。

次は非常によく使う。@SPAut18 の#link("https://stacks.math.columbia.edu/tag/01IW")[01IW]に載っている。

#statementsp(
  box-name: "lem",
  box-title: "",
  box-label: "standardopen",
  number: true
)[
  
]

次は@Har77 のEx.II.2.16である。

#statementsp(
  box-name: "lem",
  box-title: "",
  box-label: "clsdstalk",
  number: true
)[
  $X$をSchemeとして$f in Gamma(X, cal(O)_X)$とする。
  $
    X_f = {x in X | f_x in.not frak(m)_x}
  $
  とおく。$f_x$は点$x$におけるstalk $cal(O)_(X, x)$における$f$の像である。$U$をAffine 開集合として，$U = Spec(B)$とする。$overline(f) in Gamma(U, cal(O)_X|_U)$を$f$を制限写像$Gamma(X, cal(O)_X) --> Gamma(U, cal(O)_X|_U)$によって得られる$f$の像とする。このとき，$U inter X_f = D(overline(f))$である。
]
#pfsp[
  $
    x in U inter X_f &<==> x in {frak(p) in Spec(B) = U | overline(f)_(frak(p)) in.not frak(p)A_frak(p)}\ 
    &<==> x in {frak(p) in Spec(B) | overline(f) in.not frak(p)}\
    &<==> x in D(overline(f)) 
  $
  より示された。
]

次の定義たちは@Har77 のp.82である。

#statementsp(
  box-name: "def",
  box-title: "connected",
  box-label: "connected",
  number: true
)[
  Scheme $X$が*connected*であるとは，台の位相空間$X$がconnectedであるときをいう。同じく*irreducible*を定義する。
]

#statementsp(
  box-name: "def",
  box-title: "reduced",
  box-label: "reduced",
  number: true
)[
  Scheme $X$が*reduced*であるとは，任意の開集合$U subset X$に対して，$cal(O)_X (U)$がreducedであることをいう。(すなわち非自明なベキ零元を持たない環である。)
]

#statementsp(
  box-name: "def",
  box-title: "integral",
  box-label: "integral",
  number: true
)[
  Scheme $X$が*integral*であるとは，任意の開集合$U subset X$に対して，$cal(O)_X (U)$が整域であるときをいう。
]

#statementsp(
  box-name: "rem",
  box-title: "",
  box-label: "",
  number: true
)[
  ここまでの定義で，環のreducednessは局所的な条件であるので，Scheme $X$がreducedであることと，任意のstalk $cal(O)_(X, x)$がreducedであることは同値である。

  @AM69 の演習問題1.19より，Affine Scheme $X$がirreducibleであることとglobal sections $cal(O)_X (X)$のnilradical（極小素イデアルすべての共通部分，ベキ零元の全体）が素イデアルであることは同値である。同じく，$X$がintegralであることとglobal sections $cal(O)_X (X)$が整域であることは同値である。
]

次の命題も同じく@Har77 のp.82にある。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "",
  number: true
)[
  Scheme $(X, cal(O)_X)$がintegralであることと，reducedかつirreducibleであることは同値。
]
#pfsp[
  (integral $==>$ reduced かつ irreducible): reducedは明らか。irreducibleでないとすると$U_1, U_2$という共通部分を持たない非空な$X$の開集合をとれる。一般に$"Op"(X)^("op")$の次の図式はイコライザをなす。
  $
    #align(center, diagram({
      node((-1, -1), [$U_1 union U_2$])
      node((0, -1), [$U_1 times U_2$])
      node((1, -1), [$U_1 inter U_2$])
      edge((-1, -1), (0, -1), "->")
      edge((0, -1), (1, -1), shift: -0.05, "->")
      edge((0, -1), (1, -1), shift: 0.05, "->")
    }))
  $
  Sheafとは，この自然なイコライザをイコライザに移すと定義されているので
  $
    #align(center, diagram({
      node((-1, -1), [$cal(O)_X (U_1 union U_2)$])
      node((0, -1), [$cal(O)_X (U_1) times cal(O)_X (U_2)$])
      node((1, -1), [$cal(O)_X (U_1 inter U_2)$])
      edge((-1, -1), (0, -1), "->")
      edge((0, -1), (1, -1), shift: -0.05, "->")
      edge((0, -1), (1, -1), shift: 0.05, "->")
    }))
  $
  もイコライザ。ゆえに
  $
    cal(O)_X (U_1 union U_2) = cal(O)_X (U_1) times_(cal(O)_X (U_1 inter U_2)) cal(O)_X (U_2) = cal(O)_X (U_1) times cal(O)_X (U_2)
  $
  $cal(O)_(X) (emptyset) = 0$（0環）に注意した。よって整域でなくなってしまい矛盾。

  (reduced かつ irreducible $==>$ integral): アフィン開集合$U =Spec(B) subset X$であって$f, g in cal(O)_X (U)$でかつ$f g = 0$となるとする。
  $
    Y = {x in U | f_x in frak(m)_x}\
    Z = {x in U | g_x in frak(m)_x}
  $
  とおく。#linksp(<lem:clsdstalk>)より，これらは閉集合である。また
  $
    Y union Z = {x in U | (f g)_x in frak(m)_x} = U
  $
  である。しかし$X$はirreducibleなので$U$もそうであり，$Y=U$かまたは$Z=U$である。$Y = U$としていい。すると任意の$frak(p) in U = Spec(B)$に対して$f_frak(p) in frak(p)B_frak(p)$である。特に$f$は$B$のすべての素イデアルに含まれる。つまり$f$はnilpotentである。$X$はreducedなので$f=0$である。ゆえに$B$は整域。
]

#statementsp(
  box-name: "def",
  box-title: "Noetherian Scheme",
  box-label: "noethsch",
  number: true
)[
  Scheme $X$が*Locally Noetherian*であるとは，任意の$x in X$に対して，あるアフィン開近傍$Spec(A)$であって$A$がネーター環となるものが存在するときをいう。Scheme $X$が*Noetherian*であるとは，$X$がLocally Noetherianであって，かつ台の位相空間$X$がquasi-compact つまり任意の開被覆に対して有限部分被覆をとれるときをいう。
]

これだけ見ると$Gamma(U, cal(O)_X)$がネーター環にならないようなアフィン開集合$U$あるのに，locally noetherianである。という状況を許すかもしれないがこれはあり得ないことを示せる。つまり次が成り立つ。

#v(2em)

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "locnoethprop",
  number: true
)[
  Scheme $X$がlocally noetherianであることと，任意のアフィン開集合$U$に対して$Gamma(U, cal(O)_X)$がネーター環であることは同値。
]
#pfsp[
  $<==$は明らかなので$==>$を示す。まず，Affine Schemeに帰着できることを説明する。任意の点$x in X$にはネーター環の$Spec$でかける開近傍があり，ネーター環の局所化はネーター環なので，$X$はネーター環の$Spec$でかける開集合の被覆を持つ。任意の$U$というアフィン開集合についても同様にネーター環の$Spec$でかける開集合の被覆を持つので，$Spec(A) = U$自身locally noetherianである。$A$がネーター環であることを示すのが目標だから，はじめから$X$はアフィンスキームとしてよい。

  $X = Spec(A)$として，locally noetherianから
  $
    X = union.big D(f)
  $
  であって，$A_f$がネーター環になるような被覆が存在する。$X$はquasi-compactなのでこれの有限部分被覆をとって
  $
    X = union.big_(i=1)^n D(f_i)
  $
  とできる。これを環の言葉にすれば$A$の元$f_1,dots,f_n$であって$(f_1,dots,f_n) = A$であり，かつ$A_f_i$がネーター環なら$A$がネーター環になることを示せればいいことになる。これは容易に示せる。スケッチを示す。任意にイデアル$I$をとって$I_f_i$は有限生成。生成系の分母をすべて払って得た元たちで生成される$A$のイデアルを$J$とすると$J subset I$かつ$I_f_i = J_f_i$である。これより$(I\/J)_f_i = 0$である。これより，商加群$I\/J$は任意の素イデアルによる局所化で消えることを示せる。よって$I\/J = 0$となり，$I = J$である。よって$I$は有限生成。
]

#statementsp(
  box-name: "rem",
  box-title: "",
  box-label: "",
  number: true
)[
  ネーター環の局所化はネーター環であるから，locally noetherianであるSchemeの任意の点$x$におけるstalk $cal(O)_(X, x)$はネーター環である。しかし逆は成立しない。例えば
  $
    A = product_(n in NN) FF_2
  $
  という直積環を考える。明らかにネーター環ではない。しかし任意の素イデアルで局所化すると$FF_2$となり，ネーター環である。このときの$Spec(A)$が反例である。
]

次のsupportの概念はSchemeでなくても一般のSheafに定義できるが，Schemeに限っておく。@Har77 p.67のII.Ex.2.14である。この概念は環の局所コホモロジーと層係数コホモロジーとの比較に必要となる。

#v(4em)

#statementsp(
  box-name: "def",
  box-title: "Support",
  box-label: "supp",
  number: true
)[
  $(X, cal(O)_X)$をSchemeとする。開集合$U$とsection $s in cal(O)_X (U)$に対して
  $
    Supp(s) = {x in U | s_x eq.not 0 "in" cal(O)_(X, x)}
  $
  と定める。これを$s$の*support*と呼ぶ。ただし$s_x$は点$x$におけるstalk $cal(O)_(X, x)$における$s$の像である。
]

つまり，$Supp(s)$は関数としての$s$が消えないような空間上の点の集合である。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "suppclsd",
  number: true
)[
  $Supp(s)$は閉集合である。
]
#pfsp[
  補集合が開集合なことを示す。つまり
  $
    U \\ Supp(s) = {x in U | s_x eq 0 "in" cal(O)_(X, x)}
  $
  が開集合なことを示す。$x in U \\ Supp(s)$とする。$s_x = 0$である。
  $
    cal(O)_(X, x) = colim_(x in V) cal(O)_X (V)
  $
  であったから，ある開集合$V$が存在して$x in V subset U$であって$s|_V = 0$である。$y in V$をとると$s_y$は$s|_V$の像なので$s_y = 0$である。ゆえに
  $
    x in V subset U \\ Supp(s)
  $
  であり示された。
]

#v(2em)

#statementsp(
  box-name: "def",
  box-title: "",
  box-label: "suppsch",
  number: true
)[
  $(X, cal(O)_X)$をSchemeとする。$Z subset X$を閉集合とし，
  $
    Gamma_Z (X, cal(O)_X) = {s in Gamma(X, cal(O)_X) | Supp(s) subset Z}
  $
  と定める。
  $
    X supset V mapsto.long Gamma_(Z inter V) (V, cal(O)_X|_V)
  $
  と対応を定めると，これは$X$上のsheafになる。これを*$Z$にsupportをもつsheaf*と呼び，$cal(H)_Z^0(cal(F))$とかく。
]

これは関数としての$s$であって，指定した閉集合$Z$の中でしか意味を持たないもの，他では消えてしまうものを集めてくださいと言っている。もちろんSheafになっていることは示さねばなるまい。

#v(2em)

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "",
  number: true
)[
  #linksp(<def:suppsch>)で定めた対応は$X$上の（アーベル群の圏に値を持つ）sheafになる。
]
#pfsp[
  まず，任意の開集合$U$に対して
  $
    Gamma_(Z inter U) (U, cal(O)_X|_U) = {s in Gamma(U, cal(O)_X|_U) | Supp(s) subset Z inter U}
  $
  がアーベル群になる，つまり和と逆元で閉じていることを確認する。$s, t$をこの集合の元とすると，$Supp(s + t) subset Supp(s) union Supp(t) subset Z inter U$であるから$s + t$もこの集合の元である。加法の逆元で閉じていることは明らか。ここで示す必要はないが，これが$cal(O)_X (U)$加群になることも明らかであることに注意。

  Sheafになることを示す。Presheafになることはよい。任意の開集合$U$とその開被覆$U = union.big_(i in I) U_i$をとる。$s in Gamma_(Z inter U) (U, cal(O)_X|_U)$であって$s|_(U_i) = 0$とする。$cal(O)_X$がSheafなので$s = 0$である。

  $s_i in Gamma_(Z inter U_i) (U_i, cal(O)_X|_U_i)$とし，任意の$i,j$に対して$s_i|_(U_i inter U_j) = s_j|_(U_i inter U_j)$であるとする。$cal(O)_X$がSheafなので，ただひとつ貼り合わせ$s in cal(O)_X (U) supset Gamma_(Z inter U) (U, cal(O)_X|_U)$をとれる。これがさらに$Gamma_(Z inter U) (U, cal(O)_X|_U)$に入ることを確認すればいい。$Supp(s) subset Z inter U$を示す。任意に$x in Supp(s)$をとる。$x in U_i$となる$i$をとれる。すると
  $
    0 eq.not s_x = (s|_(U_i))_x = (s_i)_x
  $
  である。よって
  $
    x in Supp(s_i) subset Z inter U_i subset Z inter U
  $
  これで示された。
]

途中，$cal(H)_Z^0(cal(F))(U)$というアーベル群が$cal(O)_X (U)$加群になることを補足したが，このようにスキーム$(X, cal(O)_X)$に対して$X$上のSheaf $cal(G)$があって，任意の開集合$U$に対して$cal(G)(U)$が$cal(O)_X (U)$加群になるとき，このSheaf $cal(G)$をScheme $(X, cal(O)_X)$上の*sheaf of modules*と呼ぶ。しばしば略して$cal(G)$は$cal(O)_X$加群のSheafとか言ったりする。この概念は後々導入する。

== Morphisms of Schemes
Schemeに対する主張はAffine Schemeに対する主張に帰着し，さらには環の主張に帰着することを体感していただいた。これはSchemeの間の射$f colon X --> Y$であっても同じことである。がしかし，いちいちAffine Schemeに帰着することを個別に示していては骨が折れる。帰着できる条件を先立って整備してしまおう。このあたりは@SPAut18 の#link("https://stacks.math.columbia.edu/tag/01SQ")[01SQ]を参考にされたい。

#statementsp(
  box-name: "def",
  box-title: "",
  box-label: "property",
  number: true
)[
  $PP$を環の射に対する条件とする。(例えばof finite type, of finite presentation, finite,  #etale など）環の射$R-->A$が条件$PP$を満たすことを$PP(R-->A)$と書くことにする。

  条件$PP$が*local*であるとは次のすべてを満たすときをいう。

  + 任意の環の射$R-->A$と任意の$f in R$に対して，$PP(R-->A) ==> PP(R_f --> A_f)$
  + 任意の環$R, A$と任意の$f in R, a in A$と任意の射$R_f --> A$に対して，$PP(R_f --> A) ==> PP(R --> A_a)$ (後者は合成$R --> R_f --> A --> A_a$である。普遍性からこれしかない。)
  + 任意の環の射$R-->A$と$(a_1,dots,a_r) = A$となる$A$の元$a_i in A$に対して，$forall i, PP(R-->A_a_i) ==> PP(R-->A)$
]

#statementsp(
  box-name: "def",
  box-title: "",
  box-label: "",
  number: true
)[
  $PP$を環の射に対する条件とし，$f colon X --> S$をSchemeの射とする。$f$が*locally of type $PP$*であるとは，任意の点$x in X$に対して，あるアフィン開近傍$x in U = Spec(A) subset X$と$V = Spec(R) subset S$であって$f(U) subset V$なるもので，誘導される環の射
  $
    "res"_(f^(-1)(V), U)^X compose f^sharp_V colon R --> cal(O)_X (f^(-1)(V)) --> A
  $
  が条件$PP$を満たすものがあるときをいう。
]

#statementsp(
  box-name: "lem",
  box-title: "",
  box-label: "hariawase",
  number: true
)[
  $f colon X --> S$をSchemeの射とする。$U subset X, V subset S$をそれぞれアフィン開集合で$f(U) subset V$となるとする。もし$f$がlocally of type $PP$であり，$PP$がlocalならば，誘導される環の射
  $
    "res"_(f^(-1)(V), U)^X compose f^sharp_V colon cal(O)_S (V) --> cal(O)_X (f^(-1)(V)) --> cal(O)_X (U)
  $
  について，$PP(cal(O)_S (V) --> cal(O)_X (U))$が満たされる。
]
#pfsp[
  $u in U$を任意にとる。$f$がlocally of type $PP$であるから，あるアフィン開近傍$u in U' = Spec(A) subset X$と$V' = Spec(R) subset S$であって$f(U') subset V'$なるものがあって，誘導される射が$PP$を満たすようにとれる。$U'' subset U inter U'$であって，アフィン開集合$U,U'$両方のprincipal open subsetとなるものが取れる。
  $
    cal(O)_S (V') --> cal(O)_X (U') --> cal(O)_X (U'')
  $
  は$PP$がlocalなので$PP$を満たす。よってはじめから$U'$は$U$のprincipal open subsetとしてよい。$f(u) in V'' subset V inter V'$となる$V,V'$両方のprincipal open subsetとなる開近傍をとれる。$U''' := f^(-1)(V'') inter U'$とおくとこれは$U'$のprincipal open subsetである。よって
  $
    cal(O)_S (V'') --> cal(O)_X (U''')
  $
  は$PP$を満たす。なぜなら$cal(O)_X (V') --> cal(O)_X (U')$の局所化で表されるからである。$U'''$は$U'$の，$U'$は$U$のprincipal open subsetであるから，$U'''$は$U$のprincipal open subsetである。ゆえに
  $
    cal(O)_S (V) --> cal(O)_X (U''')
  $
  は$PP$を満たす。つまり
  $
    cal(O)_S (V) --> cal(O)_X (U)_(f_u)
  $
  で$f_u$が$cal(O)_X (U)$の元で$u in D_(cal(O)_X (U))(f_u)$となるものである。$u$は$U$の任意の元であることと，$U$はquasi-compactであることを用いると，$(f_u_1, dots, f_u_r) = cal(O)_X (U)$なる$f_u_i in cal(O)_X (U)$が取れて
  $
    cal(O)_S (V) --> cal(O)_X (U)_(f_u_i)
  $
  は$PP$を満たす。$PP$がlocalなので
  $
    cal(O)_S (V) --> cal(O)_X (U)
  $
  は$PP$を満たす。
]

さて，次が欲しい補題である。@SPAut18 #link("https://stacks.math.columbia.edu/tag/01SU")[01SU]

#statementsp(
  box-name: "lem",
  box-title: "",
  box-label: "localproperty",
  number: true
)[
  $PP$を環の射に対する条件でlocalであるとする。Schemeの射$f colon X --> Y$について，次は同値である。

  + $f$がlocally of type $PP$である。
  + 任意のアフィン開集合$U subset X, V subset Y$であって$f(U) subset V$なるものについて，誘導される環の射
    $
      cal(O)_Y (V) --> cal(O)_X (U)
    $
    が$PP$を満たす。
  + ある$Y = union.big_(i in I) V_i$というアフィン開被覆と$f^(-1) (V_j) = union.big_(i in I_j) U_(i)$なるアフィン開集合$U_(i,j)$の被覆が存在し，任意の$j in I$と$i in I_j$について$U_j --> V_i$はlocally of type $PP$である。
  + ある$Y = union.big_(i in I) V_i$というアフィン開被覆と$f^(-1) (V_j) = union.big_(i in I_j) U_(i)$なるアフィン開集合$U_(i,j)$の被覆が存在し，任意の$j in I$と$i in I_j$について，誘導される環の射
    $
      cal(O)_Y (V_i) --> cal(O)_X (U_(i,j))
    $
    が$PP$を満たす。
]
#pfsp[
  2,3,4 $==>$ 1 は明らか。1 $==>$ 2は#linksp(<lem:hariawase>)でわかる。
]

これらを示したことで，Schemeの射の条件の言いかえは，環のレベルで確かめればいいことになる。

環の射の条件$PP$がlocalなものを見ていく。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "",
  number: true
)[
  環の射$phi colon R --> A$が平坦であるという条件はlocalである。
]
#pfsp[
  #linksp(<def:property>)の定義のを順に確認する。1は，平坦性は局所化で保たれるので成立。2は局所化が平坦なことと平坦の合成は平坦なことから成立。3は，任意に$A$の素イデアル$frak(p)$をとる。$f_i in.not frak(p)$となる$i$が存在する。ここで任意に$R$加群の単射$M --> N$をとる。すると
  $
    Ker(M tensor_R A_f_i --> N tensor_R A_f_i) = 0
  $
  $R --> A --> A_f_i --> A_frak(p)$は平坦で，ここに$tensor_R A_frak(p)$をしても単射性は保たれるから
  $
    Ker(M tensor_R A_frak(p) --> N tensor_R A_frak(p)) = 0
  $
  よって$Ker(M --> N) tensor_R A_frak(p) = 0$である。$frak(p)$は任意なので$Ker(M --> N) = 0$である。よって$M --> N$は単射である。これで示された。
]

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "",
  number: true
)[
  of finite type, of finite presentationはlocalな条件である。
]
#pfsp[
  @SPAut18 の#link("https://stacks.math.columbia.edu/tag/00EP")[00EP]を参照。
]

#statementsp(
  box-name: "rem",
  box-title: "",
  box-label: "",
  number: true
)[
  有限射と整な射はlocalではない。例えば$ZZ --> ZZ$という恒等写像は明らかにどちらの条件も満たす。#linksp(<def:property>)の2によれば，$ZZ --> ZZ[1/2]$も同じく有限，整でなくてはならない。しかし有限だとすれば$1/2$の高いべきが作れなくなるし，整であることは$ZZ$が整閉なことに反する。
]

次は#Etale 射の定義にも重要である。@SPAut18 の#link("https://stacks.math.columbia.edu/tag/01T0")[01T0]を参照されたい。

#statementsp(
  box-name: "def",
  box-title: "Of finite type, of finite presentation",
  box-label: "offin",
  number: true
)[
  $f colon X --> Y$をSchemeの射とする。

  + $f$が点$x in X$で*of finite type*であるとは，あるアフィン開近傍$x in U = Spec(A) subset X$と$V = Spec(B) subset Y$であって$f(U) subset V$なるもので
    $
      "res"_(f^(-1)(V), U)^X compose f^sharp_V colon B --> cal(O)_X (f^(-1)(V)) --> A
    $
    という誘導される射がof finite typeであるときをいう。
  + $f$が任意の点$x in X$でof finite typeであるとき，$f$が*locally of finite type*であるという。
  + $f$がlocally of finite typeであって，かつ台の位相空間$X$がquasi-compactであるとき，$f$が*of finite type*であるという。

  上とまったく同じように*of finite presentation*も定義する。
]

この定義だと，最後にコンパクト性を要請している意味がわからないが，@Har77 p.84のちょっとだけ回りくどい定義を見ると要請したくなる条件だと分かる。

#v(2em)

#statementsp(
  box-name: "def",
  box-title: "Open immersion",
  box-label: "openimmersion",
  number: true
)[
  $X$をSchemeとする。$U$が$X$の*Open Subscheme*であるとは，$U$は$X$の開集合で，$(U, cal(O)_U)$がSchemeとなる構造層$cal(O)_U$があり，$cal(O)_X|_U cong cal(O)_U$となるときをいう。

  Schemeの射$f colon X --> Y$が*Open immersion*であるとは位相空間の射として$f$は開埋め込み（単射な連続開写像）であり，$U = f(X) subset Y$が$Y$のOpen subschemeになっていて，Schemeとして$(f, f^sharp) colon (X, cal(O)_X) cong (U, cal(O)_Y|_U)$となるときをいう。
]

#statementsp(
  box-name: "def",
  box-title: "Closed immersion",
  box-label: "closedimmersion",
  number: true
)[
  $f colon X --> Y$をSchemeの射とする。$f$が*Closed immersion*であるとは，位相空間の射として$f$は閉埋め込み（単射な連続閉写像）であり，付随するSheafの射$f^sharp colon cal(O)_Y --> f_* cal(O)_X$が全射であるときをいう。

  $X$の*Closed Subscheme*とは，あるScheme $Y$とClosed immersion $i colon Y --> X$の組$(Y, i)$のことをいう。(正確にはこのような対象の適切な同値関係による同値類である。)
]

前の定義で「集合じゃないものに同値関係？」と思ったかもしれない。サイズイシューはあんまり気にしなくていい。イデアル層による閉スキームの定義もできるのでそっちであれば考える余地はない。今回の定義をどうしても正当化したければ適切なGrothendieck宇宙でも取るといいのだろう。

#statementsp(
  box-name: "def",
  box-title: "fiber Product",
  box-label: "fiber",
  number: true
)[
  $X,Y$を$S$-Schemeとする。すなわち，$S$をSchemeとして，$(X,f)$をScheme $X$とSchemeの射$f colon X --> S$の組とする。$Y$も同様。このとき，$X,Y$の$S$上の*Fiber Product* $X times_S Y$とは，$S$-Schemeの圏$Sch_(\/S)$における$X,Y$のfiber Productである。
]

Fiber Productとは次のような図式で表現される普遍性を持った対象である。

$
  #align(center, diagram({
    node((-1, -1), [$X times_S Y$])
    node((0, -1), [$Y$])
    node((-1, 0), [$X$])
    node((0, 0), [$S$])
    node((-2, -2), [$Z$])
    edge((-1, 0), (0, 0), [$f$], label-side: right, "->")
    edge((0, -1), (0, 0), [$g$], label-side: left, "->")
    edge((-1, -1), (0, -1), [$p_Y$], label-side: left, "->")
    edge((-1, -1), (-1, 0), [$p_X$], label-side: right, "->")
    edge((-2, -2), (-1, -1), "-->")
    edge((-2, -2), (0, -1), "->", bend: 18deg)
    edge((-2, -2), (-1, 0), "->", bend: -18deg)
  }))
$

$Sch_(\/S)$においてこれは存在する。@Har77 p.87に証明があるがめんどくさい。どんな性質を持った対象なのだろうか？

#v(4em)

#statementsp(
  box-name: "th",
  box-title: "",
  box-label: "fiber",
  number: true
)[
  任意のScheme $S$に対して$Sch_(\/S)$にはFiber Productが存在する。
]
#pfsp[
  omit
]

証明はまずAffine Schemeのレベルで証明し，それをがんばって貼り合わせる。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "affinefiber",
  number: true
)[
  $X = (Spec(A), cal(O)_(Spec(A))), Y = (Spec(B), cal(O)_(Spec(B))), Z = (Spec(C), cal(O)_(Spec(C)))$をAffine Schemeとする。このとき，$X,Y$の$Z$上でのFiber Productは，$(Spec(A tensor_C B), cal(O)_(Spec(A tensor_C B)))$となる。
]
#pfsp[
  #linksp(<th:affequiv>)と，$C$代数の圏におけるcofiber productが$A tensor_C B$であることから明らか。
]

ところで，$S$-Schemeを考えるときの$S$のことをベースと言う。ここで，$S$-Scheme $X,Y$があったときに，$X times_S Y --> Y$が自然にとれるから，これらから$Y$-Schemeを得ることができた。この操作でベースが変わったから，これをベースチェンジと言う。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "",
  number: true
)[
  $X = (Spec(QQ), cal(O)_(Spec(QQ))), S = (Spec(ZZ), cal(O)_(Spec(ZZ)))$とする。$kappa(p) = FF_p$とする。すると
  $
    X times_S Spec(kappa(p)) cong Spec(QQ tensor_ZZ FF_p) cong Spec(FF_p)
  $
  となる。
]

また，$X --> S$がスキームの射に対する，とある条件$PP$を満たすとき，$X times_S Y --> Y$も$PP$を満たす，ということが多い。このような条件$PP$を*stable under base change*であるという。

localのときと同様，環のレベルでこれを判定するいい方法がある。

#v(2em)

#statementsp(
  box-name: "def",
  box-title: "",
  box-label: "stablebase",
  number: true
)[
  $PP$を環の射に対する条件とする。任意の$R --> A, R --> B$に対して
  $
    PP(R --> A) ==> PP(B --> A tensor_R B)
  $
  を満たすとき，$PP$は*stable under base change*であるという。
]

$A$が$R$上で条件を満たしているなら，任意の$B$にベースチェンジしても条件を満たしている，ということ。

次のように，stable under base changeであるようなSchemeの射の条件は，今定義したstable under base changeであるような環の射から伝播する。ゆえに，わざわざSchemeの射の条件がstable under base changeであることを確認する手間が省ける。

と，同時に，Schemeのfiber productをどんな風に使えばいいか，掴んでいただこう。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "stable",
  number: true
)[
  $PP$がlocalかつstable under base changeであるような環の射に対する条件とする。このとき，Schemeの射$f colon X --> S$がlocally of type $PP$であれば，任意の$g colon Y --> S$に対するベースチェンジ，$p_Y colon X times_S Y --> Y$もlocally of type $PP$である。
]
#pfsp[
  次の図を参考にする。
  $
    #align(center, diagram({
      node((-1, -1), [$X times_S Y$])
      node((0, -1), [$Y$])
      node((-1, 0), [$X$])
      node((0, 0), [$S$])
      edge((-1, 0), (0, 0), [$f$], label-side: right, "->")
      edge((0, -1), (0, 0), [$g$], label-side: left, "->")
      edge((-1, -1), (0, -1), [$p_Y$], label-side: left, "->")
      edge((-1, -1), (-1, 0), [$p_X$], label-side: right, "->")
    }))
  $
  示すべきは，$p_Y$がlocally of type $PP$であることである。

  任意に$Y$のアフィン開集合$V = Spec(B)$と$p_Y (W) subset V$となる$X times_S Y$のアフィン開集合$W = Spec(C)$をとる。誘導される射$B --> C$が$PP$を満たすことを示す。任意に$w in W$をとる。$y = p_Y (w), x = p_X (w), s = f(x) = g(y)$とおく。$s in U$となる$S$のアフィン開集合$U = Spec(R)$をとれる。$y in V inter g^(-1) (U)$でこれは開集合なので，$y in V_b = Spec(B_b) subset V inter g^(-1) (U)$となるアフィン開集合をとれる。同様に$x in U_X = Spec(A) subset f^(-1) (U)$となるアフィン開集合をとれる。仮定から$R --> A$は$PP$を満たす。したがって$R --> B_b$によるベースチェンジ$B_b --> A tensor_R B_b$も$PP$をみたす。ファイバー積の構成から
  $
    w in U_X times_U V_b cong Spec(A tensor_R B_b)
  $
  となっている$X times_S Y$のアフィン開集合である。ゆえに
  $
    w in Spec(C_(c_w)) = Spec((A tensor_R B_b)_(f_w)) subset W inter (U_X times_U V_b)
  $
  となるような$w$の近傍をとれる。(2つのアフィン開集合に共通のstandard open subsetが取れる。)\
  $PP(B_b --> A tensor_R B_b)$であるから，$PP$がlocalなことを使って$PP(B_b --> (A tensor_R B_b)_(f_w))$である。ゆえに$PP(B --> C_(c_w))$が成立する。$w$は任意だったから，$(c_w | w in W) = C$である。$Spec(C)$はquasi-compactなので，有限個の$w$をとり，あとは再び$PP$がlocalなことから$PP(B --> C)$が成立するとわかる。
]

これを示せたので，ベースチェンジで保たれる性質を列挙していこう。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "basechangestable",
  number: true
)[
  次のSchemeの射に対する条件はstable under base changeである。つまり，この条件を満たすSchemeの射$f colon X --> S$があれば，任意の$g colon Y --> S$に対するベースチェンジ$p_Y colon X times_S Y --> Y$もこの条件を満たす。

  + 平坦
  + of finite type
  + of finite presentation
  + Open immersion
  + Closed immersion
]
#pfsp[
  1,2,3は環の射に対する条件を確認して#linksp(<prop:stable>)で容易に示せる。

  4を示す。$f colon X --> S$がopen immersionだから$U subset S$という開部分schemeをとって$(f, f^sharp) colon (X, cal(O)_X) --> (U, cal(O)_S|_U)$が同型である。$V = g^(-1) (U) subset Y$をとり$(V, cal(O)_Y|_V)$を考えると，これは$Y$の開部分schemeである。自然な包含$j colon V --> Y$をとるとこれはopen immersion。$g colon Y --> S$を$V$に制限して$phi = f^(-1) compose g colon (V, cal(O)_Y|_V) --> (U, cal(O)_S|_U) cong (X, cal(O)_X)$が誘導される。さて，次の図式がfiber productになることを示す。
  $
    #align(center, diagram({
      node((-1, -1), [$V$])
      node((0, -1), [$Y$])
      node((-1, 0), [$X$])
      node((0, 0), [$S$])
      edge((0, -1), (0, 0), [$g$], label-side: left, "->")
      edge((-1, 0), (0, 0), [$f$], label-side: right, "->")
      edge((-1, -1), (0, -1), [$j$], label-side: left, "->")
      edge((-1, -1), (-1, 0), [$phi$], label-side: right, "->")
    }))
  $
  任意にScheme $Z$と$alpha colon Z --> X, beta colon Z --> Y$であり$f compose alpha = g compose beta$となるものをとる。
  $
    #align(center, diagram({
      node((-1, -1), [$V$])
      node((0, -1), [$Y$])
      node((-1, 0), [$X$])
      node((0, 0), [$S$])
      node((-2, -2), [$Z$])
      edge((0, -1), (0, 0), [$g$], label-side: left, "->")
      edge((-1, 0), (0, 0), [$f$], label-side: right, "->")
      edge((-1, -1), (0, -1), [$j$], label-side: left, "->")
      edge((-1, -1), (-1, 0), [$phi$], label-side: right, "->")
      edge((-2, -2), (-1, 0), [$alpha$], label-side: right, "->", bend: -18deg)
      edge((-2, -2), (0, -1), [$beta$], label-side: left, "->", bend: 18deg)
      edge((-2, -2), (-1, -1), "-->")
    }))
  $
  $im(g compose beta) = im(phi compose alpha) = U$である。よって$beta(Z) subset g^(-1) (U) = V$である。ゆえに$h colon Z --> V$を一意的にとって上の図式を可換にできる。

  5を示す。$f colon X --> S$はclosed immersionなので$S$のアフィン開被覆${U_i = Spec(R_i)}_(i in I)$であって，$f^(-1) (U_i) = Spec(R_i \/ I_i)$となるものがある。$Y$のアフィン開被覆${V_j = Spec(B_j)}_(j in J)$であって$g(V_j) subset exists U_i$となるようなものをとれる。$p_Y^(-1) (V_j) = V_j times_S X = Spec(B_j) times_(Spec(R_i)) Spec(R_i\/I_i) = Spec(B_j tensor_R_i (R_i\/I_i)) = Spec(B_j \/ I_i B_j)$である。ゆえに$p_Y$はclosed immersion。
  $
    #align(center, diagram({
      node((-1, -1), [$X times_S Y$])
      node((0, -1), [$Y$])
      node((-1, 0), [$X$])
      node((0, 0), [$S$])
      edge((0, -1), (0, 0), [$g$], label-side: left, "->")
      edge((-1, 0), (0, 0), [$f$], label-side: right, "->")
      edge((-1, -1), (0, -1), [$p_Y$], label-side: left, "->")
      edge((-1, -1), (-1, 0), [$p_X$], label-side: right, "->")
    }))
  $
]

#statementsp(
  box-name: "def",
  box-title: "Separated Morphism",
  box-label: "separated",
  number: true
)[
  $f colon X --> Y$をSchemeの射とする。次のような図式から得られる射
  $
    Delta colon X --> X times_Y X
  $
  を*Diagonal Morphism*とよぶ。
  $
    #align(center, diagram({
      node((-1, 0), [$X times_Y X$])
      node((0, 0), [$X$])
      node((-1, 1), [$X$])
      node((0, 1), [$Y$])
      node((-2, -1), [$X$])
      edge((0, 0), (0, 1), [$f$], label-side: left, "->")
      edge((-1, 1), (0, 1), [$f$], label-side: right, "->")
      edge((-1, 0), (0, 0), [$p_X$], label-side: left, "->")
      edge((-1, 0), (-1, 1), [$p_X$], label-side: right, "->")
      edge((-2, -1), (0, 0), [$id_X$], label-side: left, "->", bend: 18deg)
      edge((-2, -1), (-1, 1), [$id_X$], label-side: right, "->", bend: -18deg)
      edge((-2, -1), (-1, 0), [$Delta$], label-side: center, "-->")
    }))
  $
  $f$が*Separated Morphism*であるとは，この$Delta$がclosed immersionであるときをいう。$f$が明らかなときは単に$X$は$Y$上separatedであるという。単にScheme $X$がseparatedであるというときは，$X$は$Spec(ZZ)$上separatedであることをいう。
]

ところで，位相空間$X$がHausdorffであることの必要十分条件として，対角埋め込み$Delta colon X --> X times X$が閉写像である，という命題がある。Schemeのseparatednessはこの命題を逆手に取ったHausdorffnessの類似である。しかし，注意としてSchemeの台集合がHausdorffになることは滅多にない。例えばAffine Schemeの場合に考えるとこれは常に$"T"_0$ではある。つまり任意の異なる2点に対し，いずれかを含み，もういずれかを含まない開集合が取れる。しかしHausdorffになるためには対応するGlobal sectionsである環$A$がKrull 次元0でなくてはならず，もはや多くの概念が失われることがわかる。言い換えれば，多くの場合Zariski 位相は開集合が少なすぎて，点を区別するほどの能力がないということである。この状況が#Etale 射の定義の動機につながる。

#statementsp(
  box-name: "prop",
  box-title: "",
  box-label: "afineissep",
  number: true
)[
  $f colon X --> Y$をAffine Schemeの間の射とする。このとき$f$はseparatedである。
]
#pfsp[
  $X = Spec(A), Y = Spec(B)$とおく。$X times_Y X cong Spec(A tensor_B A)$である。$Delta$は$A tensor_B A --> A colon a tensor a' mapsto.long a a'$である。これは全射であるから，$Delta$はclosed immersionである。
]

separatedであるためには，$Delta colon X --> X times_Y X$がclosed immersion，つまりこれが位相空間の射として閉埋め込みかつ，付随するSheafの射$Delta^sharp colon cal(O)_(X times_Y X) --> Delta_* cal(O)_X$が全射であることを示さなくてはならない。しかし埋め込み先が閉集合であることさえ示せればいい。

#statementsp(
  box-name: "cor",
  box-title: "",
  box-label: "sepclosed",
  number: true
)[
  $f colon X --> Y$をSchemeの射とする。$f$がseparatedであることと，$Delta(X) subset X times_Y X$が閉集合であることは同値である。
]
#pfsp[
  $f$がseparatedならば$Delta(X)$が閉集合なことは明らか。逆を示す。
  $
    #align(center, diagram({
      node((-1, 0), [$X times_Y X$])
      node((0, 0), [$X$])
      node((-1, 1), [$X$])
      node((0, 1), [$Y$])
      node((-2, -1), [$X$])
      edge((0, 0), (0, 1), [$f$], label-side: left, "->")
      edge((-1, 1), (0, 1), [$f$], label-side: right, "->")
      edge((-1, 0), (0, 0), [$p_1$], label-side: left, "->")
      edge((-1, 0), (-1, 1), [$p_2$], label-side: right, "->")
      edge((-2, -1), (0, 0), [$id_X$], label-side: left, "->", bend: 18deg)
      edge((-2, -1), (-1, 1), [$id_X$], label-side: right, "->", bend: -18deg)
      edge((-2, -1), (-1, 0), [$Delta$], label-side: center, "-->")
    }))
  $
  この図式と集合論的な観察から$Delta$が位相空間の閉埋め込みなことはすぐにわかる。
  $
    Delta^sharp colon cal(O)_(X times_Y X) --> Delta_* cal(O)_X
  $
  これが全射なことを示せばいい。任意に$x in X$をとる。$x$のアフィン開集合$x in U$をとる。$f(x) in Y$のアフィン開集合$f(x) in V$をとる。必要なら$U$を取り換えて$f(U) subset V$となるようにできる。このとき$Delta(x) in U times_V U$であり，これは$X times_Y X$のアフィン開集合。#linksp(<prop:afineissep>)から$U --> U times_V U$はseparatedであるから，$x$の近傍では全射。$x$は任意なので$Delta^sharp$は全射である。
]

次は特異点解消や分類問題に重要な概念であるproperである。

#statementsp(
  box-name: "def",
  box-title: "Proper Morphism",
  box-label: "proper",
  number: true
)[
  $f colon X --> Y$が*Proper*であるとは，次をすべて満たすときをいう。

  + $f$はseparatedである。(#linksp(<def:separated>))
  + $f$はof finite typeである。(#linksp(<def:offin>))
  + $f$はuniversally closedである。すなわち，$f$が閉写像であり，かつ任意の$Y' --> Y$によるベースチェンジ$X times_Y Y' --> Y'$も閉写像である。
]

#pagebreak()

= Historical aspects of Schemes
このchapterでは，スキーム論の必要性などを古典理論との比較や例によって述べる。

ただし，かなり駄文であり導入の動機を知るのは難しいうえに知らずに使っている人も多いだろうから読み飛ばしていいと思う。そもそも真面目に書いていない。

== Algebraic Varieties
代数幾何学という分野は何を目指しているのだろうか？古典的には，方程式の解を求めたり，解空間のふるまいを理解することに始まるだろう。例えばフェルマーの最終定理は$x^n + y^n - z^n = 0$という方程式解に関して理解を求める問題である。厳密にいえば体$k$を固定し，それによる$n$次元空間$AA_k^n = k^n$の中で，有限個の$n$変数多項式$f_1 (x_1,dots, x_n), dots, f_m (x_1,dots, x_n)$をもってきて，それらの共通ゼロ集合を考察する。つまり
$
  V = {(alpha_1, dots, alpha_n) in AA_k^n | f_1 (alpha_1,dots, alpha_n) = 0, dots, f_m (alpha_1,dots, alpha_n) = 0}
$
を考える。さて，これを考察するにあたって一つ重要な思想を提示する。それは「空間は，空間上の関数の情報から復元できるはずだ。」というもの。線形空間$X$を調べたければ，その双対空間$X^*$も見てやれ，ということだ。これによれば$AA_k^n$上の関数をもって$V$を調べたくなる。すると，なにも$f_1,dots,f_m$だけでなく，$V$では消える関数を全部集めたくなる。つまり
$
  I(V) = {f in k[x_1,dots, x_n] | f (alpha_1, dots, alpha_n) = 0 quad forall (alpha_1, dots, alpha_n) in V} subset k[x_1,dots, x_n]
$
としよう。これは自明に$k[x_1, dots, x_n]$のイデアルである。さて，我々が調べたいのは$V$であるから，$k[x_1, dots, x_n]$の中の関数は多すぎる。例えば$f,g$という多項式が$V$上では一致，つまり$f - g in I(V)$であるならこれは区別されてほしくない。そこで，$I(V)$の違いを除きたいのだから，関数の空間としては$k[x_1,dots, x_n]\/I(V)$を考える。これは，$V$上に定義された関数全体の空間と考えられる。さきの思想から，これを$V$だと思って解析を進めればいいはずだ。ここで$I(V)$がどんなものかわからないと話にならない。できれば$I(V) = (f_1, dots, f_m)$となってほしい。しかし少し考えればこれは無理だと分かる。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofscheme3",
  number: true
)[
  $RR$を実数体とする。
  $
    V = {alpha in RR | f(alpha) = 0}
  $
  とする。ただし$f(x) = x^2 + 1$である。明らかに$V = emptyset$である。しかし明らかに$(x^2 + 1) eq.not I(V) = (1)$となり一致しない。
]

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofscheme4",
  number: true
)[
  $CC$を複素数体とする。
  $
    V = {alpha in CC | f(alpha) = 0}
  $
  とする。ただし$f(x) = (x^2 + 1)^2$である。明らかに$V = {i, -i}$である。このとき$I(V) = (x-i, x+i) eq.not ((x^2+1)^2)$となり一致しない。
]

#linksp(<ex:exofscheme3>)は考えている体が代数閉体でないこと，#linksp(<ex:exofscheme4>)は考えている体が代数閉体であっても単純に多項式を集めて作ったイデアルがradical idealでないとうまくいかないことを示している。代数閉体にして，後半のようなずるを無理やり補正してやれば，うまくいくんじゃないか？と思うわけである。実は次が成り立つ。\
(証明はしない。)

#statementsp(
  box-name: "th",
  box-title: "Hilbert's Nullstellensatz",
  box-label: "nullstellensatz",
  number: true
)[
  $k$を代数閉体とする。$frak(a) = (f_1, dots, f_m)$を$k[x_1,dots, x_n]$のイデアルとする。\ 
  このとき$I(V(frak(a))) = sqrt(frak(a))$となる。
]

$V(frak(a)) = {(alpha_1, dots, alpha_n) in AA_k^n | f_i (alpha_1, dots, alpha_n) = 0 quad forall i = 1, dots, m}$である。

これにていい状況なら方程式の解空間の解析は$k[x_1,dots, x_n]\/sqrt(frak(a))$を調べることで達成されると分かる。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofscheme5",
  number: true
)[
  $V = {(alpha_1, alpha_2) in AA_CC^2 | f(alpha_1, alpha_2) = 0}$で，$f = x+y in CC[x,y]$としよう。#linksp(<th:nullstellensatz>)から$I(V) = sqrt((f)) = (x+y)$となる。つまり環$CC[x,y]\/(x+y)$は次のような図を表していると言えよう。

  #align(center)[
    #cetz.canvas({
      plot.plot(
        size: (6, 6),
        axis-style: "school-book",
        x-tick-step: none,
        y-tick-step: none,
        x-min: -5, x-max: 5,
        y-min: -5, y-max: 5,
        {
          plot.add(
            domain: (-5, 5),
            x => -x,
            style: (stroke: black + 1.5pt)
          )
        }
      )
    })
  ]
]

しかしここで問題が生じる。解空間のふるまいを調べたいわけだが，関数の0点しか見ないことの弊害が生まれる。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofscheme6",
  number: true
)[
  $V_1 = {(alpha_1, alpha_2) in AA_CC^2 | f_1 (alpha_1, alpha_2) = 0}$で，$f = y-x^2 in CC[x,y]$としよう。次のような図を表していて，定義環は$CC[x,y]\/(y-x^2)$である。
  #align(center)[
    #cetz.canvas({
        plot.plot(
          size: (3, 3),
          axis-style: "school-book",
          x-tick-step: none,
          y-tick-step: none,
          x-min: -5, x-max: 5,
          y-min: -1, y-max: 5,
          {
            plot.add(
              domain: (-5, 5),
              x => 1/2 * x*x,
              style: (stroke: black + 1.5pt)
            )
          }
        )
    })
  ]
  これと$V_2 = {(alpha_1, alpha_2) in AA_CC^2 | f_2 (alpha_1, alpha_2) = 0}$で，$f_2 = y in CC[x,y]$である代数曲線との共通部分を調べてみよう。共通部分なので二つの多項式$f_1, f_2$いずれでも0にならなければならないから，イデアル$(f_1) + (f_2) = (y-x^2, y)$を考えればいい。
  $
    CC[x,y]\/sqrt((y-x^2, y)) cong CC[x,y]\/(x, y)
  $
  となる。たしかに交点は$(0,0)$しか存在しない。しかしながらこれはとある情報を失っている。それは，この点が二つの代数曲線が接している，つまり見かけ上一点でしか交わっていないが，実は二点分の情報があるということである。
]

#pagebreak()

== Why Schemes?
代数曲線でも解空間をうまく調べられるが，なぜSchemeを考える必要があるのか？それを考えよう。

（Affine）Schemeでは二つの代数曲線の共通部分はどのように観察できようか？集合の圏で共通部分と言ったら，全体空間におけるファイバー積を考えるのと同様に，Schemeでもファイバー積をとって実現する。そうするとどのような構造が吐き出されるか？それを見てもらおう。

#statementsp(
  box-name: "ex",
  box-title: "",
  box-label: "exofscheme7",
  number: true
)[
  #linksp(<ex:exofscheme6>)の二つの代数曲線$V_1, V_2$はそれぞれAffine Schemeとして$(Spec(CC[x,y]\/(y-x^2)), cal(O)_(Spec(CC[x,y]\/(y-x^2))))$と$(Spec(CC[x,y]\/(y)), cal(O)_(Spec(CC[x,y]\/(y))))$である。これらを順に$X_1, X_2$とおく。全体空間はAffine Scheme $(Spec(CC[x,y]), cal(O)_(Spec(CC[x,y])))$である。これを$X$とおく。よって$Sch_(\/X)$におけるファイバー積$X_1 times_X X_2$を考えることで，共通部分をSchemeとして得ることができる。Schemeの圏においてのファイバー積は実は存在して，それは局所的には対応するAffine 開集合たちのファイバー積（これは反変圏同値から環においてテンソルをとる。）で与えられる。つまり
  $
    X_1 times_X X_2 &= Spec((CC[x,y]\/(y-x^2)) tensor_(CC[x,y]) (CC[x,y]\/(y)))\
    & = Spec(CC[x,y]\/(y-x^2, y))\
    & = Spec(CC[x,y]\/(x^2, y))
  $
  となる。

  さて，（可微分）多様体におけるcotangent spaceのscheme論的な類似物として微分加群がある。これによって代数曲線$y-x^2=0$の$(0,0)$における接線の情報を引き出そうとすると
  $
    Omega_((CC[x,y]\/(y-x^2))\/CC) times.o_(CC[x,y]\/(y-x^2)) (CC[x,y]\/(y-x^2))\/(x, y) &= (A d x plus.o A d y)/(d y - 2 x d x) times.o_A A\/(x, y)\
    &= CC d x
  $
  となる（要計算）。さて，$y-x^2=0, y=0$の共通部分はScheme論は上のようなSchemeだと言ってるので，$CC[x]\/(x^2)$の点$(0,0)$での接線の情報を同じく引き出そうとすると
  $
    Omega_((CC[x]\/(x^2))\/CC) times.o_(CC[x]\/(x^2)) (CC[x]\/(x^2))\/(x) &= (A d x)/(2x d x) times.o_A A\/(x)\
    &= CC d x
  $
  となる。一方#linksp(<ex:exofscheme6>)で得てしまった$CC[x,y]\/(x, y)$の点$(0,0)$での接線の情報は
  $
    Omega_((CC[x,y]\/(x, y))\/CC) times.o_(CC[x,y]\/(x, y)) (CC[x,y]\/(x, y))\/(x, y) &= (A d x plus.o A d y) times.o_A A\/(x, y)\
    &= CC d x plus.o CC d y
  $
  となり，異なる情報が出てくる。上二つは$d y = 0$と言っている，つまり$y$方向には微塵も動けませんよ，と言っているので確かに正しそうだ。しかし最後の情報は$y$方向にも動けますよ，と言っているので明らかに間違っている。Schemeを考えることで，このような接線の情報も引き出せるようになる。
]

Schemeが正しい幾何を反映することを見たところで，Schemeを考えるもう一つの動機を説明しよう。今までの例だとAffine Schemeを考える動機はわかっても，真にSchemeを考える意味は分からないと思う。Schemeを考える動機は，Affine Schemeを貼り合わせることで，Affine Schemeでは表現できないような幾何を表現できるようになるからである。というのは，AffineでないSchemeが，やりたい操作の結果出現してしまうことがあるからである。それが特異点解消だ。

代数幾何の重要な目標に，代数多様体の分類をすることがある。@Har77 のp.55には，代数幾何の大きな興味，問題として次があると述べられている。

#quote[
  In Algebraic Geometry such a problem is the classification problem. In its strongest form, the problem is to classify all algebraic varieties up to isomorphism. 
]

同型，とまで行くのは難しいから双有理同値で分類することが当面の目標だろう。さて，代数曲線には分類上あまりうれしくない点があることがある。特異点である。次の@AM69 の演習問題11.1を解いてみよう。

#statementsp(
  box-name: "exer",
  box-title: "",
  box-label: "sing",
  number: true
)[
  $f in k[x_1, dots, x_n]$を代数的閉体$k$上の既約多項式とする。多様体$f(x) = 0$上の点を$P$とする。ある偏導関数$(partial f) / (partial x_i)$が$P$において零でないとき，点$P$は#ruby[●|●|●|●][非|特|異|点]であるという。$A=k[x_1,dots,x_n]\/(f)$とおき，$frak(m)$を点$P$に対応する$A$の極大イデアルとする。このとき，次を示せ。
  #align(center)[
    $P$は非特異点である $<==>$ $A_frak(m)$は正則局所環である。
  ]
  [系11.18より，$dim(A_frak(m)) = n - 1$が成り立つ。いま
  $
    frak(m)\/frak(m)^2 cong (x_1,dots,x_n)\/(x_1,dots,x_n)^2 + (f)
  $
  であり，これが次元$n-1$であるための必要十分条件は$f in.not (x_1,dots,x_n)^2$となることである。]
]
（解答）

$P$は平行移動して$(0, dots, 0)$に移せる。\
$P$が非特異点 $<==>$ $f in.not (x_1,dots,x_n)^2$を示す。\
もし$f in (x_1,dots,x_n)^2$なら，$f = sum_(i, j) a_i x_i x_j$と書ける。これにより
$
  (partial f) / (partial x_i) (P) = 0
$
は自明。よって$P$は特異点。\
反対に$P$が特異点とする。ある$i$が存在して$f$の項に$alpha x_i$というものが残ったとする。$alpha in k$である。すると
$
  (partial f) / (partial x_i) (P) = alpha eq.not 0
$
となり，$P$が特異点であることに反する。よってすべての$i$に対して$f$の項に$alpha x_i$というものが残らない。つまり$f in (x_1,dots,x_n)^2$となる。

（解答終わり）

ちなみに，$f$が既約というのはしっかり使っている。どこで使ったかというと，$A_frak(m)$の次元が$n-1$であるというところに使っている。だからその余接空間$frak(m)\/frak(m)^2$の次元も$n-1$になればよく，それが$P$の特異性とつながるのである。

$(f)$は単項な素イデアルなので高さは1である。多項式環はcatenaryなので$A$の次元は$n-1$である。体上有限生成整域の極大イデアルの高さはすべて等しいので$A_frak(m)$の次元も$n-1$である，という具合だ。

思い出してほしいのだが，Affine Schemeにおいては点$x in X = Spec(A)$におけるstalkが$A_x$という局所環であった。ゆえにSchemeにおいても点$x in X$をとったときのstalkはAffine 開近傍$U = Spec(A)$をとってきて$x$に対応する$A$の素イデアル$frak(p)_x$による局所環$A_frak(p)_x$である。(もとのSheafのstalkと制限されたShaefのstalkは同型になる。)

ということで嫌な点，特異点の定義をしよう。

#statementsp(
  box-name: "def",
  box-title: "Singularities",
  box-label: "sing",
  number: true
)[
  $X$をSchemeとする。点$x in X$が*非特異点*であるとはstalk $cal(O)_(X, x)$が正則局所環であるときをいう。そうでないときは点$x$は*特異点*であるという。

  任意の$x in X$が非特異点であるSchemeを*Regular Scheme*または*非特異Scheme*という。
]

代数幾何の目標として代数多様体を分類しきることがあると述べたが，実は次の定理が成り立つ。

#statementsp(
  box-name: "th",
  box-title: "広中の特異点解消定理",
  box-label: "",
  number: true
)[
  $k$を標数$0$の体とする。$Y$を$k$上of finite typeでintegralなSchemeとする。このとき，$Y$の特異点解消が存在する。つまりRegularなScheme $X$とmodification $X --> Y$の組が必ず存在する。
]

定義してない用語が多いが，要するに$Y$という特異点があるかもしれないSchemeを少しだけ広げて，$X$という特異点の無いSchemeにできますよ，と言っている。これによって代数多様体の双有理同値分類においては，特異点がない場合のみを考えてもいいことになる。

ここで話を戻す。なぜSchemeを考えなくてはいけないのか？Affine Schemeの場合は既に説明した。ではAffineとも限らないSchemeが必要になるのはどんなときだろうか。それが，特異点解消に関係するBlowupである。

#pagebreak()

#statementsp(
  box-name: "ex",
  box-title: "Blowup",
  box-label: "blowup",
  number: true
)[
  $CC$上の代数多様体$z^2 - x y = 0$を考える。

  図を描いてみるとわかるように$(0,0,0)$は特異点である。実際特異点の定義から
  $
    (partial f) / (partial x) (0,0,0) = (partial f) / (partial y) (0,0,0) = (partial f) / (partial z) (0,0,0) = 0
  $
  で，たしかに特異点。代数的には$A = CC[x,y,z]\/(z^2 - x y)$は極大イデアル$(x,y,z)$で局所化すると，正則局所環にならない。

  $A$の原点に対応する極大イデアルを$frak(m)$とかこう。$frak(m) = (x,y,z)$である。Rees代数
  $
    cal(R)(A, frak(m)) = A plus.o frak(m) t plus.o frak(m)^2 t^2 plus.o dots.c subset A[t]
  $
  を考える。これのProjをとるとAffine Schemeにならないらしい。例外曲線が$PP^1$と同型になり，閉部分スキームでアフィンでないものが現れるかららしい。
]

また，古典的な代数多様体はScheme論に含まれることが，次の定理からもわかる。@Har77 p.78

#statementsp(
  box-name: "th",
  box-title: "",
  box-label: "",
  number: true
)[
  $k$を代数閉体とする。$k$上の代数多様体の圏を$"Var"(k)$とかき，$k$上のSchemeの圏を$Sch(k)$とかく。すると，次の自然な忠実充満な関手が存在する。
  $
    t colon "Var"(k) --> Sch(k)
  $
]
#pfsp[
  証明のスケッチをする。まず，古典的な代数多様体よりアフィンスキームの方が明らかに点が多い。例えば$AA_CC^2$の代数曲線$y-x^2$を考える。スキームで言えば$Spec(CC[x,y]\/(y-x^2))$である。前者，つまり
  $
    V = {(alpha_1, alpha_2) in AA_CC^2 | f(alpha_1, alpha_2) = 0} quad f = y-x^2
  $
  は点$(alpha_1,alpha_2)$しか存在しない。これはスキームにおいては閉点，つまり極大イデアル$(x-alpha_1, y-alpha_2)$に対応する。そして$V$内で，この一点の閉包をとっても一点のまま変わらない。しかしアフィンスキームにおいては例えば$X = Spec(CC[x,y]\/(y-x^2))$の$0$イデアルに対応する点があり，それは$overline({0}) = X$となる。一点が全体を生成する，という奇妙な点をも許している。こういう点をgeneric pointという。

  では代数多様体側の足りない点を増やしてやればいい。具体的には，$t(V)$という新しい位相空間を構成する。それは，$V$の非空既約閉集合全体を集めたものである。さらに$t(V)$から$k$へのregular functionを定義し，コネコネするとAffine Schemeになることが示せる。こうして$t$という関手を得て，これが忠実充満であることも示せる。
]

#pagebreak()

= Cohomology
いよいよScheme絡みのCohomologyを定義する。環$R$をとって，Cohomology論を展開するには$R$加群の概念が必要であった。例えば$"Tor"_i^R (M, N)$や$"Ext"_R^i (M, N)$などは代表的な(Co)homologyたちであるが，$R$加群に対して定義されて$R$加群を吐き出す道具である。ゆえに，Scheme論の枠組みに際して加群の概念に相当するものを導入する必要がある。それが$cal(O)_X$加群などと呼ばれているものである。そのうちいい性質をもつものがquasi-coherent shaef, coherent sheafである。quasi-coherent sheafはsheafとしてあんまりずるくない$cal(O)_X$加群であり，coherent sheafは有限表示加群に対応する概念である。これらを定義することでScheme上のCohomologyを展開できる。

== $cal(O)_X$-Modules
Schemeに対する加群の概念を導入しよう。

#statementsp(
  box-name: "def",
  box-title: "Sheaves of Modules",
  box-label: "sheafmod",
  number: true
)[
  $(X, cal(O)_X)$をringed spaceとする。*$cal(O)_X$-module*とは$X$上のsheaf $cal(F)$であって，任意の開集合$U subset X$に対して$cal(F)(U)$が$cal(O)_X (U)$加群になっており，さらに以下のように制限写像と加群の作用が可換であるものをいう。
  $
    #align(center, diagram({
      node((-1, -1), [$cal(O)_X (U) times cal(F)(U)$])
      node((-1, 0), [$cal(O)_X (V) times cal(F)(V)$])
      node((0, -1), [$cal(F)(U)$])
      node((0, 0), [$cal(F)(V)$])
      edge((-1, 0), (0, 0), [$"operation"$], label-side: right, "->")
      edge((-1, -1), (0, -1), [$"operation"$], label-side: left, "->")
      edge((-1, -1), (-1, 0), [$"res"_(U,V)^(cal(O)_X) times "res"_(U,V)^(cal(F))$], label-side: right, "->")
      edge((0, -1), (0, 0), [$"res"_(U, V)^cal(F)$], label-side: left, "->")
    }))
  $
  制限してから作用させても，作用させてから制限しても一緒ということ。

  $cal(O)_X$-moduleの射$cal(F) --> cal(G)$とは，${phi_U}_(U subset X)$という開集合$U$を添え字とした族で，$phi_U colon cal(F)(U) --> cal(G)(U)$が$cal(O)_X (U)$加群の準同型になっているものをいう。
]

$cal(O)_X$加群の圏を$"Mod"(cal(O)_X)$とかく。$cal(O)_X$加群の射のker, coker, imageは$cal(O)_X$-moduleの射になる。ただし，imに関しては単に各射の文字通りのimを割り当てる操作で得られる前層を層化したものである。直和，直積，余極限，極限などもそうである。

$"Mod"(cal(O)_X)$の射の列$cal(F) stretch(-->)^(phi) cal(G) stretch(-->)^(psi) cal(H)$が$cal(G)$で完全であるとは，$im(phi) = ker(psi)$が$cal(G)$の部分層として成立することをいう。ここでもimは前層のimを層化したものであり，層化の普遍性でこれは$cal(G)$の部分層と思えることに注意。

$cal(F)|_U$は$cal(O)_X|_U$加群となる。また，$cal(F) --> cal(G)$に対して
$
  U mapsto.long Hom_(cal(O)_X|_U) (cal(F)|_U, cal(G)|_U)
$
は層になる。これを$cal(Hom)_(cal(O)_X) (cal(F), cal(G))$と書くことにする。

#pagebreak()

#set text(lang: "en")
#bibliography(
  "ref.bib",
  title: "参考文献",
  style: "alpha.csl"
)