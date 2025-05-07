% ---------------------------------------------------------
% Identification
% ---------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mythesis}[2025-05-01 A template for theses]

% ---------------------------------------------------------
% Prelinminary declarations
% ---------------------------------------------------------

% Load base class
\LoadClass[a4paper]{book}

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
    linkcolor=blue!70!black,
    citecolor=black,
    anchorcolor=black,
    urlcolor=teal!70!black,
}

% Fonts
\RequirePackage{fontspec}
\RequirePackage{xeCJK}

% Set chinese fonts
\setCJKmainfont{Source Han Serif SC}[
    BoldFont = *-Bold,
    ItalicFont = *-ExtraLight,
]

% Define font families for styling
\setCJKfamilyfont{zhserif}{Source Han Serif SC}
\setCJKfamilyfont{zhsans}{Source Han Sans SC}
\newcommand{\songti}{\CJKfamily{zhserif}}
\newcommand{\heiti}{\CJKfamily{zhsans}}

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