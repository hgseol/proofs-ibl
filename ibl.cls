% ibl.sty
% Class for Inquiry-based Learning document
% Jim Hefferon jhefferon (at) smcvt.edu
% --- Class structure: identification part
% ---
\ProvidesClass{ibl}[2013/02/26 version 0.01 of Inquiry-based Learning class (Jim Hefferon)]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.min" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.ibl}{}{
%
\PassOptionsToClass{\CurrentOption}{book}}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass{book}

\usepackage{jh}

\usepackage[RGB]{xcolor}
% Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115 
% See also the asy files
\definecolor{lighti}{RGB}{219,213,242}
\definecolor{darki}{RGB}{22,64,89}
\definecolor{base}{RGB}{201,235,242}
\definecolor{darkii}{RGB}{69,115,110}
\definecolor{lightii}{RGB}{242,226,196}



\RequirePackage{hyperref}
% From http://en.wikibooks.org/wiki/LaTeX/Hyperlinks
\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitW},    % fits the width of the page to the window
    pdftitle={Proofs},    % title
    pdfauthor={Jim Hefferon},     % author
    pdfsubject={Mathematical Proofs},   % subject of the document
    pdfcreator={Jim Hefferon},   % creator of the document
    pdfproducer={pdflatex}, % producer of the document
    pdfkeywords={proofs} {Free textbook} {Inquiry-based} {Moore method}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=black,          % color of internal links (change box color with linkbordercolor)
    citecolor=black,        % color of links to bibliography
    filecolor=black,      % color of file links
    urlcolor=black           % color of external links
}


% ========================================
% Page layout
\RequirePackage[left=1.45in,right=1.45in,top=1in,bottom=1in]{geometry}

\RequirePackage[english]{isodate}
\isodate

\RequirePackage{fancyhdr}
% \renewcommand\footrule{\begin{minipage}{1\textwidth}
% \color{darkii}\hrule width \hsize height 0.8pt   
% \end{minipage}\par}%

% \renewcommand\headrule{
% \begin{minipage}{1\textwidth}\vspace*{-2ex}
% \color{darkii}\hrule width \hsize height 0.8pt
% \end{minipage}}%

\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{prefacepage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{bodypage}{%
\fancyhf{}% clear all six fields
\fancyhead[RE,LO]{\small Hef{}feron, \today}
\fancyhead[LE,RO]{\small page \thepage}
\renewcommand{\headrulewidth}{0.7pt}
\renewcommand{\footrulewidth}{0pt}
}

\pagestyle{prefacepage}
\AtBeginDocument{\thispagestyle{firstpage}}


% ========================================
% Preface has epigrams set in ragged
\RequirePackage{ragged2e}


% ========================================
\usepackage{mathtools}  % imports amsmath
\DeclarePairedDelimiter\absval{\lvert}{\rvert}%
\newcommand{\lcm}{\operatorname{lcm}}

\RequirePackage{amsthm}
\renewcommand{\qedsymbol}{\rule{0.5em}{2ex}}
% ========================================
% Exercises are inside environments
\RequirePackage{thmtools}
\usepackage{
nameref, %\nameref
hyperref, %\autoref
% n.b. \Autoref is defined by thmtools
cleveref, % \cref
% n.b. cleveref after! hyperref
}

% Count the number of exercises so a person can comment some out to adjust
% the semester-long number.
\newcounter{exercisecount}
\AtEndDocument{\typeout{Total number of exercises: \theexercisecount}.}

\declaretheoremstyle[
spaceabove=1.1ex plus .1ex, spacebelow=1.1ex plus .2ex minus .1ex,
headfont=\normalfont\scshape,
notefont=\mdseries, notebraces={(}{)},
bodyfont=\normalfont,
headformat={\NUMBER\hspace*{0.5em}\NAME.\spacefactor=1000 \NOTE},
headpunct={},
postheadspace=0.5em,
qed=\qedsymbol
]{jhstyle}
\newcommand{\notetext}[1]{(\textsc{#1})\hspace{0.35em}} % such as \item \notetext{Transitivity}

% \newcommand{\exercisename}{Exercise}
\theoremstyle{jhstyle}
\declaretheorem[name=Exercise,numberwithin=chapter]{ex}
\addtotheorempreheadhook[ex]{\addtocounter{exercisecount}{1}} % count exery ex
\declaretheorem[name=Definition,sibling=ex]{df} % see defn of \definend
\declaretheorem[name=Note,sibling=ex]{nt}
\declaretheorem[name=Axiom,numberwithin=chapter]{ax}


% ========================================
% Chapter formatting
\RequirePackage[sc,medium,compact,raggedright,nobottomtitles,clearempty]{titlesec}
% \titleformat{command}[shape]{format}{label}{sep}{before-code}[after-code]
% \titlespacing*{command}{left}{before-sep}{after-sep}[right-sep]  % *-d form omits paragraph indent after title
\titleformat{\chapter}[block]{\color{darki}\Large\scshape}{Chapter \thechapter}{1em}{}[\thispagestyle{firstpage}]
\titlespacing*{\chapter}{0em}{4ex}{2ex} 
\titleformat{\section}[block]{\color{darki}\large\scshape}{}{0em}{}[]
\titlespacing*{\section}{0em}{7ex}{1ex} 
% \titleformat{\chapter}[display]{\color{darki}\Large\scshape}{\filleft\MakeUppercase{\chaptertitlename} {\Huge\thechapter}}{1em}{}[\thispagestyle{firstpage}]
% \titlespacing*{\chapter}{0em}{4ex}{2ex} 
% \titleformat{\section}[block]{\large\scshape}{}{0em}{}[]
% \titlespacing*{\section}{0em}{7ex}{1ex} 

% ========================================
% Lists
\RequirePackage{enumitem}

% Count number of exercises with parts; see also counter exercisecount
\newcounter{exerciseswithpartscount}
\AtEndDocument{\typeout{Number of exercises with parts: \theexerciseswithpartscount}.}
\newcounter{exercisepartscount}
\AtEndDocument{\typeout{Count of parts: \theexercisepartscount}.}
\AtEndDocument{\typeout{Number for students to do is Total-Number+Count.}}

% Exercises sometimes have multiple parts.
\newenvironment{exes}{%
\addtocounter{exerciseswithpartscount}{1}%
\begin{enumerate}[topsep=0.15ex,partopsep=0ex,parsep=0ex,itemsep=.25ex,
                  leftmargin=1.5em,rightmargin=0em,
                  align=left,label={\textsc{\alph*}.\protect\addtocounter{exercisepartscount}{1}}] 
}{%
\end{enumerate}
}

% ========================================
% Font
\usepackage{fourier}
\usepackage[T1]{fontenc}

% Font of chapter and section titles
% \usepackage{titling}
% \usepackage{fontspec}
% % Specify different font for section headings
% \newfontfamily\headingfont[]{GFS Solomos}
% \titleformat*{\section}{\LARGE\headingfont}
% \titleformat*{\subsection}{\Large\headingfont}
% \titleformat*{\subsubsection}{\large\headingfont}
% \renewcommand{\maketitlehooka}{\headingfont}



% ========================================
% Convenient definitions


% Vulgar fractions
\RequirePackage{xfrac}

% Script characters
\RequirePackage{mathrsfs}
\newcommand{\eqcl}[1]{{\mathscr E}_{#1}}

% Misc commands
\newcommand{\definend}[1]{\textit{#1}}
\newcommand{\pord}{Prove or disprove}
\DeclareMathOperator{\add}{add}
\DeclareMathOperator{\mul}{mul}
\newcommand*{\symdiff}{\mathbin{\triangle}}

