% ---------------------------------------------------------
% Identification
% ---------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mythesis}[2025-05-01 A template for theses]

% ---------------------------------------------------------
% Prelinminary declarations
% ---------------------------------------------------------

% Load base class
\LoadClass[a4paper,oneside]{book}

% Page layout
\RequirePackage{geometry}

\geometry{
    a4paper,
    left=3.2cm,
    right=3.2cm,
    top=3.8cm,
    bottom=3.8cm,
    headheight=3cm,
    footskip=3cm,
    bindingoffset=0cm,
}

% Colors
\RequirePackage{xcolor}

% Hyperlinks
\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true,  
    linkcolor=magenta,
    citecolor=blue!70!black,
    anchorcolor=black,
    urlcolor=teal!70!black,
}

% For math 
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% For theorem environments
\RequirePackage{amsthm}
\RequirePackage{thmtools}

% Define styles for the theorem environments
\declaretheoremstyle[spaceabove=6pt,
                     spacebelow=6pt,
                     headfont=\normalfont\bfseries,
                     notefont=\bfseries,
                     notebraces={(}{)},
                     bodyfont=\itshape,
                     postheadspace=0.5em,
                     numberwithin=section]{thmsty}

\declaretheoremstyle[spaceabove=6pt,
                     spacebelow=6pt,
                     headfont=\normalfont\bfseries,
                     notefont=\bfseries,
                     notebraces={(}{)},
                     bodyfont=\itshape,
                     postheadspace=0.5em,
                     numberwithin=section]{lemsty}
                     
\declaretheoremstyle[spaceabove=6pt,
                     spacebelow=6pt,
                     headfont=\normalfont\bfseries,
                     notefont=\bfseries,
                     notebraces={(}{)},
                     bodyfont=\itshape,
                     postheadspace=0.5em,
                     numberwithin=section]{propsty}

\declaretheoremstyle[spaceabove=6pt,
                     spacebelow=6pt,
                     headfont=\normalfont\bfseries,
                     bodyfont=\normalfont,
                     postheadspace=0.5em,
                     numbered=no,
                     qed=\qedsymbol]{prfsty}

\declaretheoremstyle[spaceabove=6pt,
                     spacebelow=6pt,
                     headfont=\normalfont\bfseries,
                     notefont=\bfseries,
                     notebraces={(}{)},
                     bodyfont=\normalfont,
                     postheadspace=0.5em,
                     numberwithin=section]{defsty}
                     
% Declare theorem environments
\declaretheorem[shaded={bgcolor=magenta!10!white},style=thmsty]{theorem}
\declaretheorem[shaded={bgcolor=gray!20!white},style=lemsty,numberlike=theorem]{lemma}
\declaretheorem[shaded={bgcolor=blue!10!white},style=defsty,numberlike=theorem]{definition}
\declaretheorem[shaded={bgcolor=orange!10!white},style=propsty,numberlike=theorem]{proposition}
\declaretheorem[style=prfsty,numberlike=theorem]{Proof}

% Fonts
\RequirePackage{fontspec}

% For Chinese fonts
\RequirePackage{xeCJK}

\xeCJKsetup{
    CJKspace = true, % add space between Chinese and English
    CJKecglue = \hspace{0.2em},
}

% Set English font
\setmainfont{XCharter}[
    Path       = /usr/local/texlive/2024/texmf-dist/fonts/opentype/public/xcharter/,
    Extension  = .otf,
    UprightFont= *-Roman,
    BoldFont   = *-Bold,
    ItalicFont = *-Italic,
    SlantedFont = *-Slanted,
    BoldItalicFont = *-BoldItalic,
    BoldSlantedFont = *-BoldSlanted,
]

% Set Chinese fonts
\setCJKmainfont{Source Han Serif SC}[
    BoldFont = *-Bold,
    ItalicFont = *-ExtraLight,
]

\setCJKmonofont{Source Han Mono SC}[
    Scale = MatchLowercase,
]

% Define font families for styling
\setCJKfamilyfont{zhserif}{Source Han Serif SC}
\setCJKfamilyfont{zhsans}{Source Han Sans SC}
\newcommand{\songti}{\CJKfamily{zhserif}}
\newcommand{\heiti}{\CJKfamily{zhsans}}

% Glossary support
\RequirePackage[xindy,symbols,style=indexgroup]{glossaries}

% Glossary Configuration
% \makenoidxglossaries % command for noidx
\makeglossaries % 


% Command to load the symbol source file
\newcommand{\loadsymbols}[1]{
    \IfFileExists{#1}{
        \input{#1}
    }{
        \ClassWarning{mythesis}{Symbols file '#1' not found!}
    }
}

% Command to print the Glossary
\newcommand{\printlistofsymbols}{
    \printglossary[type=symbols, title={List of Symbols}]
}

% Header and footers
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{} % Clear default headers/footers

\fancyhead[C]{\rightmark}
\fancyfoot[C]{\thepage}

% ---------------------------------------------------------
% Options
% ---------------------------------------------------------

% ---------------------------------------------------------
% More declarations
% ---------------------------------------------------------

% Space between paragraphs
\setlength{\parskip}{0.3em plus 0.1em minus 0.1em}

%% Define cover page elements
%  the cover page elements for thesis 
\newcommand{\thesistype}[1]{\def\@thesistype{#1}}
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\thesisauthor}[1]{\def\@thesisauthor{#1}}
\newcommand{\thesisinstitute}[1]{\def\@thesisinstitute{#1}}

%  the cover page elements for notes
\newcommand{\notetitle}[1]{\def\@notetitle{#1}}
\newcommand{\noteauthor}[1]{\def\@noteauthor{#1}}
\newcommand{\noteother}[1]{\def\@noteother{#1}} % other information about notes

% Cover page
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{center}
        {\fontsize{22pt}{33pt}\selectfont\bfseries\@thesistype} \\
        \vspace{2cm}
        {\fontsize{16pt}{24pt}\selectfont\bfseries\@thesistitle} \\
        \vspace{2cm}
        {\fontsize{12pt}{18pt}\selectfont\@thesisauthor} \\
        \vspace{2cm}
        {\fontsize{12pt}{18pt}\selectfont\@thesisinstitute}
    \end{center}
}

\newcommand{\abstractname}{\heiti 摘要}
\newenvironment{abstract}[1][\abstractname]{
    \vspace*{2cm}
    \begin{center}
        #1
    \end{center}

}{
    \vspace{1.5cm}
}