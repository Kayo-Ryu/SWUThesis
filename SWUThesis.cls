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
\setCJKmainfont[AutoFakeBold,ItalicFont={simsun}]{simsun.ttf}
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

%Information Setting
\newtoks\college 
\newtoks\major   
\newtoks\grade   
\newtoks\authorid
\newtoks\author  
\newtoks\advisor 
\newtoks\entitle
\newtoks\abstract
\newtoks\enabstract
\newtoks\keywords
\newtoks\enkeywords
\newtoks\encollege
\newtoks\enname

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
        题\hspace{1.2em} 目\LenthFixedUnderline[10cm]{\@title}\\

        \vspace*{38pt}
        \zihao{-2}
        \hwzs
        \renewcommand{\arraystretch}{1.42}
        \begin{tabular}{rl}
            学\hspace{3.5em}院                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{\the \college }\\
            专\hspace{3.5em}业                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{\the \major   }\\
            年\hspace{3.5em}级                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{\the \grade   }\\
            学\hspace{3.5em}号                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{\the \authorid}\\
            姓\hspace{3.5em}名                                      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{\the \author  }\\
            指\hspace{0.5em}导\hspace{0.5em}教\hspace{0.5em}师      & \hspace{-0.3em} \LenthFixedUnderline[6.6cm]{\the \advisor }\\
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
        \zihao{3} \textsf{\@title}\\
        \vspace*{16pt}
        \zihao{-4} \the \author\\
        \zihao{5}西南大学\the \college，重庆\quad400715\\
        \vspace*{16pt}
    \end{center}
    \zihao{5}\simfang\noindent 摘要：\the \abstract\\
    \simsun \noindent 关键词：\the \keywords\\
    \addcontentsline{toc}{section}{Abstract}
    \begin{center}
        \vspace*{16pt}
        \zihao{4}\textbf{\the \entitle}\\
        \vspace*{16pt}
        \zihao{5} \the \enname\\
        \zihao{-5} \the \encollege, Southwest University, Chongqing  400715, PR China\\
        \vspace*{16pt}
    \end{center}
    \zihao{5}\noindent Abstract: \the \enabstract\\
    \noindent Keywords: \the \enkeywords
    \newpage
    \renewcommand{\arraystretch}{1.5}
}

\titleformat{\section}{\centering\zihao{4}\sf}{第\,\thesection\,章}{1em}{}

%Reference Setting
\newcommand\makereference{
    \newpage
    \addcontentsline{toc}{section}{参考文献}
    \begingroup
    \makeatletter
    \def\section{\@startsection{section}{1}{\z@}{3.0ex plus 1.5ex minus 1.5ex}% V1.6 3.0ex from 3.5ex
    {0.7ex plus 1ex minus 0ex}{\normalfont\zihao{-4}\raggedright}}%
    \renewcommand\refname{\leftline{\textit{\textbf{参考文献}}}}
    \zihao{5}
    \bibliographystyle{gbt7714-2005}
    \bibliography{reference.bib}
    \makeatother
    \endgroup
}

%Appendix Setting
\newcommand\makeappendix{
    \newpage
    \addcontentsline{toc}{section}{附录}
    \zihao{-2}\noindent\textsf{附录}
}
