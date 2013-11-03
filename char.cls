\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{char}[2013/09/12 Homework template]

\LoadClass[12pt]{article}

\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{xparse}
\RequirePackage{mathpazo}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{boxedminipage}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage{calc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{listings}

\def\char@name{}
\def\char@class{}
\def\char@assignment{}
\def\char@duedate{}

\DeclareDocumentCommand\name{m}{\def\char@name{#1}}
\DeclareDocumentCommand\class{m}{\def\char@class{#1}}
\DeclareDocumentCommand\assignment{m}{\def\char@assignment{#1}}
\DeclareDocumentCommand\duedate{m}{\def\char@duedate{#1}}

\DeclareDocumentCommand\makeheader{}{%
  \begin{flushright}%
    \mbox{\char@name}\protect\\%
    \mbox{\char@class}\protect\\%
    \mbox{\char@assignment}\protect\\%
    \mbox{\char@duedate}\protect\\%
  \end{flushright}%
}

\AtBeginDocument{%
  \setlength{\pdfpageheight}{\paperheight}%
  \setlength{\pdfpagewidth}{\paperwidth}%
  \makeheader%
}

\newtoggle{char@noheader}
\newlength{\myl}%
\newlength{\myh}%

\NewDocumentEnvironment{prob}{o}{%
  \def\char@probnum{#1}%
  \global\toggletrue{char@noheader}%
  \settowidth{\myl}{\textbf{\char@probnum}}%
  \settoheight{\myh}{\textbf{\char@probnum}}%
  \global\setlength\parindent{12mm}%
}{%
}

\NewDocumentEnvironment{probh}{}{%
  \global\togglefalse{char@noheader}%
  \bigskip%
  \noindent%
  \begin{boxedminipage}{\columnwidth}%
    \textbf{\char@probnum}%
}{%
  \end{boxedminipage}%
}

\NewDocumentEnvironment{probpart}{o}{%
  \indent%
  \begin{boxedminipage}{\dimexpr\textwidth-\parindent\relax}%
  \textbf{#1}%
}{%
  \end{boxedminipage}\\%
  \iftoggle{char@noheader}{%
    \begin{tikzpicture}[remember picture,overlay,shift={(0,16mm)}]%
    \draw (0.5\myl+1.3mm,-0.5\myh-1.25mm) node [rectangle,draw,line width=0.15mm,inner sep=1.2mm] {\textbf{\char@probnum}};%
    \draw[-,line width=0.15mm] (0,0) to (\textwidth,0);%
    \end{tikzpicture}%
    \global\togglefalse{char@noheader}%
  }{%
  }%
}
\NewDocumentEnvironment{sol}{o}{\indent}{\ \\}
\newenvironment{sollem}[2]{%
  \textbf{#1}\hspace{5mm}\textit{#2}%
  \begin{adjustwidth}{10mm}{0mm}\hspace{4ex}%
}{%
\nolinebreak$\blacksquare$\end{adjustwidth}\ \\%
}
\input{math.tex}
\usepackage{lipsum}
\usepackage{changepage}
\input{unicode.tex}
