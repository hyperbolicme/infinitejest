%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Edited by hyperbolicme for self.
% anjuzabil@gmail.com
% January 2011
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a class for LaTeX2e that should format a report as per
% the IITM Thesis guidelines.  The page layout is set using the
% geometry package.  The double/singlespacing is setup using
% setspace.  Figure captions are set using the hang option of
% caption2.  natbib is used to do the citation using an
% author-year format. I've made an iitm.bst file that formats 
% the references as per the IITM guidelines.
%
% To use this class do the following:
%  \documentclass[options]{iitmdiss} 
%
% Options:
%
%   PhD, MS, MTech or BTech -- generates the appropriate title page
%   and loads the report class.
%
%   synopsis -- Generates the title page for the synopsis.  This also
%   loads the article class instead of the report.
%  
% Example:
%
% \documentclass[PhD,synopsis]{iitmdiss}
% \documentclass[MS]{iitmdiss}
%
% IMPORTANT NOTICE:
% 
%   PLEASE DO NOT MESS WITH THE MARGINS AND GENERAL FORMATTING SETUP
%   IN THIS FILE UNLESS YOU ARE ABSOLUTELY SURE THAT THE FORMAT DOES NOT
%   MATCH WITH THE THESIS GUIDELINES.  FOR EXAMPLE, DO NOT CHANGE THE 
%   MARGINS AND SPACING JUST TO MAKE YOUR THESIS LARGER!
% 
% Notes:
%
%   * I am using as much of the Thesis guidelines for the spacing
%     and margins as I can.
%   * I have used newdiss.cls by R.~K.~Hariram, U.~V.~Ravindra et al. 
%     as a reference and a source for some of the macros.
%   * This class will assume a4paper with 12pt fonts.
%   * I am no TeXpert so feel free to clean up the mess.
%
% Prabhu Ramachandran <prabhu@ae.iitm.ac.in>
% March 2005.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{iitmdiss_as}[2012/01/01 Class for IIT-Madras
Dissertations - hacked by hyperbolicme. Base iitmdiss 2005/03/09]

\newif\if@PhD
\newif\if@MS
\newif\if@MTech
\newif\if@BTech
\newif\if@Synopsis

\DeclareOption{PhD}{\@PhDtrue}
\DeclareOption{MS}{\@MStrue}
\DeclareOption{MTech}{\@MTechtrue}
\DeclareOption{BTech}{\@BTechtrue}
\DeclareOption{synopsis}{\@Synopsistrue}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Load the correct class.
\if@Synopsis
    \LoadClass[12pt,a4paper]{article}
\else
   \LoadClass[12pt,a4paper,twoside]{report}
%    \LoadClass[12pt,a4paper]{report}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry and page layout
%
% \RequirePackage[compat2,a4paper,left=1.5in,right=1in,top=1in,bottom=0.667in,
%                 nohead]{geometry}[2002/07/08]    % For no headers
\RequirePackage[compat2,a4paper,left=1in,right=1in,top=1in,bottom=0.667in,
                ]{geometry}[2002/07/08] % With space for header. Changed
                                % margins to accommodate twopage.
\pagestyle{empty}  % Will be set to {headings} for headers in
                   % thesis.tex after title and preamble pages.

\parskip 8pt

\renewcommand{\@pnumwidth}{2.5em}
%\renewcommand{\@tocrmarg}{2.5em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Using setspace to do the single/double spacing.  Setspace also
%% makes all tables and figures have single spacing automatically.
\RequirePackage{setspace} 

% package atbeginend MESSES UP A LOT OF SYNTAX.
%\RequirePackage{atbeginend} % To wrap/encapsule an environ 
%                            %  around/inside another.
% --EITHER- 1.5 spacing -EITHER--
% \def \thesisspace {1.5}
% \setstretch{\thesisspace}  % 1.5 spaces out more than command
%                            %  onehalfspacing/environ onehalfspace. 
%
% --OR- onehalfspacing -OR--
\def \thesisspacing{\onehalfspacing}
\thesisspacing              % More appealing.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The figure captioning is done correctly via the hang option.
\RequirePackage[hang]{caption}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other useful macros.  Many of these are modifications from newdiss.cls

\def\department#1{\gdef\@department{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The title page

\def\maketitle{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \newpage
  \null
%  \setcounter{page}{0}
  \parskip=0pt
  \begin{center}%
  \let \footnote \thanks
  \vglue 0in % this makes top margin 2in
  \vskip -5ex%
  \if@Synopsis
    {\large \em SYNOPSIS OF \par}
  \fi
    {\Large \bf \expandafter{\@title} \par}%
    \vskip 10ex%
    {\normalsize
      \if@PhD % PhD THESIS
         {\em A THESIS }\par
         \vskip 5ex%
         \if@Synopsis
            {\normalsize \em to be submitted by \par}
         \else
            {\normalsize \em submitted by \par}
         \fi
         \vskip 5ex%
         {\bf \large\MakeUppercase{\@author}\par\par}
         \vskip 5ex%
         {\em for the award of the degree }\par
         \vskip 5ex%
         {\em of} \par
         \vskip 5ex%
         {\bf \large \MakeUppercase{Doctor of Philosophy}} \par
       \else
         \if@MS
            {\em A THESIS }\par
            \vskip 5ex%
            {\normalsize \em submitted by \par}
            \vskip 5ex%
            {\bf \large\MakeUppercase{\@author}\par\par}
            \vskip 5ex%
            {\em for the award of the degree }\par
            \vskip 5ex%
            {\em of} \par
            \vskip 5ex%
            {\bf \large \MakeUppercase{Master Of Science}} \par
            (by Research) \par
         \else
           {\em A Project Report }\par
           \vskip 5ex%
           {\normalsize \em submitted by \par}
           \vskip 5ex%
           {\bf \large\MakeUppercase{\@author}\par\par}
           \vskip 5ex%
           {\normalsize \em in partial fulfilment of the requirements\par
             for the award of the degree of \par}
           \vskip 5ex%
           \if@MTech %%% M Tech
             {\bf MASTER OF TECHNOLOGY}
           \fi
           \if@BTech %%% B Tech
              {\bf BACHELOR OF TECHNOLOGY}
           \fi
         \fi
      \fi
    }
  \end{center}%

  \vspace*{0.75in}
  %\centerline{\psfig{figure=emblem.ps}}
%  \centerline{\includegraphics{iitm.eps}}
  \centerline{\includegraphics[scale=1.]{iitm}}
  \vspace*{-0.15in}
  \begin{center}
    {\bf \large DEPARTMENT OF \@department\par}
    {\bf \large INDIAN INSTITUTE OF TECHNOLOGY, MADRAS}
    \vglue 0.50em
    {\bf \large \@date}\par
  \end{center}
  \parskip 8pt
}

\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\newpage}

