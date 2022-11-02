\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SWUThesis}[2021/01/01]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}
\RequirePackage{xeCJKfntef}
\RequirePackage{array}
\def\FixedLenthUnderline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\LenthFixedUnderline{\@ifnextchar[\FixedLenthUnderline\CTEXunderline}


\RequirePackage{graphicx}

%Page Setting
\RequirePackage[a4paper]{geometry}
\geometry{
  left=27mm,
  right=27mm,
  top=37mm, 
  bottom=35mm,
  heightrounded,
}

%Font Setting
\RequirePackage{ctex}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setCJKmainfont[AutoFakeBold]{simsun.ttf}
\setCJKsansfont[AutoFakeBold]{simhei.ttf} 
\setCJKfamilyfont{simsun}{simsun.ttf}
\setCJKfamilyfont{simkai}{simkai.ttf}
\setCJKfamilyfont{hwzs}{hwzs.ttf}
\setCJKfamilyfont{simfang}{simfang.ttf}
\newcommand{\simkai}{\CJKfamily{simkai}}
\newcommand{\hwzs}{\CJKfamily{hwzs}}
\newcommand{\simsun}{\CJKfamily{simsun}}
\newcommand{\simfang}{\CJKfamily{simfang}}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

%Title Page Setting
\renewcommand\maketitle{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}

        \vspace*{26pt}
        \includegraphics[width=5.13cm,height=1.46cm]{SWULogo.png}\\

        \vspace*{26pt}
        {\zihao{1}\textsf{本科毕业论文（设计）}}

        \vspace*{79pt}
        \zihao{2}
        \hwzs
        题\hspace{1.2em} 目\LenthFixedUnderline[9.2cm]{}\\

        \vspace*{38pt}
        \zihao{-2}
        \hwzs
        \renewcommand{\arraystretch}{1.42}
        \begin{tabular}{rl}
            学\hspace{3.5em}院                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
            专\hspace{3.5em}业                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
            年\hspace{3.5em}级                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
            学\hspace{3.5em}号                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
            姓\hspace{3.5em}名                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
            指\hspace{0.5em}导\hspace{0.5em}教\hspace{0.5em}师      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
            成\hspace{3.5em}绩                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{}\\
        \end{tabular}

        \vspace*{51pt}
        \zihao{3}
        {\hspace*{2.5em}年\hspace{2em}月\hspace{2em}日}
    \end{center}
    \clearpage
}
%Contents Setting
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\newcommand\makecontents{
    \pagenumbering{Roman}
    \setcounter{page}{1}
    \renewcommand{\contentsname}{\centering\zihao{3}\textsf{目\hspace*{1em}录}}
    \zihao{-4}
    \renewcommand{\arraystretch}{2}
    \titlecontents{section}[0pt]{}{第\thecontentslabel\ 章\quad}{}{\titlerule*[8pt]{.}\contentspage}[\vspace*{0.5em}]
    \titlecontents{subsection}[0pt]{}{\thecontentslabel\quad}{}{\titlerule*[8pt]{.}\contentspage}[\vspace*{0.5em}]
    \titlecontents{subsubsection}[0pt]{}{\thecontentslabel\quad}{}{\titlerule*[8pt]{.}\contentspage}[\vspace*{0.5em}]
    \tableofcontents
}

%Abstract Setting
\newcommand\makeabstract{
    \newpage
    \addcontentsline{toc}{section}{摘要}
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \begin{center}
        \zihao{3} \textsf{题目}\\
        \vspace*{16pt}
        \zihao{-4} 姓名\\
        \zihao{5}西南大学电子信息工程学院，重庆\quad400715\\
        \vspace*{16pt}
    \end{center}
    \zihao{5}\simfang\noindent 摘要：摘要\\
    \simsun \noindent 关键词：关键词\\
    \addcontentsline{toc}{section}{Abstract}
    \begin{center}
        \vspace*{16pt}
        \zihao{4}\textbf{Title}\\
        \vspace*{16pt}
        \zihao{5} LIU Jiayu\\
        \zihao{-5} School of XXX, Southwest University, Chongqing  400715, PR China\\
        \vspace*{16pt}
    \end{center}
    \zihao{5}\noindent Abstract: Abstract\\
    \noindent Keywords: Keywords
    \newpage
}
\renewcommand{\arraystretch}{1.5}
\titleformat{\section}{\centering\zihao{4}\sf}{第\,\thesection\,章}{1em}{}

\newcommand\makeappendix{
    \newpage
    \addcontentsline{toc}{section}{附录}
    \zihao{-2}\noindent\textsf{附录}
}
