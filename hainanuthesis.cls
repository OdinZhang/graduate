\ProvidesClass{hainanuthesis}
\LoadClass[linespread=1.5,a4paper,zihao=-4,fontset=windows]{ctexart}

% 代码高亮
\RequirePackage{minted}

% 图片
\RequirePackage{graphicx}

% 表格
\RequirePackage{booktabs}

% 数学
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% 英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% 算法
\RequirePackage[linesnumbered, ruled, vlined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}

% 引入LaTeX3
\RequirePackage{expl3}

\renewcommand{\title}[1]{\gdef\@title{#1}\newcommand{\thistitle}{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}\newcommand{\thisauthor}{#1}}
\newcommand{\id}[1]{\newcommand{\thisid}{#1}}
\newcommand{\grade}[1]{\newcommand{\thisgrade}{#1}}
\newcommand{\faculty}[1]{\newcommand{\thisfaculty}{#1}}
\newcommand{\department}[1]{\newcommand{\thisdepartment}{#1}}
\newcommand{\major}[1]{\newcommand{\thismajor}{#1}}
\newcommand{\teacher}[1]{\newcommand{\thisteacher}{#1}}

% 书签
\RequirePackage[hidelinks]{hyperref}

% 页面布局
\RequirePackage{geometry}
\geometry{top=2.54cm,bottom=2.54cm,left=4.17cm,right=3.17cm}
\ctexset{
	abstractname={\zihao{3}\textbf{\ziju{4}摘要}},
	contentsname={\begin{center}\zihao{3}\textbf{\ziju{4}目录}\end{center}},
	section/format={\zihao{3}\bfseries\noindent},
	subsection/format={\zihao{4}\bfseries\noindent},
	subsubsection/format={\zihao{-4}\bfseries\noindent},
}

% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[C]{\zihao{-5}\thistitle}
\fancyhead[L,R]{}

\ExplSyntaxOn
% 定义关键字
\newcommand{\keywords}[2][zh]{
\str_if_eq:nnTF{#1}{zh}
{\str_set:Nn\l_keywords_str{关键字：}}
{\str_set:Nn\l_keywords_str{Keywords:}}
\par{\noindent\textbf{\str_use:N\l_keywords_str}}~{#2}
}

% 重定义摘要环境
\renewenvironment{abstract}[1][zh]{
	\str_if_eq:nnTF{#1}{zh}
	{\tl_set:Nn\l_abstract_tl{\ziju{4}摘要}}
	{\tl_set:Nn\l_abstract_tl{Abstract}}
	\begin{center}
		{\zihao{3}\textbf{\tl_use:N\l_abstract_tl}\vspace{-.5em}\vspace{\z@}}
	\end{center}
	\quotation
}{\endquotation}
\ExplSyntaxOff

% 目录格式
\RequirePackage{titletoc}
\titlecontents{section}[0em]{}{\thecontentslabel~~}{}{\hspace{.5em}\titlerule*[.6pc]{\tiny\textbullet}\contentspage}
\titlecontents{subsection}[0em]{}{\thecontentslabel~~}{}{\hspace{.5em}\titlerule*[.6pc]{\tiny\textbullet}\contentspage}
\titlecontents{subsubsection}[0em]{}{\thecontentslabel~~}{}{\hspace{.5em}\titlerule*[.6pc]{\tiny\textbullet}\contentspage}

% 标号
\RequirePackage{cleveref}
\crefformat{figure}{#2图~#1#3}
\crefrangeformat{figure}{图~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{equation}{#2~(#1#3)}
\crefrangeformat{equation}{~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{equation}{~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{algorithm}{#2算法#1#3}

\crefformat{section}{#2#1#3~节}
\crefformat{subsection}{#2#1#3~节}
\crefformat{subsubsection}{#2#1#3~节}

\RequirePackage{caption}
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{five}{\zihao{5}}
\DeclareCaptionFont{bf}{\bf}
\captionsetup[figure]{%
	format=hang,
	labelsep=quad,
	font={song,five,bf},
	position=bottom
}
\captionsetup[table]{%
	format=hang,
	labelsep=quad,
	font={song,five,bf},
	position=top
}

% 致谢
\newenvironment{acknowledge}{
	\begin{center}
		{\zihao{3}\textbf{致谢}}
	\end{center}
	\addcontentsline{toc}{section}{致谢}
	\par
}{\null}

% 参考文献
\RequirePackage[style=hainanu]{biblatex}
\renewcommand{\bibfont}{\zihao{5}}
\defbibheading{bibliography}[\bibname]{%
	\section*{\begin{center}{\zihao{3}\textbf{#1}}\end{center}}%
	\markboth{#1}{#1}}
\newcommand{\printbib}{
	\addcontentsline{toc}{section}{参考文献} % TODO 初步修复，对于换页还是会出错
	\printbibliography[title={参考文献}]
}

% 附件
\newcommand{\addons}{
	\section*{附件}
	\addcontentsline{toc}{section}{附件}
}

% 封面
\newcommand{\coveritem}[2]{{{#1}：}{\underline{\makebox[14.5\ccwd]{#2}}}\\\vspace{-1.9bp}}
\newcommand{\makecover}{
	\newgeometry{top=2.54cm,bottom=2.54cm,left=3.17cm,right=3.17cm}
	\thispagestyle{empty}
	\vspace*{42bp}
	\begin{center}
		{\songti\zihao{1}\ziju{0.5}海南大学}
	\end{center}
	\vspace{8bp}
	\begin{center}
		{\heiti\zihao{1}{\ziju{0.5}毕业论文}（设计）}
	\end{center}
	\vspace{130bp}
	\begin{center}
		{\zihao{3}
			\coveritem{\ziju{2}题目}{\thistitle}
			\coveritem{\ziju{2}学号}{\thisid}
			\coveritem{\ziju{2}姓名}{\thisauthor}
			\coveritem{\ziju{2}年级}{\thisgrade}
			\coveritem{\ziju{2}学院}{\thisfaculty}
			\coveritem{\ziju{2}系别}{\thisdepartment}
			\coveritem{\ziju{2}专业}{\thismajor}
			\coveritem{指导教师}{\thisteacher}
			{完成日期：\makebox[14.5\ccwd]{\makebox[3\ccwd]{2022}年\makebox[2.5\ccwd]{5}月\makebox[2.5\ccwd]{15}日}\\}
		}
	\end{center}
	\newpage
	\setcounter{page}{1}
	\restoregeometry
}