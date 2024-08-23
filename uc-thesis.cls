\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uc-thesis}[2024/07/23 v0.7.0 University of Coimbra LaTeX Thesis Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Options %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load kvoptions package
\RequirePackage{kvoptions}

% Setup key-value option handling with kvoptions
\SetupKeyvalOptions{
  family=ucthesis,
  prefix=ucthesis@
}
% Define the keys with optional default values
\DeclareStringOption[portuguese]{main}  % Default to Portuguese for the main language
\DeclareStringOption[english]{alt}  % Default to English for alt language

% Thesis Level
\newif\if@msc
\newif\if@phd
\DeclareOption{msc}{\@msctrue\@phdfalse}
\DeclareOption{phd}{\@mscfalse\@phdtrue}

% Faculty Options
\newif\if@fcdefuc
\newif\if@fctuc
\newif\if@fduc
\newif\if@feuc
\newif\if@ffuc
\newif\if@fluc
\newif\if@fmuc
\newif\if@fpceuc

% Define the faculty selection function
\newcommand{\setfaculty}[1]{%
    \@fcdefucfalse\@fctucfalse\@fducfalse\@feucfalse\@ffucfalse\@flucfalse\@fmucfalse\@fpceucfalse
    \csname @#1true\endcsname
}

\DeclareOption{fcdefuc}{\setfaculty{fcdefuc}}
\DeclareOption{fctuc}{\setfaculty{fctuc}}
\DeclareOption{fduc}{\setfaculty{fduc}}
\DeclareOption{feuc}{\setfaculty{feuc}}
\DeclareOption{ffuc}{\setfaculty{ffuc}}
\DeclareOption{fluc}{\setfaculty{fluc}}
\DeclareOption{fmuc}{\setfaculty{fmuc}}
\DeclareOption{fpceuc}{\setfaculty{fpceuc}}

% % Handle unspecified options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% Process options
\ProcessKeyvalOptions*

% Process options
\ProcessOptions\relax

% Assign the processed options to internal commands
\newcommand{\primarylang}{\ucthesis@main}
\newcommand{\secondarylang}{\ucthesis@alt}

% Load the book class
\LoadClass[12pt]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Required Packages %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[\secondarylang,\primarylang]{babel}

\RequirePackage{amsmath} % Provides advanced math functionalities (e.g., multi-line equations)
\RequirePackage{amsthm}  % Supports theorem-like environments (e.g., theorem, lemma, proof)
\RequirePackage{amssymb} % Provides additional mathematical symbols
\RequirePackage{afterpage} % Allows execution of commands after a page has been output
\RequirePackage[nooneline,footnotesize]{caption} % Customizes captions for figures and tables
\RequirePackage{fancyhdr} % Customizes headers and footers in the document
\RequirePackage[flushmargin,hang]{footmisc} % Customizes footnote layout and appearance

% Check if we're using XeLaTeX or LuaLaTeX, and default to PDFLaTeX if neither XeLaTeX nor LuaLaTeX is detected
\RequirePackage{ifxetex} % Detects if the document is compiled with XeLaTeX
\RequirePackage{ifluatex} % Detects if the document is compiled with XeLaTeX
\ifxetex
    \RequirePackage[xetex]{geometry} % Sets page dimensions
    \RequirePackage[xetex]{graphicx} % Includes graphics
    \RequirePackage[xetex,bookmarksnumbered]{hyperref} % Adds hyperlinks to the document
    \RequirePackage{fontspec} % Provides font selection and customization
    % \RequirePackage{xltxtra} % Provides extra features for XeLaTeX (e.g., better font handling)
    \defaultfontfeatures{Ligatures=TeX}
\else\ifluatex
    \RequirePackage[luatex]{geometry}
    \RequirePackage[luatex]{graphicx}
    \RequirePackage[luatex,bookmarksnumbered]{hyperref}
    \RequirePackage{fontspec}
\else
    \RequirePackage[pdftex]{geometry}
    \RequirePackage[pdftex]{graphicx}
    \RequirePackage[pdftex,bookmarksnumbered]{hyperref}
\fi\fi

% \RequirePackage{metalogo} % Provides logos for MetaFont and LaTeX logos
\RequirePackage[numbers,sort&compress]{natbib} % Manages bibliography with numeric citations (e.g., [1,2,3])
\bibliographystyle{unsrtnat} % Sets bibliography style to numeric and unsorted
\RequirePackage{url} % Provides URL formatting and handling
\RequirePackage{tikz} % Provides a powerful tool for creating graphics programmatically
\RequirePackage{titlesec} % Customizes section headings and title formats
\RequirePackage{titletoc} % Customizes table of contents and lists of figures/tables
\RequirePackage{tocbibind} % Adds bibliography, glossary, etc., to the table of contents
\RequirePackage{xcolor} % Provides color options for text and elements
% \RequirePackage{xkeyval} % Provides key-value option handling for packages
\RequirePackage{pdfpages} % Includes external PDF pages in the document
\RequirePackage{pdfpages} % VERIFY THE RELEVANCE OF THE PACKAGE

\RequirePackage{import} % Facilitates file import and handling
\RequirePackage{siunitx} % Provides consistent handling of numbers and units
\RequirePackage[capitalise,nameinlink]{cleveref} % Enhances cross-referencing with capitalization and links
\RequirePackage{acro} % Manages acronyms with extended functionality
\RequirePackage{tabu} % Provides enhanced table functionalities
\RequirePackage{multirow} % Allows multi-row cells in tables
\RequirePackage{tabularx} % Provides tables with flexible column widths
\RequirePackage{booktabs} % Enhances table appearance with better horizontal lines
\RequirePackage{adjustbox} % Provides additional options for adjusting boxes and figures
\RequirePackage{float} % Provides improved control over figure and table placement
\RequirePackage{indentfirst} % Indents the first paragraph of each section
\RequirePackage[intoc]{nomencl} % Creates and manages a nomenclature (list of symbols)
\RequirePackage{placeins} % Provides the \FloatBarrier command to control float placement and prevent floats from passing certain points in the text.
\RequirePackage{csquotes} % Provides advanced quotation facilities and consistent formatting for quotations, integrates well with biblatex.
\RequirePackage{derivative} % Simplifies notation for derivatives (partial, total, directional) in mathematical documents.
\RequirePackage{caption} % Allows customization of captions for figures and tables, including formatting and placement options.
\RequirePackage[subcaption] % Enables the creation of subfigures and subtables, allowing for labeled and referenced sub-entities within a main figure or table.
\RequirePackage[casesstyle]{cases} % Provides a way to format piecewise functions with cases, using the 'casesstyle' option for neat formatting.
\captionsetup{justification=centering} % Centers the captions for figures and tables, providing a more uniform appearance.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Font Setup %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the ArrusBT font family
\newfontfamily\arrusbt[
    Path = fonts/,
    Extension = .ttf,
    UprightFont = *-Roman,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic,
    UprightFeatures = { SmallCapsFont = {*-SmallCap}, SmallCapsFeatures = {} },
    BoldFeatures = { SmallCapsFont = {*-SmallCapBold}, SmallCapsFeatures = {} }
]{ArrusBT}

% Define the GillSansStd font family
\newfontfamily\gillsans[
    Path = fonts/,
    Extension = .otf,
    Ligatures = TeX,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic,
    FontFace={l}{n}{*-Light},
    FontFace={l}{it}{*-LightItalic}
]{GillSansStd}

% Set the default title font
\def\titlefont{\arrusbt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Colors %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Define the University of Coimbra style colors.
\definecolor{uc-cyan}{cmyk}{1,0,0,0}
\definecolor{uc-font}{cmyk}{0.44,0.50,0.68,0.45}

\if@msc
    \definecolor{uc-cover}{cmyk}{0.17,0.27,0.45,0.04}
\else
    \definecolor{uc-cover}{cmyk}{0.17,0.26,0.67,0.04}
\fi

\definecolor{title}{cmyk}{0,0,0,1}

% Additional color definitions
\definecolor{uc-black}{cmyk}{0,0,0,1}
\definecolor{uc-white}{cmyk}{0,0,0,0}
\definecolor{uc-green}{HTML}{00703C}
\definecolor{uc-gold}{HTML}{A99A6F}

% Faculty colors
\definecolor{fluc}{HTML}{00447F}
\definecolor{fduc}{HTML}{BE0C15}
\definecolor{fctuc}{HTML}{0096D6}
\definecolor{fmuc}{HTML}{FFC425}
\definecolor{ffuc}{HTML}{53247F}
\definecolor{feuc}{HTML}{EB352E}
\definecolor{fpceuc}{HTML}{F99D31}
\definecolor{fcdefuc}{HTML}{551900}
\definecolor{fcdefuc-pearl}{HTML}{FFF6DC}

% Additional institutional colors
\definecolor{cauc}{HTML}{898C8C}
\definecolor{iiiuc}{HTML}{4D868E}
\definecolor{icnasuc}{HTML}{009D98}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Thesis Info %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Redefine the title command to accept an optional subtitle. This is the title for the Main Language
\renewcommand*\title[2]{%
    \def\@title{#1}%
    \def\@subtitle{#2}%
}

%% Define the title in the Secondary Language command.
\newcommand*\alttitle[2]{%
    \def\@alttitle{#1}%
    \def\@altsubtitle{#2}%
}

%% Redefine the author command to add the name to the PDF meta data.
\renewcommand*\author[1]{%
    \def\@author{#1}%
}

%% Define the masters command.
\newcommand*\graduation[3]{%
    % \def\@degree{#1}%
    \def\@area{#1}%
    \def\@speciality{#2}%
    \def\@longdegree{#3}%
}

%% Define the supervisor command.
\newcommand*\supervisor[3]{%
    \def\@supervisortitle{#1}%
    \def\@supervisorposition{#2}%
    \def\@supervisor{#3}%
}

%% Define the cosupervisor command.
\newcommand*\cosupervisor[3]{%
    \def\@cosupervisortitle{#1}%
    \def\@cosupervisorposition{#2}%
    \def\@cosupervisor{#3}%
}

%% Define the president of the jury command.
\newcommand*\president[3]{%
    \def\@presidenttitle{#1}%
    \def\@presidentposition{#2}%
    \def\@president{#3}%
}

%% Define the vowel of the jury command.
\newcommand*\vowel[3]{%
    \def\@voweltitle{#1}%
    \def\@vowelposition{#2}%
    \def\@vowel{#3}%
}

%% Define the affiliation command.
\newcommand*\affiliation[1]{\def\@affiliation{#1}}

%% Define the date command.
\newcommand*\thesisdate[2]{%
    \def\@month{#1}%
    \def\@year{#2}%
}

%% Define the first institution command.
\newcommand\institution[2]{%
    \def\@institution{#1}%
    \def\@institutionlogo{#2}%
}

%% Define the second institution command.
\newcommand\coinstitution[2]{%
    \def\@coinstitution{#1}%
    \def\@coinstitutionlogo{#2}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Language Captions %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define captions for English.
\addto\captionsenglish{%
    \def\acknowlcaption{Acknowledgements}%
    \def\annexcaption{Annex}%
    \def\authorcaption{Author}%
    \def\covercaption{Cover}%
    \def\dedicationcaption{Dedication}%
    \def\institutioncaption{Institutional Collaboration}%
    \def\jurycaption{Jury}%
    \def\keywordscaption{Keywords}%
    \def\acronymcaption{List of Abbreviations and Acronyms}%
    \def\presidentcaption{President}%
    \def\supervisorcaption{Supervisor}%
    \def\cosupervisorcaption{Supervisors}%
    \def\titlepagecaption{Title Page}%
    \def\vowelcaption{Vowel}%
    \def\degree{Master}%
    \def\thesis{Dissertation}%
    \def\keythesiscover{\thesis\ within the scope of the \@longdegree\ supervised by \@supervisortitle\ \@supervisor\ and presented to \@affiliation}%
    \def\keythesistitle{Submitted in Partial Fulfilment of the Requirements for the Degree of \degree\ in \@area\ in the speciality of \@speciality}%
    \def\monthyear{\@month\ of \@year}%
}

% Define captions for Portuguese.
\addto\captionsportuguese{%
    \def\acknowlcaption{Agradecimentos}%
    \def\annexcaption{Anexo}%
    \def\authorcaption{Autor}%
    \def\covercaption{Capa}%
    \def\dedicationcaption{Dedicatória}%
    \def\institutioncaption{Colaboração Institucional}%
    \def\jurycaption{Júri}%
    \def\keywordscaption{Palavras Chave}%
    \def\acronymcaption{Lista de Abreviações e Acrónimos}%
    \def\presidentcaption{Presidente}%
    \def\supervisorcaption{Orientador}%
    \def\cosupervisorcaption{Orientadores}%
    \def\titlepagecaption{Página de Título}%
    \def\vowelcaption{Vogal}%
    \def\degree{Mestre}%
    \def\thesis{Dissertação}%
    \def\keythesiscover{\thesis\ no âmbito do \@longdegree\ orientado por \@supervisortitle\ \@supervisor\ e apresentada \@affiliation}%
    \def\keythesistitle{\thesis\ apresentada para a obtenção do grau de \degree\ em \@area\ na Especialidade de \@speciality}%
    \def\monthyear{\@month\ de \@year}%
}

%% Define captions for Spanish.
\addto\captionsspanish{%
    \def\acknowlcaption{Agradecimientos}%
    \def\annexcaption{Anexo}%
    \def\authorcaption{Autor}%
    \def\covercaption{Portada}%
    \def\dedicationcaption{Dedicatoria}%
    \def\institutioncaption{Colaboración Institucional}%
    \def\jurycaption{Jurídico}%
    \def\keywordscaption{Palabras Clave}%
    \def\acronymcaption{Lista de Abreviaturas y Acrónimos}%
    \def\presidentcaption{Presidente}%
    \def\supervisorcaption{Supervisor}%
    \def\cosupervisorcaption{Supervisores}%
    \def\titlepagecaption{Página de Título}%
    \def\vowelcaption{Vocal}%
    \def\degree{Máster}%
    \def\thesis{Tesis}%
    \def\keythesiscover{\thesis\ en el marco del \@longdegree\ supervisada por \@supervisortitle\ \@supervisor\ y presentada a \@affiliation}%
    \def\keythesistitle{Presentada para la obtención del título de \degree\ en \@area\ en la especialidad de \@speciality}%
    \def\monthyear{\@month\ de \@year}%
}

% Define captions for French.
\addto\captionsfrench{%
    \def\acknowlcaption{Remerciements}%
    \def\annexcaption{Annexe}%
    \def\authorcaption{Auteur}%
    \def\covercaption{Couverture}%
    \def\dedicationcaption{Dédicace}%
    \def\institutioncaption{Collaboration Institutionnelle}%
    \def\jurycaption{Jury}%
    \def\keywordscaption{Mots-Clés}%
    \def\acronymcaption{Liste des Abréviations et Acronymes}%
    \def\presidentcaption{Président}%
    \def\supervisorcaption{Directeur}%
    \def\cosupervisorcaption{Directeurs}%
    \def\titlepagecaption{Page de Titre}%
    \def\vowelcaption{Membre du Jury}%
    \def\degree{Maîtrise}%
    \def\thesis{Mémoire}%
    \def\keythesiscover{\thesis\ dans le cadre du \@longdegree\ supervisé par \@supervisortitle\ \@supervisor\ et présenté à \@affiliation}%
    \def\keythesistitle{Soumis en vue de l’obtention du diplôme de \degree\ en \@area\ dans la spécialité de \@speciality}%
    \def\monthyear{\@month\ de \@year}%
}

% Redefine the nomenclature name in each language.
\addto\captionsenglish{\renewcommand{\nomname}{Nomenclature}}
\addto\captionsportuguese{\renewcommand{\nomname}{Nomenclatura}}
\addto\captionsspanish{\renewcommand{\nomname}{Nomenclatura}}
\addto\captionsfrench{\renewcommand{\nomname}{Nomenclature}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Keys %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define faculty logo based on the selected faculty option.
\if@fcdefuc\def\@faculty{institutional/FCDEFUC_H_FundoClaro}
    \else\if@fctuc\def\@faculty{institutional/FCTUC_H_FundoClaro}
    \else\if@fduc\def\@faculty{institutional/FDUC_H_FundoClaro}
    \else\if@feuc\def\@faculty{institutional/FEUC_H_FundoClaro}
    \else\if@ffuc\def\@faculty{institutional/FFUC_H_FundoClaro}
    \else\if@fluc\def\@faculty{institutional/FLUC_H_FundoClaro}
    \else\if@fmuc\def\@faculty{institutional/FMUC_H_FundoClaro}
    \else\if@fpceuc\def\@faculty{institutional/FPCEUC_H_FundoClaro}
\fi\fi\fi\fi\fi\fi\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Packages Setup %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Acronym Setup
% \acsetup{hyperref = true}

%% Add the title and author to the PDF meta data. Sets hyperlinks colours to title colour.
\hypersetup{
    colorlinks = true,
    citecolor = title,
    linkcolor = title,
    urlcolor = title,
    pdftitle = \@title,
    pdfauthor = \@author
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Pages %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% We use A4 paper with predefined margins
\geometry{a4paper,top=2.5cm,bottom=2.5cm,inner=3cm,outer=2.5cm}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}
%% Page header and footer fancy style is the same for all pages
%% Defining fancy style for the main matter
\pagestyle{fancy}
\fancyhf{}
%% Page numbers on the bottom inner side of the page
\fancyfoot[LE,RO]{\titlefont\thepage}
%% Author name on the bottom left odd
\fancyfoot[LO]{\titlefont\@author}
%% Year on the bottom right even
\fancyfoot[RE]{\titlefont\@year}
%% Chapter name on the right (odd) page.
\fancyhead[LE]{\titlefont\nouppercase{\leftmark}}
%% Section name on the left (even) page.
\fancyhead[RO]{\titlefont\@title}
    
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\setlength{\headheight}{15pt}% ...at least 14.49998pt

%% Defining fancy style for the frontmatter and plain the same as main matter
\fancypagestyle{frontmatter}{}
\fancypagestyle{plain}{}
\fancypagestyle{mainmatter}{}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}
% \renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {}
    {\fontsize{18pt}{18pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}
    {}% format
    {\fontsize{18pt}{18pt}\bfseries\thechapter.\ }% label
    {0pt}% sep
    {\fontsize{18pt}{18pt}\bfseries\color{title}}% before
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed in the title color.
\titleformat{\section}
    {}
    {\fontsize{16pt}{16pt}\bfseries\thesection.\ }
    {0pt}
    {\fontsize{16pt}{16pt}\bfseries\color{title}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller font.
\titleformat{\subsection}
    {}
    {\fontsize{14pt}{14pt}\bfseries\thesubsection.\ }
    {0pt}
    {\fontsize{14pt}{14pt}\bfseries\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but are not preceded by a number.
\titleformat{\subsubsection}
    {}
    {}
    {0pt}
    {\bfseries\color{title}}
%% Subsubsections are preceded by an empty line and do not appear in the table of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}


% %% Appendix
\renewcommand\appendix{\par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \renewcommand*{\theHsection}{\thesection}%
    \renewcommand*{\theHchapter}{\thechapter}%
    \gdef\@chapapp{\appendixname}%
    \gdef\thechapter{\appendixname\ \@Alph\c@chapter}%
    \titleformat{\chapter}
    {}% format
    {\fontsize{18pt}{18pt}\bfseries \thechapter.\ }% label
    {0pt}% sep
    {\fontsize{18pt}{18pt}\bfseries\color{title}}% before
    \dottedcontents{chapter}[7.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{6.5em}{0pc}%
}
% %% Annex
\newcommand\annex{\par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \renewcommand*{\theHsection}{\thesection}%
    \renewcommand*{\theHchapter}{\thechapter}%
    \gdef\@chapapp{\annexcaption}%
    \gdef\thechapter{\annexcaption\ \@Alph\c@chapter}%
    \titleformat{\chapter}
    {}% format
    {\fontsize{18pt}{18pt}\bfseries \thechapter.\ }% label
    {0pt}% sep
    {\fontsize{18pt}{18pt}\bfseries\color{title}}% before
    \dottedcontents{chapter}[5.75em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{5em}{0pc}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Cover %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*\makecover[1][]{%
    %% Create a colored empty page with the required margins.
    \clearpage%
    \newgeometry{top=2.5cm,bottom=2.5cm,inner=2.5cm,outer=2.5cm}%
    \pagecolor{uc-cover}
    \thispagestyle{empty}%
    \pdfbookmark{\covercaption}{\covercaption}

    \setlength{\parindent}{0pt}
        \begin{center}
        \includegraphics[height=7 cm]{institutional/UC_V_Capa}
        \vspace{2.5 cm}
    
        \arrusbt\color{uc-font}\fontsize{18pt}{18pt}\selectfont\@author\\
        \vspace{2.5 cm}
    
        \arrusbt\color{uc-font}\fontsize{22pt}{22pt}\selectfont\textbf{{\@title}}
        \ifx\@subtitle\undefined\else
            \\
            \fontsize{20pt}{20pt}\selectfont{\@subtitle}
        \fi
        %% Print the affiliation.
        \vfill
        \arrusbt\color{uc-font}\fontsize{12pt}{12pt}\selectfont\textbf{\keythesiscover}\\
        \vspace{2 cm}
        \arrusbt\color{uc-font}\fontsize{16pt}{16pt}\selectfont \monthyear
        \vspace{2.5 cm}
    \end{center}
    
    %% Restore the margins and turn the page white again.
    \restoregeometry%
    \pagecolor{white}%
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Titlepage %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*\maketitlepage{%
    \clearpage%
    \thispagestyle{empty}%
    \pdfbookmark{\titlepagecaption}{\titlepagecaption}
    \newgeometry{top=2cm,bottom=1cm,inner=3cm,outer=2cm}%
    \setlength{\parindent}{0pt}
    \includegraphics[width=\textwidth]{\@faculty}\\[2\baselineskip]
    \fontsize{20pt}{20pt}\textbf{\@title}\\
    \keythesistitle\\[1.5\baselineskip]
    \fontsize{16pt}{16pt}\textbf{\@alttitle}\\[1\baselineskip]
    \fontsize{12pt}{12pt}\textbf{\authorcaption}\\
    \fontsize{16pt}{16pt}\textbf{\@author}\\
    
    \ifx\@cosupervisor\undefined
        \fontsize{12pt}{12pt}\textbf{\supervisorcaption}\\
        \fontsize{16pt}{16pt}\textbf{\@supervisor}\\
    \else
        \fontsize{12pt}{12pt}\textbf{\cosupervisorcaption}\\
        \fontsize{16pt}{16pt}\textbf{\@supervisor}\\
        \fontsize{16pt}{16pt}\textbf{\@cosupervisor}\\
    \fi
    
    \fontsize{12pt}{12pt}\textbf{\jurycaption}
    \begin{table}[h]
    \begin{tabu} to \textwidth {@{} X[l] X[5,l] @{}}
    \multirow{2}{*}{\textbf{\presidentcaption}} & \textbf{\@presidenttitle}\ \fontsize{14pt}{14pt}\textbf{\@president} \\
        & \textbf{\@presidentposition} \\[5pt]
    \multirow{2}{*}{\textbf{\supervisorcaption}} & \textbf{\@supervisortitle}\ \fontsize{14pt}{14pt}\textbf{\@supervisor} \\
        & \textbf{\@supervisorposition} \\[5pt]
    \multirow{2}{*}{\textbf{\vowelcaption}} & \textbf{\@voweltitle}\ \fontsize{14pt}{14pt}\textbf{\@vowel} \\
        & \textbf{\@vowelposition}
    \end{tabu}
    \end{table}\\[\baselineskip]
    
    \ifx\@institution\undefined
    \else
        \ifx\@coinstitution\undefined
        \fontsize{12pt}{12pt}\textbf{\institutioncaption} \hrule
        \begin{table}[h]
            \begin{tabu} to \textwidth {@{} *{2}{X[m,c]} @{}}
                \@institutionlogo & \textbf{\@institution}
            \end{tabu}
        \end{table}
        \else
        \fontsize{12pt}{12pt}\textbf{\institutioncaption} \hrule
        \begin{table}[h]
            \begin{tabu} to \textwidth {@{} *{5}{X[m,c]} @{}}
                \@institutionlogo & \textbf{\@institution} & & \@coinstitutionlogo & \textbf{\@coinstitution}
            \end{tabu}
        \end{table}
        \fi
    \fi
    
    \vfill
    \fontsize{14pt}{14pt}\textbf{Coimbra, \@month, \@year}
    \restoregeometry%
    \setlength{\parindent}{1.5em}
    \cleardoublepage
    \fontsize{12}{12}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Dedication %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define the dedication
\newcommand\dedication[1]{\def\@dedication{#1}}
%% Print the dedication
\newcommand*\makededication{%
    \clearpage%
    \thispagestyle{empty}%
    \pdfbookmark{\dedicationcaption}{\dedicationcaption}
    \mbox{}
    \vfill
    \begin{flushright}
            \slshape\@dedication
    \end{flushright}
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Acknowledgements %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define the dedication
\newcommand\acknowledgement[1]{\def\@acknowledgement{#1}}
%% Print the dedication
\newcommand*\makeacknowledgement{%
    \clearpage%
    \chapter*{\acknowlcaption}
    \label{cha:acknowledge}
    \addcontentsline{toc}{chapter}{\nameref{cha:acknowledge}}
    \@acknowledgement
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Abstract %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define the abstract in two languages
\newcommand\thesisabstract[2]{%
    \def\@abstract{#1}%
    \def\@altabstract{#2}%
}

%% Define the keywords in two languages
\newcommand*\thesiskeywords[2]{%
    \def\@keywords{#1}%
    \def\@altkeywords{#2}%
}
%% Print the abstract
\newcommand*\langabstract[3]{%
    \begin{otherlanguage}{#1}
        \chapter*{\abstractname}
        \label{cha:\abstractname}
        \addcontentsline{toc}{chapter}{\nameref{cha:\abstractname}}
        #2%
        
        \vspace{\baselineskip}
        
        \noindent\textbf{\keywordscaption: } #3%
    \end{otherlanguage}
}

\newcommand*\makeabstract{%
    \clearpage%
    \langabstract{\primarylang}{\@abstract}{\@keywords}
    \cleardoublepage
    \langabstract{\secondarylang}{\@altabstract}{\@altkeywords}
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Acronyms %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*\listofacronyms{%
    \chapter*{\acronymcaption}
    \label{cha:acro}
    \addcontentsline{toc}{chapter}{\nameref{cha:acro}}
    \printacronyms[heading=none]
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Nomenclature %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\nomunit}[1]{\renewcommand{\nomentryend}{\hspace*{\fill}#1}}
\newcommand\Nomenclature[3][X]{\nomenclature[#1#3]{#2}{#3}}

% \renewcommand\nomgroup[1]{%
%  \item[\large\bfseries
%   \ifstrequal{#1}{Z}{Acronyms}{%
%   \ifstrequal{#1}{A}{}{%
%   \ifstrequal{#1}{G}{Greek Symbols}{%
%   \ifstrequal{#1}{S}{Superscripts}{% 
%   \ifstrequal{#1}{U}{Subscripts}{%   
%   \ifstrequal{#1}{X}{Other Symbols}{}}}}}}]%
%  }