\if@Synopsis
   \renewcommand\refname{REFERENCES}
\else
   % QUOTATIONS
   %
   \def\quotationsheadingstr{Quotations}%{QUOTATIONS}
   \def\quotations{\chapter*{ \quotationsheadingstr}
   %\addcontentsline{toc}{chapter}{QUOTATIONS}
   }

   % DEDICATION
   %
   \def\dedicationheadingstr{Dedication}
   \def\dedication{\chapter*{\dedicationheadingstr}%{\centerline{DEDICATION}}
   %\addcontentsline{toc}{chapter}{DEDICATION}
   }

   % CERTIFICATE
   %
   %   - this produces a certificate page as per IITM Regulations
   %     comment the following lines out to get it working.
   %
%   \def\certheadingstr{\sc \centering Thesis Certificate}
 %   \def\certificate{%% A preliminary chapter
% %     \clearpage
% %     \vspace*{36pt}
%      \chapter*{\certheadingstr}
% %     \centerline{\Large \bf \certheadingstr}%THESIS CERTIFICATE}
% %     \vskip 25pt
%      \thispagestyle{empty}
% %     \typeout{Certificate}
%      \setcounter{page}{0}
%    }

   % ACKNOWLEDGEMENTS
   %
   \def\ackheadingstr{Acknowledgements}
   \def\acknowledgements{\chapter*{\ackheadingstr}%{\centerline{ACKNOWLEDGEMENTS}}
     %\addcontentsline{toc}{chapter}{\ackheadingstr}
   }

   % ABSTRACT
   %   - this produces pages suitable for an IITM Abstract
   \def\abstractheadingstr{Abstract}
   \def\abstract{\chapter*{\abstractheadingstr}%{\centerline{ABSTRACT}}
   \addcontentsline{toc}{chapter}{\abstractheadingstr}
   }


   % ABBREVIATIONS
   %
   \def\abbrvheadingstr{Abbreviations and Notations}
   \def\abbreviations{\chapter*{\abbrvheadingstr}
   \addcontentsline{toc}{chapter}{\abbrvheadingstr}
   }

%    % Notations
%    %
%    \def\glossaryheadingstr{Notations}
%    \def\notations{\chapter*{\glossaryheadingstr}
%    \addcontentsline{toc}{chapter}{\glossaryheadingstr}
%    }

   % Use the nomencl package for the NOTATION section.

   % Makes the chapter heading
   \def\@makechapterhead#1{%
     {\parindent \z@ \raggedright \normalfont
       \ifnum \c@secnumdepth >\m@ne
       \begin{center}
         \Large\bfseries \@chapapp\space \thechapter
       \end{center}
       \par\nobreak
       \vskip 20\p@
       \fi
       \interlinepenalty\@M
       \Large \bf
       \begin{center}
         #1\par\nobreak      
       \end{center}
       \vskip 20\p@
       \thispagestyle{empty}
     }}

   % Makes the chapter heading for \chapter* commands
   \def\@makeschapterhead#1{%
     \vspace*{25\p@}%
     {\parindent \z@ \raggedright
       \normalfont
       \interlinepenalty\@M
       \Large \bfseries #1\par\nobreak
       \vskip 20\p@
     }}


   %LIST OF PAPERS
   \def\listofpapers{ \normalbaselines
     \chapter*{List of Papers }%{\centerline{LIST OF PAPERS
     % BASED ON THESIS}}
     \markboth{List of papers based on thesis}{List of papers based on
       thesis}
     % \addcontentsline{toc}{chapter}{LIST OF PAPERS BASED ON THESIS}
   }

   
   % CV
   \def\cvheadingstr{Curriculum Vitae}
   \def\CV{\chapter*{\cvheadingstr}}%{\centerline{CURRICULUM VITAE}}}

   % Comittee
   \if@PhD
       \def\committee{\chapter*{Doctoral
           Committee}}%{\centerline{DOCTORAL COMMITTEE}}} 
   \else
       \if@MS
          \def\committee{\chapter*{General Test
              Committee}}%{\centerline{GENERAL TEST COMITTEE}}} 
        \fi
   \fi

\fi

%% hyperbolicme: changing overall font to Computer Modern Roman
\renewcommand\familydefault{cmr}
